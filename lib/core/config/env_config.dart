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
    if (!kReleaseMode) return;
    if (!_hasScheme(baseUrl, 'https')) {
      throw StateError('BASE_URL must use https');
    }
    if (!useFakeApi && !_hasScheme(wsUrl, 'wss')) {
      throw StateError('WS_URL must use wss');
    }
  }

  static bool _hasScheme(String url, String scheme) =>
      Uri.tryParse(url)?.scheme == scheme;

  String get baseUrl => const String.fromEnvironment('BASE_URL');
  String get wsUrl => const String.fromEnvironment('WS_URL');
  String get sentryDsn => const String.fromEnvironment('SENTRY_DSN');
  String get fcmVapidKey => const String.fromEnvironment('FCM_VAPID_KEY');
  bool get useFakeApi => const bool.fromEnvironment('USE_FAKE_API');

  /// Not on the backend yet (docs/api_pending.md): with the real API these
  /// screens are hidden rather than run on sample data.
  bool get hasSectionReports => useFakeApi;
  bool get hasNotificationSettings => useFakeApi;
  bool get hasDsrChatPost => useFakeApi;
  String get diEnvironment => useFakeApi ? fakeApi.name : realApi.name;
  bool get enableLogs => kDebugMode;
}
