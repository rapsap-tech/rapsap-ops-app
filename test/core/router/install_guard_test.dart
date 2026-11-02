import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/router/guards/install_guard.dart';

void main() {
  test('phone browsers are kept on the install page', () {
    expect(installRedirect(Uri.parse('/home')), '/install');
    expect(installRedirect(Uri.parse('/login/otp')), '/install');
    expect(installRedirect(Uri.parse('/install')), isNull);
  });
}
