import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/l10n/gen/app_localizations.dart';
import 'package:rapsap_ops_app/core/widgets/app_phone_field.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/first_sign_in_page.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/checklist_page.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/task_page.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_display.dart';

import 'helpers/e2e_app.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('staff signs in, opens a task and logs out', (tester) async {
    await startApp(tester);

    await tester.signIn(staffPhone);
    await tester.waitFor(find.byType(FirstSignInPage));
    await tester.tapAndWait(
      find.text(l10n.welcomeAgree),
      find.text(l10n.navChecklist),
    );

    await tester.tapAndWait(
      find.text(l10n.navChecklist),
      find.byType(ChecklistPage),
    );
    await tester.tapAndWait(
      find.byType(ChecklistTaskTile),
      find.byType(TaskPage),
    );
    await tester.pageBack();
    await tester.waitFor(find.byType(ChecklistPage));

    await tester.tapAndWait(
      find.text(l10n.navHome),
      find.byTooltip(l10n.menuOpen),
    );
    await tester.tapAndWait(
      find.byTooltip(l10n.menuOpen),
      find.text(l10n.settingsTitle),
    );
    await tester.tapAndWait(
      find.text(l10n.settingsTitle),
      find.text(l10n.logOut),
    );
    await tester.tapAndWait(find.text(l10n.logOut), find.byType(AppPhoneField));
  });

  testWidgets('store manager lands on the manager home', (tester) async {
    await startApp(tester);

    await tester.signIn(managerPhone);
    await tester.tapAndWait(
      find.text(l10n.welcomeAgree),
      find.text(l10n.navSales),
    );
    expect(find.text(l10n.navAlerts), findsNothing);
  });

  testWidgets('unknown number is told there is no login', (tester) async {
    await startApp(tester);

    await tester.requestOtp(noLoginPhone);
    await tester.waitFor(find.text(l10n.loginNoAccount));
  });

  testWidgets('wrong OTP shows the tries left', (tester) async {
    await startApp(tester);

    await tester.requestOtp(staffPhone);
    await tester.enterOtp(wrongOtp);
    await tester.waitFor(
      find.text(
        l10n.errorOtpInvalid(
          AppConstants.otpMaxWrongTries - 1,
          AppConstants.otpLockMinutes,
        ),
      ),
    );
  });

  testWidgets('login page switches to Hindi', (tester) async {
    await startApp(tester);

    await tester.tapAndWait(
      find.byTooltip(l10n.languagePick),
      find.text(l10n.languageHindi),
    );
    await tester.tapAndWait(
      find.text(l10n.languageHindi),
      find.text(lookupAppLocalizations(const Locale('hi')).loginGetOtp),
    );
  });
}
