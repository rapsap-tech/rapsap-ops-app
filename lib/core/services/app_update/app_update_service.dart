import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rapsap_ops_app/core/services/app_update/app_config_source.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';

/// Compares the installed version with the server `min_version` (PLAT-04).
@lazySingleton
class AppUpdateService {
  new(this._source, this._packageInfo);

  final AppConfigSource _source;
  final PackageInfo _packageInfo;

  /// Fails open: if the config can't load, the app keeps working.
  Future<bool> isUpdateRequired() async {
    try {
      final minVersion = await _source.fetchMinVersion();
      return isVersionLower(_packageInfo.version, minVersion);
    } on Object catch (error) {
      appLogger.w('App config check failed', error: error.runtimeType);
      return false;
    }
  }

  static bool isVersionLower(String current, String minimum) {
    final a = _parts(current);
    final b = _parts(minimum);
    for (var i = 0; i < 3; i++) {
      if (a[i] != b[i]) return a[i] < b[i];
    }
    return false;
  }

  static List<int> _parts(String version) {
    final parts = version.split('+').first.split('.');
    return List.generate(
      3,
      (i) => i < parts.length ? int.tryParse(parts[i]) ?? 0 : 0,
    );
  }
}
