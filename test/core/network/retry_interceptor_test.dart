import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/network/interceptors/retry_interceptor.dart';

/// Always answers 503 and counts calls.
class _DownServer implements HttpClientAdapter {
  int calls = 0;

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    calls++;
    return ResponseBody.fromString('', 503);
  }

  @override
  void close({bool force = false}) {}
}

void main() {
  late _DownServer server;
  late Dio dio;

  setUp(() {
    server = _DownServer();
    dio = Dio(BaseOptions(baseUrl: 'https://api.test'))
      ..httpClientAdapter = server;
    dio.interceptors.add(RetryInterceptor(dio));
  });

  test('retries a failing GET twice', () async {
    await expectLater(dio.get<dynamic>('/a'), throwsA(isA<DioException>()));
    expect(server.calls, 3);
  });

  test('never retries a POST (uploads)', () async {
    await expectLater(dio.post<dynamic>('/a'), throwsA(isA<DioException>()));
    expect(server.calls, 1);
  });
}
