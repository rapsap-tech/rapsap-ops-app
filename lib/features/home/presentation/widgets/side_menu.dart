import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/router/guards/role_guard.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_avatar.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/logout_cubit.dart';

/// B12 · Side menu (end drawer).
class SideMenu extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final user = context.select<SessionCubit, User?>((c) => c.state.user);
    void go(String route) {
      Navigator.of(context).pop();
      unawaited(context.pushNamed(route));
    }

    return Drawer(
      width: Dimens.drawerWidth,
      backgroundColor: AppColors.surface,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (user != null) _UserCard(user: user),
            Divider(color: AppColors.divider, height: Dimens.borderWidth),
            if (isManager(user)) ...[
              _Item(label: l10n.menuMyTeam, onTap: () => go(RouteNames.team)),
              _Item(
                label: l10n.notificationsTitle,
                onTap: () {
                  Navigator.of(context).pop();
                  context.goNamed(RouteNames.notifications);
                },
              ),
            ],
            _Item(
              label: l10n.profileTitle,
              onTap: () => go(RouteNames.profile),
            ),
            _Item(
              label: l10n.settingsTitle,
              onTap: () => go(RouteNames.settings),
            ),
            const Spacer(),
            Divider(color: AppColors.divider, height: Dimens.borderWidth),
            BlocProvider(
              create: (_) => getIt<LogoutCubit>(),
              child: const _LogoutItem(),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserCard extends StatelessWidget {
  const new({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final role = switch (user.role) {
      UserRole.staff => l10n.roleStaff,
      UserRole.storeManager => l10n.roleStoreManager,
      UserRole.admin => l10n.roleAdmin,
    };
    return Padding(
      padding: Dimens.pagePadding,
      child: Row(
        children: [
          AppAvatar(name: user.name),
          12.wSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name, style: AppTextStyles.base.s16.w700),
                Text(
                  l10n.menuRoleLine(role, user.jobRoles.join(', ')),
                  style: AppTextStyles.base.s12.secondaryTextColor(),
                ),
                Text(
                  user.storeName,
                  style: AppTextStyles.base.s12.secondaryTextColor(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const new({required this.label, required this.onTap, this.trailing});

  final String label;
  final VoidCallback? onTap;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => ListTile(
    minTileHeight: Dimens.minTapTarget,
    title: Text(label, style: AppTextStyles.base.s16.w500),
    trailing: trailing,
    onTap: onTap,
  );
}

class _LogoutItem extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final loading = context.select<LogoutCubit, bool>(
      (c) => c.state.status == LogoutStatus.loading,
    );
    return _Item(
      label: context.l10n.logOut,
      trailing: loading ? const AppLoader() : null,
      onTap: loading ? null : context.read<LogoutCubit>().logOut,
    );
  }
}
