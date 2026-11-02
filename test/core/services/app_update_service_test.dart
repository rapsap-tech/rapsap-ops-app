import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rapsap_ops_app/core/services/app_update/app_config_source.dart';
import 'package:rapsap_ops_app/core/services/app_update/app_update_service.dart';

class _MockSource extends Mock implements AppConfigSource;

void main() {
  group('isVersionLower', () {
    test('compares numerically, ignoring build number', () {
      expect(AppUpdateService.isVersionLower('1.2.9', '1.10.0'), isTrue);
      expect(AppUpdateService.isVersionLower('1.10.0', '1.2.9'), isFalse);
      expect(AppUpdateService.isVersionLower('1.0.0+7', '1.0.0'), isFalse);
      expect(AppUpdateService.isVersionLower('1.0', '1.0.1'), isTrue);
    });
  });

  group('isUpdateRequired', () {
    late _MockSource source;
    final info = PackageInfo(
      appName: 'ops',
      packageName: 'ops',
      version: '1.0.0',
      buildNumber: '1',
    );

    setUp(() => source = _MockSource());

    test('true when installed version is below minimum', () async {
      when(source.fetchMinVersion).thenAnswer((_) async => '1.1.0');
      expect(await AppUpdateService(source, info).isUpdateRequired(), isTrue);
    });

    test('fails open when config cannot load', () async {
      when(source.fetchMinVersion).thenThrow(Exception('offline'));
      expect(await AppUpdateService(source, info).isUpdateRequired(), isFalse);
    });
  });
}
