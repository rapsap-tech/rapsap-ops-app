import 'dart:convert';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/network/interceptors/auth_interceptor.dart';
import 'package:rapsap_ops_app/core/network/network_events.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';

class _MockStorage extends Mock implements SecureStorageService;

/// Accepts only the "new" token; counts refresh calls.
class _FakeServer implements HttpClientAdapter {
  int refreshCalls = 0;
  bool refreshFails = false;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    if (options.path.endsWith('/auth/refresh')) {
      refreshCalls++;
      if (refreshFails) return _json(401, {'success': false});
      return _json(200, {
        'success': true,
        'data': {'access_token': 'new', 'refresh_token': 'r2'},
      });
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
  String? access;

  setUp(() {
    storage = _MockStorage();
    server = _FakeServer();
    events = NetworkEvents();
    access = 'old';
    when(() => storage.accessToken).thenAnswer((_) async => access);
    when(() => storage.refreshToken).thenAnswer((_) async => 'r1');
    when(
      () => storage.saveTokens(
        accessToken: any(named: 'accessToken'),
        refreshToken: any(named: 'refreshToken'),
      ),
    ).thenAnswer((invocation) async {
      access = invocation.namedArguments[#accessToken] as String;
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

  test('clears session and emits sessionExpired when refresh fails', () async {
    server.refreshFails = true;
    final emitted = expectLater(
      events.stream,
      emits(NetworkEvent.sessionExpired),
    );
    await expectLater(dio.get<dynamic>('/a'), throwsA(isA<DioException>()));
    await emitted;
    verify(storage.clear).called(1);
  });

  test('does not refresh when no token was sent', () async {
    access = null;
    await expectLater(dio.get<dynamic>('/a'), throwsA(isA<DioException>()));
    expect(server.refreshCalls, 0);
  });
}
