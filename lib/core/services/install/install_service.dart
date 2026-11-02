import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/services/install/install_service_stub.dart'
    if (dart.library.js_interop) 'package:rapsap_ops_app/core/services/install/install_service_web.dart'
    if (dart.library.io) 'package:rapsap_ops_app/core/services/install/install_service_mobile.dart';

enum InstallMode { notNeeded, prompt, iosGuide, browserGuide, installed }

/// PWA install gate: phone browsers must install the app before using it.
@lazySingleton
abstract class InstallService {
  @factoryMethod
  static InstallService create() => createInstallService();

  bool get isRequired;
  InstallMode get mode;
  Stream<InstallMode> get modeChanges;

  /// Shows the browser's install dialog; true when the user accepted.
  Future<bool> prompt();
}
