import 'package:dio/dio.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/network/api_response.dart';
import 'package:rapsap_ops_app/core/network/network_events.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';

/// Adds the bearer token and refreshes it once on 401. Queued, so concurrent
/// 401s wait for the first refresh and then retry with the new token.
class AuthInterceptor extends QueuedInterceptor {
  new({
    required this._storage,
    required this._events,
    required this._refreshDio,
  });

  final SecureStorageService _storage;
  final NetworkEvents _events;
  final Dio _refreshDio;

  static const String _retriedKey = 'auth_retried';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    try {
      final token = await _storage.accessToken;
      if (token != null) options.headers['Authorization'] = 'Bearer $token';
      handler.next(options);
    } on Object catch (error) {
      handler.reject(DioException(requestOptions: options, error: error));
    }
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final request = err.requestOptions;
    final isUnauthorized =
        err.response?.statusCode == HttpStatusCodes.unauthorized;
    final sentToken = _bearer(request);
    // No token sent (e.g. OTP verify) or already retried: let the 401 through.
    if (!isUnauthorized ||
        sentToken == null ||
        request.extra[_retriedKey] == true) {
      return handler.next(err);
    }

    try {
      final current = await _storage.accessToken;
      final token = current != null && current != sentToken
          ? current
          : await _refresh();
      if (token == null) return handler.next(err);
      request
        ..headers['Authorization'] = 'Bearer $token'
        ..extra[_retriedKey] = true;
      handler.resolve(await _refreshDio.fetch<dynamic>(request));
    } on DioException catch (retryError) {
      handler.next(retryError);
    } on Object catch (error) {
      handler.next(err.copyWith(error: error));
    }
  }

  String? _bearer(RequestOptions request) =>
      (request.headers['Authorization'] as String?)?.replaceFirst(
        'Bearer ',
        '',
      );

  Future<String?> _refresh() async {
    final refreshToken = await _storage.refreshToken;
    if (refreshToken == null) {
      await _expire();
      return null;
    }
    try {
      final response = await _refreshDio.post<dynamic>(
        ApiConstants.auth.refresh,
        data: {'refresh_token': refreshToken},
      );
      final tokens = ApiResponse.parse(
        response.data,
        (data) => data! as Map<String, dynamic>,
      );
      final access = tokens['access_token'] as String;
      await _storage.saveTokens(
        accessToken: access,
        refreshToken: tokens['refresh_token'] as String,
      );
      return access;
    } on Object catch (error) {
      appLogger.w('Token refresh failed', error: error.runtimeType);
      await _expire();
      return null;
    }
  }

  Future<void> _expire() async {
    try {
      await _storage.clear();
    } finally {
      _events.emit(NetworkEvent.sessionExpired);
    }
  }
}
