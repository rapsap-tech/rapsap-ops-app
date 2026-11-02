import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/router/guards/session_guard.dart';

import '../../helpers/fixtures.dart';

void main() {
  const signedOut = SessionState(status: SessionStatus.unauthenticated);
  const signedIn = SessionState(
    status: SessionStatus.authenticated,
    user: testUser,
  );

  String? go(SessionState s, String url) => sessionRedirect(s, Uri.parse(url));

  test('while restoring, keeps the requested page in ?from=', () {
    expect(go(const SessionState(), '/checklist'), '/?from=%2Fchecklist');
    expect(go(signedIn, '/?from=%2Fchecklist'), '/checklist');
  });

  test('ignores external ?from= targets', () {
    expect(go(signedIn, '/?from=%2F%2Fevil.com'), '/home');
  });

  test('signed-out users only reach login and OTP', () {
    expect(go(signedOut, '/home'), '/login');
    expect(go(signedOut, '/login/otp'), isNull);
  });

  test('consent is required before the app', () {
    final noConsent = SessionState(
      status: SessionStatus.authenticated,
      user: testUser.copyWith(consentAccepted: false),
    );
    expect(go(noConsent, '/home'), '/welcome');
    expect(go(signedIn, '/welcome'), '/home');
    expect(go(signedIn, '/checklist'), isNull);
  });
}
