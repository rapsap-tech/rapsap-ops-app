import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/storage_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class LocalStorageService {
  new(this._prefs);

  final SharedPreferences _prefs;

  String? get languageCode => _prefs.getString(StorageKeys.languageCode);
  Future<bool> setLanguageCode(String code) =>
      _prefs.setString(StorageKeys.languageCode, code);

  bool get onboardingSeen =>
      _prefs.getBool(StorageKeys.onboardingSeen) ?? false;
  Future<bool> setOnboardingSeen() =>
      _prefs.setBool(StorageKeys.onboardingSeen, true);
}
