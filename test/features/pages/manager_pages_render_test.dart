import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/locale_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/fake_checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/pages/sales_page.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/manager_dashboard_cubit.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_queue_cubit.dart';
import 'package:rapsap_ops_app/features/review/presentation/pages/edit_entry_page.dart';
import 'package:rapsap_ops_app/features/review/presentation/pages/manager_checklist_page.dart';
import 'package:rapsap_ops_app/features/review/presentation/pages/manager_home_page.dart';
import 'package:rapsap_ops_app/features/review/presentation/pages/review_detail_page.dart';
import 'package:rapsap_ops_app/features/review/presentation/pages/send_back_page.dart';
import 'package:rapsap_ops_app/features/section_reports/data/datasources/fake_report_remote_data_source.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/pages/closing_report_page.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/pages/daily_summary_page.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/pages/section_reports_page.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/pages/snapshot_page.dart';
import 'package:rapsap_ops_app/features/team/presentation/pages/change_number_page.dart';
import 'package:rapsap_ops_app/features/team/presentation/pages/create_login_page.dart';
import 'package:rapsap_ops_app/features/team/presentation/pages/member_detail_page.dart';
import 'package:rapsap_ops_app/features/team/presentation/pages/team_page.dart';

import '../../helpers/pump_page.dart';
import '../../helpers/register_manager_cubits.dart';

class _MockSession extends MockCubit<SessionState> implements SessionCubit;

class _MockLocale extends MockCubit<Locale> implements LocaleCubit;

class _MockConnectivity extends MockCubit<ConnectivityStatus>
    implements ConnectivityCubit;

const User _manager = User(
  id: 'u-2001',
  name: 'Rahul Shinde',
  role: UserRole.storeManager,
  jobRoles: ['Store Manager'],
  storeName: 'Walk Hiranandani',
  consentAccepted: true,
);

void main() {
  late _MockSession session;
  late _MockLocale locale;
  late _MockConnectivity connectivity;
  final taskIds = <ReviewKind, String>{};

  setUpAll(loadAppFonts);

  setUp(() async {
    session = _MockSession();
    locale = _MockLocale();
    connectivity = _MockConnectivity();
    when(() => session.state).thenReturn(
      const SessionState(status: SessionStatus.authenticated, user: _manager),
    );
    when(() => locale.state).thenReturn(const Locale('en'));
    when(() => connectivity.state).thenReturn(ConnectivityStatus.online);
    await getIt.reset();
    final checklist = FakeChecklistRemoteDataSource();
    registerManagerCubits(checklist);
    FakeReportRemoteDataSource.todaysDsr = (sales: 64210, bills: 412);
    final queue = getIt<ReviewQueueCubit>();
    await queue.load();
    for (final item in queue.state.data!) {
      taskIds[item.kind] ??= item.taskId;
    }
    await queue.close();
  });

  Widget withShellCubits(Widget page) => MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => getIt<ManagerDashboardCubit>()..load().ignore(),
      ),
      BlocProvider(create: (_) => getIt<ReviewQueueCubit>()..load().ignore()),
    ],
    child: Scaffold(body: page),
  );

  final pages = <String, Widget Function()>{
    'manager home': () => withShellCubits(const ManagerHomePage()),
    'manager checklist': () => withShellCubits(const ManagerChecklistPage()),
    'review (needs review)': () =>
        ReviewDetailPage(taskId: taskIds[ReviewKind.needsReview]!),
    'review (missed)': () =>
        ReviewDetailPage(taskId: taskIds[ReviewKind.missed]!),
    'send back': () => SendBackPage(taskId: taskIds[ReviewKind.needsReview]!),
    'edit entry': () => EditEntryPage(taskId: taskIds[ReviewKind.needsReview]!),
    'team': () => const TeamPage(),
    'create login': () => const CreateLoginPage(),
    'member detail': () => const MemberDetailPage(memberId: 'm-1'),
    'change number': () => const ChangeNumberPage(memberId: 'm-1'),
    'section reports': () => const SectionReportsPage(),
    'daily summary': () => const DailySummaryPage(),
    'snapshot': () => const SnapshotPage(reportId: 'opening'),
    'closing report': () => const ClosingReportPage(),
    'sales': () => const Scaffold(body: SalesPage()),
  };

  for (final language in ['en', 'mr', 'hi']) {
    for (final entry in pages.entries) {
      testWidgets('${entry.key} renders in $language at 1.3x', (tester) async {
        await pumpPage(
          tester,
          entry.value(),
          session: session,
          locale: locale,
          connectivity: connectivity,
          languageCode: language,
          textScale: 1.3,
        );
        await tester.pump(const Duration(seconds: 1));
        await tester.pump(const Duration(seconds: 1));
        expect(tester.takeException(), isNull);
      });
    }
  }

  tearDown(() => unawaited(getIt.reset()));
}
