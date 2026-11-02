import 'package:dio/dio.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';

/// Retries idempotent GETs on timeout/5xx with linear backoff. Never retries uploads.
class RetryInterceptor extends Interceptor {
  new(this._dio);

  final Dio _dio;

  static const String _attemptKey = 'retry_attempt';

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final attempt = (request.extra[_attemptKey] as int?) ?? 0;
    if (!_shouldRetry(err) || attempt >= AppConstants.maxGetRetries) {
      return handler.next(err);
    }
    await Future<void>.delayed(AppConstants.retryBaseDelay * (attempt + 1));
    request.extra[_attemptKey] = attempt + 1;
    try {
      handler.resolve(await _dio.fetch<dynamic>(request));
    } on DioException catch (retryError) {
      handler.next(retryError);
    }
  }

  bool _shouldRetry(DioException err) {
    if (err.requestOptions.method != 'GET') return false;
    final status = err.response?.statusCode ?? 0;
    return switch (err.type) {
      DioExceptionType.connectionTimeout ||
      DioExceptionType.receiveTimeout => true,
      DioExceptionType.badResponse =>
        status >= HttpStatusCodes.serverErrorStart,
      _ => false,
    };
  }
}
