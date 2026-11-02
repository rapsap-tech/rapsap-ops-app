import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

const Environment fakeApi = Environment('fake');
const Environment realApi = Environment('real');

class EnvConfig {
  new _();

  static final EnvConfig instance = EnvConfig._();

  void validate() {
    if (baseUrl.isEmpty) {
      throw StateError('BASE_URL missing: run with --dart-define-from-file');
    }
  }

  String get baseUrl => const String.fromEnvironment('BASE_URL');
  String get wsUrl => const String.fromEnvironment('WS_URL');
  String get sentryDsn => const String.fromEnvironment('SENTRY_DSN');
  String get fcmVapidKey => const String.fromEnvironment('FCM_VAPID_KEY');
  bool get useFakeApi => const bool.fromEnvironment('USE_FAKE_API');
  String get diEnvironment => useFakeApi ? fakeApi.name : realApi.name;
  bool get enableLogs => kDebugMode;
}
