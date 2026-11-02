import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/app.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/l10n/gen/app_localizations.dart';
import 'package:rapsap_ops_app/core/services/permissions/permission_service.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';
import 'package:rapsap_ops_app/core/widgets/app_otp_field.dart';
import 'package:rapsap_ops_app/core/widgets/app_phone_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

final AppLocalizations l10n = lookupAppLocalizations(const Locale('en'));

const String staffPhone = '9876543210';
const String managerPhone = '9912345678';
const String noLoginPhone = '9123456789';
const String validOtp = '123456';
const String wrongOtp = '000000';

const Duration _pollInterval = Duration(milliseconds: 100);
const Duration _waitTimeout = Duration(seconds: 20);
const Duration _transitionTime = Duration(milliseconds: 600);

/// Native permission dialogs can't be tapped from a Flutter test.
class _GrantedPermissions implements PermissionService {
  @override
  Future<AppPermissionStatus> cameraStatus() async =>
      AppPermissionStatus.granted;

  @override
  Future<AppPermissionStatus> requestCamera() async =>
      AppPermissionStatus.granted;

  @override
  Future<AppPermissionStatus> notificationStatus() async =>
      AppPermissionStatus.granted;

  @override
  Future<AppPermissionStatus> requestNotifications() async =>
      AppPermissionStatus.granted;
}

/// Boots the real app against the fake API with a signed-out, English start.
Future<void> startApp(WidgetTester tester) async {
  await getIt.reset();
  await (await SharedPreferences.getInstance()).clear();
  await configureDependencies();
  await getIt<SecureStorageService>().clear();
  getIt
    ..unregister<PermissionService>()
    ..registerSingleton<PermissionService>(_GrantedPermissions());
  await getIt<SessionCubit>().restore();
  await tester.pumpWidget(const App());
}

extension E2eTester on WidgetTester {
  /// pumpAndSettle never settles here: OTP countdowns and loaders keep
  /// scheduling frames, so poll for the expected widget instead.
  Future<void> waitFor(Finder finder) async {
    final deadline = DateTime.now().add(_waitTimeout);
    while (finder.evaluate().isEmpty) {
      if (DateTime.now().isAfter(deadline)) {
        throw TestFailure('Timed out waiting for $finder');
      }
      await Future<void>.delayed(_pollInterval);
      await pump();
    }
  }

  Future<void> tapAndWait(Finder target, Finder next) async {
    await waitFor(target);
    await _letTransitionsFinish();
    await tap(target.first);
    await waitFor(next);
  }

  /// A tap during a page or menu animation lands on the old position.
  Future<void> _letTransitionsFinish() async {
    await Future<void>.delayed(_transitionTime);
    await pump();
  }

  Future<void> requestOtp(String phone) async {
    await waitFor(find.byType(AppPhoneField));
    await enterText(find.byType(AppPhoneField), phone);
    await pump();
    await tap(find.text(l10n.loginGetOtp));
  }

  Future<void> enterOtp(String otp) async {
    await waitFor(find.byType(AppOtpField));
    await enterText(find.byType(AppOtpField), otp);
    await pump();
  }

  Future<void> signIn(String phone) async {
    await requestOtp(phone);
    await enterOtp(validOtp);
  }
}
