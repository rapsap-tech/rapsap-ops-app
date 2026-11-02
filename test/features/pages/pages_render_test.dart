import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/locale_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/services/install/install_service.dart';
import 'package:rapsap_ops_app/core/services/permissions/permission_service.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/accept_consent.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/send_otp.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/verify_otp.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/first_sign_in_cubit.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/install_cubit.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/login_cubit.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/otp_cubit.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/first_sign_in_page.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/install_page.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/login_page.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/otp_page.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/chat_list_cubit.dart';
import 'package:rapsap_ops_app/features/chat/presentation/pages/chat_list_page.dart';
import 'package:rapsap_ops_app/features/chat/presentation/pages/conversation_page.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/fake_checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/data/repositories/checklist_repository_impl.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/get_task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/get_today_checklist.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/start_capture.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_not_done.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_photo.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/task_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/today_checklist_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/checklist_page.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/task_page.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_body.dart';
import 'package:rapsap_ops_app/features/home/presentation/pages/staff_home_page.dart';
import 'package:rapsap_ops_app/features/notifications/presentation/bloc/notifications_cubit.dart';
import 'package:rapsap_ops_app/features/notifications/presentation/pages/notifications_page.dart';
import 'package:rapsap_ops_app/features/profile/presentation/pages/profile_page.dart';
import 'package:rapsap_ops_app/features/settings/presentation/pages/settings_page.dart';

import '../../helpers/fixtures.dart';
import '../../helpers/pump_page.dart';
import '../../helpers/register_app_cubits.dart';

class _MockSession extends MockCubit<SessionState> implements SessionCubit;

class _MockLocale extends MockCubit<Locale> implements LocaleCubit;

class _MockConnectivity extends MockCubit<ConnectivityStatus>
    implements ConnectivityCubit;

class _MockSendOtp extends Mock implements SendOtp;

class _MockVerifyOtp extends Mock implements VerifyOtp;

class _MockAccept extends Mock implements AcceptConsent;

class _MockPermissions extends Mock implements PermissionService;

class _MockInstall extends Mock implements InstallService;

class _MockGetToday extends Mock implements GetTodayChecklist;

void main() {
  late _MockSession session;
  late _MockLocale locale;
  late _MockConnectivity connectivity;
  late TodayChecklistCubit checklist;
  final taskIds = <String, String>{};

  Future<void> registerTaskCubit() async {
    final fake = FakeChecklistRemoteDataSource();
    final repository = ChecklistRepositoryImpl(fake);
    getIt.registerFactory(
      () => TaskCubit(
        GetTaskDetail(repository),
        StartCapture(repository),
        SubmitTaskPhoto(repository),
        SubmitTaskNotDone(repository),
      ),
    );
    final today = (await fake.today()).toEntity();
    for (final task in today.tasks) {
      taskIds[task.status.name] ??= task.id;
    }
  }

  setUpAll(loadAppFonts);

  setUp(() async {
    session = _MockSession();
    locale = _MockLocale();
    connectivity = _MockConnectivity();
    when(() => session.state).thenReturn(
      const SessionState(status: SessionStatus.authenticated, user: testUser),
    );
    when(() => locale.state).thenReturn(const Locale('en'));
    when(() => connectivity.state).thenReturn(ConnectivityStatus.online);

    final permissions = _MockPermissions();
    when(permissions.cameraStatus)
        .thenAnswer((_) async => AppPermissionStatus.granted);
    when(permissions.notificationStatus)
        .thenAnswer((_) async => AppPermissionStatus.unknown);
    final install = _MockInstall();
    when(() => install.mode).thenReturn(InstallMode.iosGuide);
    when(() => install.modeChanges).thenAnswer((_) => const Stream.empty());
    final getToday = _MockGetToday();
    final today = (await FakeChecklistRemoteDataSource().today()).toEntity();
    when(getToday.call).thenAnswer((_) async => Right(today));
    checklist = TodayChecklistCubit(getToday);
    await checklist.load();

    await getIt.reset();
    getIt
      ..registerFactory(() => LoginCubit(_MockSendOtp()))
      ..registerFactory(() => OtpCubit(_MockVerifyOtp(), _MockSendOtp()))
      ..registerFactory(() => FirstSignInCubit(permissions, _MockAccept()))
      ..registerFactory(() => InstallCubit(install));
    await registerTaskCubit();
    registerAppCubits(session);
  });

  tearDown(() => unawaited(checklist.close()));

  final pages = <String, Widget Function(TodayChecklistCubit)>{
    'login': (_) => const LoginPage(),
    'otp': (_) => const OtpPage(
      args: OtpPageArgs(phone: '9876543210', ticket: testTicket),
    ),
    'first sign-in': (_) => const FirstSignInPage(),
    'install (iOS guide)': (_) => const InstallPage(),
    'staff home': (c) => BlocProvider.value(
      value: c,
      child: const Scaffold(body: StaffHomePage()),
    ),
    'checklist': (c) => BlocProvider.value(
      value: c,
      child: const Scaffold(body: ChecklistPage()),
    ),
    'notifications': (_) => BlocProvider(
      create: (_) => getIt<NotificationsCubit>()..load().ignore(),
      child: const Scaffold(body: NotificationsPage()),
    ),
    'chat list': (_) => BlocProvider(
      create: (_) => getIt<ChatListCubit>()..load().ignore(),
      child: const Scaffold(body: ChatListPage()),
    ),
    'conversation': (_) => const ConversationPage(conversationId: 'c-team'),
    'profile': (_) => const ProfilePage(),
    'settings': (_) => const SettingsPage(),
  };
  const taskStates = ['pending', 'sentBack', 'missed', 'verified'];

  for (final language in ['en', 'mr', 'hi']) {
    for (final entry in pages.entries) {
      testWidgets(
        '${entry.key} renders in $language at 1.3x without overflow',
        (tester) async {
          await pumpPage(
            tester,
            entry.value(checklist),
            session: session,
            locale: locale,
            connectivity: connectivity,
            languageCode: language,
            textScale: 1.3,
          );
          await tester.pump(const Duration(seconds: 1));
          expect(tester.takeException(), isNull);
        },
      );
    }
    for (final status in taskStates) {
      testWidgets('task ($status) renders in $language at 1.3x', (
        tester,
      ) async {
        await pumpPage(
          tester,
          TaskPage(taskId: taskIds[status]!),
          session: session,
          locale: locale,
          connectivity: connectivity,
          languageCode: language,
          textScale: 1.3,
        );
        await tester.pump(const Duration(seconds: 1));
        expect(find.byType(TaskBody), findsOneWidget);
        expect(tester.takeException(), isNull);
      });
    }
  }
}
