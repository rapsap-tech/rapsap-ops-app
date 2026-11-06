import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/router/go_router_refresh_stream.dart';
import 'package:rapsap_ops_app/core/router/guards/install_guard.dart';
import 'package:rapsap_ops_app/core/router/guards/role_guard.dart';
import 'package:rapsap_ops_app/core/router/guards/session_guard.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/services/install/install_service.dart';
import 'package:rapsap_ops_app/core/widgets/not_found_view.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/first_sign_in_page.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/install_page.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/login_page.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/otp_page.dart';
import 'package:rapsap_ops_app/features/auth/presentation/pages/splash_page.dart';
import 'package:rapsap_ops_app/features/chat/presentation/pages/chat_list_page.dart';
import 'package:rapsap_ops_app/features/chat/presentation/pages/conversation_page.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/camera_page.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/task_page.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/pages/dsr_upload_page.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/pages/sales_page.dart';
import 'package:rapsap_ops_app/features/home/presentation/pages/role_pages.dart';
import 'package:rapsap_ops_app/features/home/presentation/widgets/staff_shell.dart';
import 'package:rapsap_ops_app/features/notifications/presentation/pages/notifications_page.dart';
import 'package:rapsap_ops_app/features/profile/presentation/pages/profile_page.dart';
import 'package:rapsap_ops_app/features/review/presentation/pages/edit_entry_page.dart';
import 'package:rapsap_ops_app/features/review/presentation/pages/review_detail_page.dart';
import 'package:rapsap_ops_app/features/review/presentation/pages/send_back_page.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/pages/closing_report_page.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/pages/daily_summary_page.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/pages/returned_report_page.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/pages/section_reports_page.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/pages/snapshot_page.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/pages/walkthrough_page.dart';
import 'package:rapsap_ops_app/features/settings/presentation/pages/settings_page.dart';
import 'package:rapsap_ops_app/features/team/presentation/pages/change_number_page.dart';
import 'package:rapsap_ops_app/features/team/presentation/pages/create_login_page.dart';
import 'package:rapsap_ops_app/features/team/presentation/pages/member_detail_page.dart';
import 'package:rapsap_ops_app/features/team/presentation/pages/team_page.dart';

@lazySingleton
class AppRouter {
  new(this._session, this._install)
    : _refresh = GoRouterRefreshStream(_session.stream);

  final SessionCubit _session;
  final InstallService _install;
  final GoRouterRefreshStream _refresh;

  late final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    refreshListenable: _refresh,
    redirect: (_, state) => _install.isRequired
        ? installRedirect(state.uri)
        : sessionRedirect(_session.state, state.uri),
    routes: [
      GoRoute(
        path: RoutePaths.install,
        name: RouteNames.install,
        builder: (_, _) => const InstallPage(),
      ),
      GoRoute(
        path: RoutePaths.splash,
        name: RouteNames.splash,
        builder: (_, _) => const SplashPage(),
      ),
      GoRoute(
        path: RoutePaths.login,
        name: RouteNames.login,
        builder: (_, _) => const LoginPage(),
        routes: [
          GoRoute(
            path: RoutePaths.otp,
            name: RouteNames.otp,
            // Phone travels in `extra`, never in the URL; a refresh goes back.
            redirect: (_, state) =>
                state.extra is OtpPageArgs ? null : RoutePaths.login,
            // History can bring this back without its args (browser back).
            builder: (_, state) => switch (state.extra) {
              final OtpPageArgs args => OtpPage(args: args),
              _ => const NotFoundView(),
            },
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.welcome,
        name: RouteNames.welcome,
        builder: (_, _) => const FirstSignInPage(),
      ),
      GoRoute(
        path: RoutePaths.task,
        name: RouteNames.task,
        builder: (_, state) => TaskPage(
          taskId: state.pathParameters[RoutePaths.taskIdParam] ?? '',
          openCamera:
              state.uri.queryParameters[RoutePaths.openCameraQuery] ==
              RoutePaths.queryTrue,
        ),
        routes: [
          GoRoute(
            path: RoutePaths.taskCamera,
            name: RouteNames.taskCamera,
            // Needs a fresh capture token; on refresh go back to the task.
            redirect: (_, state) => state.extra is CameraPageArgs
                ? null
                : state.matchedLocation.replaceFirst(
                    '/${RoutePaths.taskCamera}',
                    '',
                  ),
            builder: (_, state) => _camera(state),
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.review,
        name: RouteNames.review,
        redirect: managerOnly(_session),
        builder: (_, state) => ReviewDetailPage(taskId: _taskId(state)),
        routes: [
          GoRoute(
            path: RoutePaths.reviewSendBack,
            name: RouteNames.reviewSendBack,
            builder: (_, state) => SendBackPage(taskId: _taskId(state)),
          ),
          GoRoute(
            path: RoutePaths.reviewEdit,
            name: RouteNames.reviewEdit,
            builder: (_, state) => EditEntryPage(taskId: _taskId(state)),
            routes: [
              GoRoute(
                path: RoutePaths.reviewEditCamera,
                name: RouteNames.reviewEditCamera,
                redirect: (_, state) => state.extra is CameraPageArgs
                    ? null
                    : state.matchedLocation.replaceFirst(
                        '/${RoutePaths.reviewEditCamera}',
                        '',
                      ),
                builder: (_, state) => _camera(state),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.dsrUpload,
        name: RouteNames.dsrUpload,
        redirect: managerOnly(_session),
        builder: (_, _) => const DsrUploadPage(),
      ),
      GoRoute(
        path: RoutePaths.sectionReports,
        name: RouteNames.sectionReports,
        redirect: (context, state) => EnvConfig.instance.hasSectionReports
            ? managerOnly(_session)(context, state)
            : RoutePaths.home,
        builder: (_, _) => const SectionReportsPage(),
        routes: [
          GoRoute(
            path: RoutePaths.reportSnapshot,
            name: RouteNames.reportSnapshot,
            builder: (_, state) => SnapshotPage(reportId: _reportId(state)),
          ),
          GoRoute(
            path: RoutePaths.reportReturned,
            name: RouteNames.reportReturned,
            builder: (_, state) =>
                ReturnedReportPage(reportId: _reportId(state)),
          ),
          GoRoute(
            path: RoutePaths.dailySummary,
            name: RouteNames.dailySummary,
            builder: (_, _) => const DailySummaryPage(),
          ),
          GoRoute(
            path: RoutePaths.walkthrough,
            name: RouteNames.walkthrough,
            builder: (_, _) => const WalkthroughPage(),
          ),
          GoRoute(
            path: RoutePaths.closingReport,
            name: RouteNames.closingReport,
            builder: (_, _) => const ClosingReportPage(),
            routes: [
              GoRoute(
                path: RoutePaths.closingCamera,
                name: RouteNames.closingCamera,
                redirect: (_, state) => state.extra is CameraPageArgs
                    ? null
                    : state.matchedLocation.replaceFirst(
                        '/${RoutePaths.closingCamera}',
                        '',
                      ),
                builder: (_, state) => _camera(state),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.team,
        name: RouteNames.team,
        redirect: managerOnly(_session),
        builder: (_, _) => const TeamPage(),
        routes: [
          GoRoute(
            path: RoutePaths.teamNew,
            name: RouteNames.teamNew,
            builder: (_, _) => const CreateLoginPage(),
          ),
          GoRoute(
            path: RoutePaths.teamMember,
            name: RouteNames.teamMember,
            builder: (_, state) => MemberDetailPage(memberId: _memberId(state)),
            routes: [
              GoRoute(
                path: RoutePaths.teamNumber,
                name: RouteNames.teamNumber,
                builder: (_, state) =>
                    ChangeNumberPage(memberId: _memberId(state)),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.profile,
        name: RouteNames.profile,
        builder: (_, _) => const ProfilePage(),
      ),
      GoRoute(
        path: RoutePaths.settings,
        name: RouteNames.settings,
        builder: (_, _) => const SettingsPage(),
      ),
      GoRoute(
        path: RoutePaths.conversation,
        name: RouteNames.conversation,
        builder: (_, state) => ConversationPage(
          conversationId:
              state.pathParameters[RoutePaths.conversationIdParam] ?? '',
        ),
        routes: [
          GoRoute(
            path: RoutePaths.conversationCamera,
            name: RouteNames.conversationCamera,
            redirect: (_, state) => state.extra is CameraPageArgs
                ? null
                : state.matchedLocation.replaceFirst(
                    '/${RoutePaths.conversationCamera}',
                    '',
                  ),
            builder: (_, state) => _camera(state),
          ),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (_, _, shell) => StaffShell(shell: shell),
        branches: [
          _branch(RoutePaths.home, RouteNames.home, const RoleHomePage()),
          _branch(
            RoutePaths.checklist,
            RouteNames.checklist,
            const RoleChecklistPage(),
          ),
          _branch(RoutePaths.chat, RouteNames.chat, const ChatListPage()),
          _branch(
            RoutePaths.notifications,
            RouteNames.notifications,
            const NotificationsPage(),
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: RoutePaths.sales,
                name: RouteNames.sales,
                redirect: managerOnly(_session),
                builder: (_, _) => const SalesPage(),
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (_, _) => const NotFoundView(),
  );

  /// The camera's args can't be stored in browser history, so a restored
  /// entry shows "not found" instead of crashing.
  static Widget _camera(GoRouterState state) => switch (state.extra) {
    final CameraPageArgs args => CameraPage(
      session: args.session,
      title: args.title,
    ),
    _ => const NotFoundView(),
  };

  static String _reportId(GoRouterState state) =>
      state.pathParameters[RoutePaths.reportIdParam] ?? '';

  static String _memberId(GoRouterState state) =>
      state.pathParameters[RoutePaths.memberIdParam] ?? '';

  static String _taskId(GoRouterState state) =>
      state.pathParameters[RoutePaths.taskIdParam] ?? '';

  static StatefulShellBranch _branch(String path, String name, Widget page) =>
      StatefulShellBranch(
        routes: [GoRoute(path: path, name: name, builder: (_, _) => page)],
      );

  @disposeMethod
  void dispose() {
    router.dispose();
    _refresh.dispose();
  }
}
