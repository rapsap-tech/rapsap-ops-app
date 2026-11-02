import 'package:rapsap_ops_app/core/services/install/install_service.dart';

InstallService createInstallService() => _MobileInstallService();

class _MobileInstallService implements InstallService {
  @override
  bool get isRequired => false;

  @override
  InstallMode get mode => InstallMode.notNeeded;

  @override
  Stream<InstallMode> get modeChanges => const Stream.empty();

  @override
  Future<bool> prompt() async => false;
}
