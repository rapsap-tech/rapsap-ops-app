import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';

abstract class AppConfigSource {
  Future<String> fetchMinVersion();
}

@realApi
@LazySingleton(as: AppConfigSource)
class RemoteAppConfigSource implements AppConfigSource {
  new(this._client);

  final DioClient _client;

  @override
  Future<String> fetchMinVersion() => _client.get(
    ApiConstants.app.config,
    fromData: (data) =>
        (data! as Map<String, dynamic>)['min_version'] as String,
  );
}

@fakeApi
@LazySingleton(as: AppConfigSource)
class FakeAppConfigSource implements AppConfigSource {
  @override
  Future<String> fetchMinVersion() async => '1.0.0';
}
