import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/features/settings/data/models/notification_prefs_model.dart';

abstract class SettingsRemoteDataSource {
  Future<NotificationPrefsModel> notificationPrefs();
  Future<NotificationPrefsModel> save(NotificationPrefsModel prefs);
}

NotificationPrefsModel _parse(Object? data) =>
    NotificationPrefsModel.fromJson(data! as Map<String, dynamic>);

@realApi
@LazySingleton(as: SettingsRemoteDataSource)
class SettingsRemoteDataSourceImpl implements SettingsRemoteDataSource {
  const new(this._client);

  final DioClient _client;

  @override
  Future<NotificationPrefsModel> notificationPrefs() =>
      _client.get(ApiConstants.me.notificationSettings, fromData: _parse);

  @override
  Future<NotificationPrefsModel> save(NotificationPrefsModel prefs) =>
      _client.put(
        ApiConstants.me.notificationSettings,
        data: prefs.toJson(),
        fromData: _parse,
      );
}

@fakeApi
@LazySingleton(as: SettingsRemoteDataSource)
class FakeSettingsRemoteDataSource implements SettingsRemoteDataSource {
  NotificationPrefsModel _prefs = const NotificationPrefsModel();

  @override
  Future<NotificationPrefsModel> notificationPrefs() async => _prefs;

  @override
  Future<NotificationPrefsModel> save(NotificationPrefsModel prefs) async {
    await Future<void>.delayed(const Duration(milliseconds: 300));
    return _prefs = prefs;
  }
}
