import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/network/interceptors/auth_interceptor.dart';
import 'package:rapsap_ops_app/core/network/network_events.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';

class _MockStorage extends Mock implements SecureStorageService;

enum _Refresh { ok, rejected, serverError, offline }

/// Accepts only the "new" token; counts refresh calls and what it received.
class _FakeServer implements HttpClientAdapter {
  int refreshCalls = 0;
  _Refresh refresh = _Refresh.ok;
  final List<String?> authHeaders = [];
  int uploadsReceived = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.path.endsWith('/auth/refresh')) {
      refreshCalls++;
      return switch (refresh) {
        _Refresh.ok => _json(200, {
          'success': true,
          'data': {'access_token': 'new', 'refresh_token': 'r2'},
        }),
        _Refresh.rejected => _json(401, {'success': false}),
        _Refresh.serverError => _json(503, {'success': false}),
        _Refresh.offline => throw DioException.connectionError(
          requestOptions: options,
          reason: 'offline',
        ),
      };
    }
    authHeaders.add(options.headers['Authorization'] as String?);
    if (requestStream != null) {
      await requestStream.drain<void>();
      uploadsReceived++;
    }
    final ok = options.headers['Authorization'] == 'Bearer new';
    return ok ? _json(200, {'success': true}) : _json(401, {});
  }

  ResponseBody _json(int status, Object body) => ResponseBody.fromString(
    jsonEncode(body),
    status,
    headers: {
      Headers.contentTypeHeader: [Headers.jsonContentType],
    },
  );

  @override
  void close({bool force = false}) {}
}

void main() {
  late _MockStorage storage;
  late _FakeServer server;
  late NetworkEvents events;
  late Dio dio;
  late int generation;
  String? access;

  setUp(() {
    storage = _MockStorage();
    server = _FakeServer();
    events = NetworkEvents();
    access = 'old';
    generation = 0;
    when(() => storage.accessToken).thenAnswer((_) async => access);
    when(() => storage.refreshToken).thenAnswer((_) async => 'r1');
    when(() => storage.generation).thenAnswer((_) => generation);
    when(
      () => storage.saveTokens(
        accessToken: any(named: 'accessToken'),
        refreshToken: any(named: 'refreshToken'),
        generation: any(named: 'generation'),
      ),
    ).thenAnswer((invocation) async {
      final from = invocation.namedArguments[#generation] as int?;
      if (from != null && from != generation) return false;
      access = invocation.namedArguments[#accessToken] as String;
      return true;
    });
    when(storage.clear).thenAnswer((_) async {});

    final options = BaseOptions(baseUrl: 'https://api.test');
    final refreshDio = Dio(options)..httpClientAdapter = server;
    dio = Dio(options)
      ..httpClientAdapter = server
      ..interceptors.add(
        AuthInterceptor(
          storage: storage,
          events: events,
          refreshDio: refreshDio,
        ),
      );
  });

  test('refreshes once for concurrent 401s and retries all', () async {
    final results = await Future.wait([
      dio.get<dynamic>('/a'),
      dio.get<dynamic>('/b'),
      dio.get<dynamic>('/c'),
    ]);
    expect(results.map((r) => r.statusCode), everyElement(200));
    expect(server.refreshCalls, 1);
  });

  test('a multipart upload is re-sent after the refresh', () async {
    final form = FormData.fromMap({
      'photo': MultipartFile.fromBytes([1, 2, 3], filename: 'p.jpg'),
    });

    final response = await dio.post<dynamic>('/upload', data: form);

    expect(response.statusCode, 200);
    expect(server.uploadsReceived, 2);
  });

  test('clears session and emits sessionExpired when the server rejects '
      'the refresh token', () async {
    server.refresh = _Refresh.rejected;
    final emitted = expectLater(
      events.stream,
      emits(NetworkEvent.sessionExpired),
    );
    await expectLater(dio.get<dynamic>('/a'), throwsA(isA<DioException>()));
    await emitted;
    verify(storage.clear).called(1);
  });

  for (final failure in [_Refresh.offline, _Refresh.serverError]) {
    test('keeps the session when the refresh fails with $failure', () async {
      server.refresh = failure;
      await expectLater(dio.get<dynamic>('/a'), throwsA(isA<DioException>()));
      verifyNever(storage.clear);
    });
  }

  test('a refresh that finishes after logout saves nothing', () async {
    when(() => storage.refreshToken).thenAnswer((_) async {
      generation++;
      return 'r1';
    });
    await expectLater(dio.get<dynamic>('/a'), throwsA(isA<DioException>()));
    expect(access, 'old');
  });

  test('does not refresh when no token was sent', () async {
    access = null;
    await expectLater(dio.get<dynamic>('/a'), throwsA(isA<DioException>()));
    expect(server.refreshCalls, 0);
  });

  test('sends the token only to our API host', () async {
    access = 'new';
    await dio.get<dynamic>('/a');
    await expectLater(
      dio.get<dynamic>('https://storage.example.com/photo.jpg'),
      throwsA(isA<DioException>()),
    );
    expect(server.authHeaders, ['Bearer new', null]);
  });
}
