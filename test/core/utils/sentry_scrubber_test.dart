import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/utils/sentry_scrubber.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() {
  test('drops request, user and breadcrumb data before sending', () {
    final event = SentryEvent(
      request: SentryRequest(url: 'https://api.test/auth/otp/verify'),
      user: SentryUser(id: 'u1'),
      breadcrumbs: [
        Breadcrumb(
          message: 'POST',
          data: {'url': '/auth/otp/send', 'phone': '9876543210'},
        ),
      ],
    );

    final scrubbed = scrubSentryEvent(event, Hint());

    expect(scrubbed.request, isNull);
    expect(scrubbed.user, isNull);
    expect(scrubbed.breadcrumbs!.single.data, isNull);
    expect(scrubbed.breadcrumbs!.single.message, 'POST');
  });
}
