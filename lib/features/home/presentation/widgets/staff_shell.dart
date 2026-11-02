import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/router/guards/role_guard.dart';
import 'package:rapsap_ops_app/core/widgets/app_bottom_nav_bar.dart';
import 'package:rapsap_ops_app/core/widgets/brand_header.dart';
import 'package:rapsap_ops_app/core/widgets/offline_banner.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/chat_list_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/today_checklist_cubit.dart';
import 'package:rapsap_ops_app/features/home/presentation/widgets/side_menu.dart';
import 'package:rapsap_ops_app/features/notifications/presentation/bloc/notifications_cubit.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/manager_dashboard_cubit.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_queue_cubit.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

/// Tab shell: Home, Checklist, Chat, Alerts. Holds the data the tabs and
/// their badges share.
class StaffShell extends StatelessWidget {
  const new({required this.shell, super.key});

  final StatefulNavigationShell shell;

  static const int _brandedTabs = 2;

  @override
  Widget build(BuildContext context) {
    final manager = context.select<SessionCubit, bool>(
      (c) => isManager(c.state.user),
    );
    return MultiBlocProvider(
      providers: [
        // Staff tabs read today's checklist; manager tabs read the dashboard
        // and review queue. All exist so either role's badges work.
        BlocProvider(
          create: (_) => manager
              ? getIt<TodayChecklistCubit>()
              : _loaded(getIt<TodayChecklistCubit>(), (c) => c.load()),
        ),
        BlocProvider(
          create: (_) => manager
              ? _loaded(getIt<ManagerDashboardCubit>(), (c) => c.load())
              : getIt<ManagerDashboardCubit>(),
        ),
        BlocProvider(
          create: (_) => manager
              ? _loaded(getIt<ReviewQueueCubit>(), (c) => c.load())
              : getIt<ReviewQueueCubit>(),
        ),
        BlocProvider(
          create: (_) => _loaded(getIt<ChatListCubit>(), (c) => c.load()),
        ),
        BlocProvider(
          create: (_) => _loaded(getIt<NotificationsCubit>(), (c) => c.load()),
        ),
      ],
      child: BlocListener<ConnectivityCubit, ConnectivityStatus>(
        listenWhen: (_, next) => next == ConnectivityStatus.online,
        listener: (context, _) {
          if (manager) {
            context.read<ManagerDashboardCubit>().onConnectionRestored();
            context.read<ReviewQueueCubit>().onConnectionRestored();
          } else {
            context.read<TodayChecklistCubit>().onConnectionRestored();
          }
          context.read<ChatListCubit>().onConnectionRestored();
          context.read<NotificationsCubit>().onConnectionRestored();
        },
        child: Scaffold(
          endDrawer: const SideMenu(),
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                const OfflineBanner(),
                if (shell.currentIndex < _brandedTabs) const _Header(),
                Expanded(child: shell),
              ],
            ),
          ),
          bottomNavigationBar: _NavBar(shell: shell),
        ),
      ),
    );
  }

  static T _loaded<T>(T cubit, Future<void> Function(T) load) {
    unawaited(load(cubit));
    return cubit;
  }
}

class _Header extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) => BrandHeader(
    storeName: context.select<SessionCubit, String>(
      (c) => c.state.user?.storeName ?? '',
    ),
    onMenu: () => Scaffold.of(context).openEndDrawer(),
  );
}

class _NavBar extends StatelessWidget {
  const new({required this.shell});

  final StatefulNavigationShell shell;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final manager = context.select<SessionCubit, bool>(
      (c) => isManager(c.state.user),
    );
    final staffLeft = context.select<TodayChecklistCubit, int>(
      (c) => c.state.checklist?.left ?? 0,
    );
    final toReview = context.select<ReviewQueueCubit, int>(
      (c) =>
          c.state.data?.where((i) => i.kind == ReviewKind.needsReview).length ??
          0,
    );
    final left = manager ? toReview : staffLeft;
    final chatUnread = context.select<ChatListCubit, int>(
      (c) => _unread(c.state),
    );
    final alertCount = context.select<NotificationsCubit, int>(
      (c) => c.state.unread,
    );
    // Branch order in the router: home, checklist, chat, alerts, sales.
    const home = 0;
    const checklist = 1;
    const chat = 2;
    const alerts = 3;
    const sales = 4;
    final items = <int, AppNavItem>{
      home: AppNavItem(icon: Assets.icons.navHome, label: l10n.navHome),
      checklist: AppNavItem(
        icon: Assets.icons.navChecklist,
        label: l10n.navChecklist,
        badge: left,
      ),
      if (manager)
        sales: AppNavItem(icon: Assets.icons.navSales, label: l10n.navSales),
      chat: AppNavItem(
        icon: Assets.icons.navChat,
        label: l10n.navChat,
        badge: chatUnread,
      ),
      if (!manager)
        alerts: AppNavItem(
          icon: Assets.icons.navAlerts,
          label: l10n.navAlerts,
          badge: alertCount,
        ),
    };
    final branches = items.keys.toList();
    return AppBottomNavBar(
      currentIndex: branches.indexOf(shell.currentIndex),
      onTap: (i) => shell.goBranch(
        branches[i],
        initialLocation: branches[i] == shell.currentIndex,
      ),
      items: items.values.toList(),
    );
  }

  static int _unread(LoadState<List<Conversation>> state) =>
      state.data?.fold<int>(0, (sum, c) => sum + (c.muted ? 0 : c.unread)) ?? 0;
}
