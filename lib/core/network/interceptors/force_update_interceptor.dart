import 'package:dio/dio.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/network/network_events.dart';

class ForceUpdateInterceptor extends Interceptor {
  new(this._events);

  final NetworkEvents _events;

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == HttpStatusCodes.upgradeRequired) {
      _events.emit(NetworkEvent.forceUpdateRequired);
    }
    handler.next(err);
  }
}
