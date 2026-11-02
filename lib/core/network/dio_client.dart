import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/network/api_response.dart';
import 'package:rapsap_ops_app/core/network/interceptors/auth_interceptor.dart';
import 'package:rapsap_ops_app/core/network/interceptors/connectivity_interceptor.dart';
import 'package:rapsap_ops_app/core/network/interceptors/force_update_interceptor.dart';
import 'package:rapsap_ops_app/core/network/interceptors/headers_interceptor.dart';
import 'package:rapsap_ops_app/core/network/interceptors/retry_interceptor.dart';
import 'package:rapsap_ops_app/core/network/network_events.dart';
import 'package:rapsap_ops_app/core/network/network_info.dart';
import 'package:rapsap_ops_app/core/services/storage/local_storage_service.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';

/// The single HTTP client: returns parsed data or throws an AppException.
/// Logs skip headers and bodies so tokens and OTPs never reach the console.
@lazySingleton
class DioClient {
  new(
    NetworkInfo networkInfo,
    SecureStorageService secureStorage,
    LocalStorageService localStorage,
    NetworkEvents events,
    PackageInfo packageInfo,
  ) : _dio = Dio(_options) {
    _dio.interceptors.addAll([
      ConnectivityInterceptor(networkInfo),
      HeadersInterceptor(localStorage, packageInfo.version),
      AuthInterceptor(
        storage: secureStorage,
        events: events,
        refreshDio: Dio(_options),
      ),
      ForceUpdateInterceptor(events),
      RetryInterceptor(_dio),
      if (EnvConfig.instance.enableLogs) PrettyDioLogger(responseBody: false),
    ]);
  }

  final Dio _dio;

  static BaseOptions get _options => BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: ApiConstants.connectTimeout,
    receiveTimeout: ApiConstants.receiveTimeout,
    sendTimeout: ApiConstants.sendTimeout,
  );

  Future<T> get<T>(
    String path, {
    required T Function(Object? data) fromData,
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
  }) => _send(
    () => _dio.get<dynamic>(
      path,
      queryParameters: queryParameters,
      cancelToken: cancelToken,
    ),
    fromData,
  );

  Future<T> post<T>(
    String path, {
    required T Function(Object? data) fromData,
    Object? data,
    CancelToken? cancelToken,
  }) => _send(
    () => _dio.post<dynamic>(path, data: data, cancelToken: cancelToken),
    fromData,
  );

  Future<T> put<T>(
    String path, {
    required T Function(Object? data) fromData,
    Object? data,
    CancelToken? cancelToken,
  }) => _send(
    () => _dio.put<dynamic>(path, data: data, cancelToken: cancelToken),
    fromData,
  );

  Future<T> delete<T>(
    String path, {
    required T Function(Object? data) fromData,
    Object? data,
    CancelToken? cancelToken,
  }) => _send(
    () => _dio.delete<dynamic>(path, data: data, cancelToken: cancelToken),
    fromData,
  );

  Future<T> upload<T>(
    String path, {
    required FormData formData,
    required T Function(Object? data) fromData,
    ProgressCallback? onSendProgress,
    CancelToken? cancelToken,
  }) => _send(
    () => _dio.post<dynamic>(
      path,
      data: formData,
      onSendProgress: onSendProgress,
      cancelToken: cancelToken,
    ),
    fromData,
  );

  Future<T> _send<T>(
    Future<Response<dynamic>> Function() request,
    T Function(Object? data) fromData,
  ) async {
    final Response<dynamic> response;
    try {
      response = await request();
    } on Object catch (error) {
      throw ErrorMapper.toException(error);
    }
    final data = ApiResponse.parse(response.data, fromData);
    return data;
  }
}
