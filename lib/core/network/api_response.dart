import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';

/// Parses the assumed `{success, data, message}` envelope
/// (see docs/api_pending.md). Malformed bodies become a ServerException.
class ApiResponse {
  new _();

  static T parse<T>(Object? body, T Function(Object? data) fromData) {
    if (body is! Map<String, dynamic>) throw const ServerException();
    if (body['success'] == false) throw const ServerException();
    try {
      return fromData(body['data']);
    } on Object catch (error) {
      appLogger.w('Malformed response', error: error.runtimeType);
      throw const ServerException();
    }
  }
}
