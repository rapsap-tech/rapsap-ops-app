import 'package:dio/dio.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/network/network_info.dart';

/// Fails fast when offline instead of waiting for the connect timeout.
class ConnectivityInterceptor extends Interceptor {
  new(this._networkInfo);

  final NetworkInfo _networkInfo;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (await _networkInfo.isConnected) return handler.next(options);
    handler.reject(
      DioException(
        requestOptions: options,
        type: DioExceptionType.connectionError,
        error: const NoInternetException(),
      ),
    );
  }
}
