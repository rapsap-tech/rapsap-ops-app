import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/l10n/gen/app_localizations.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';

void main() {
  late AppLocalizations l10n;

  setUpAll(() async {
    l10n = await AppLocalizations.delegate.load(const Locale('en'));
  });

  test('phone: 10 digits starting 6–9 (LOG-01)', () {
    expect(Validators.phone('9876543210', l10n), isNull);
    expect(Validators.phone('5876543210', l10n), isNotNull);
    expect(Validators.phone('98765', l10n), isNotNull);
  });

  test('name accepts Devanagari and rejects digits', () {
    expect(Validators.personName('प्रिया नाईक', l10n), isNull);
    expect(Validators.personName('Priya 2', l10n), isNotNull);
  });

  test('reason is required with a minimum length', () {
    expect(Validators.reason('', l10n), isNotNull);
    expect(Validators.reason('ok', l10n), isNotNull);
    expect(Validators.reason('Change short', l10n), isNull);
  });
}
