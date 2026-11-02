import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/services/permissions/permission_service.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/app_svg_icon.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/first_sign_in_cubit.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

class PermissionList extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<FirstSignInCubit>().state;
    return Column(
      children: [
        _PermissionTile(
          icon: Assets.icons.camera,
          title: l10n.permissionCameraTitle,
          body: l10n.permissionCameraBody,
          kind: PermissionKind.camera,
          status: state.camera,
          requesting: state.requesting == PermissionKind.camera,
        ),
        12.hSpace,
        _PermissionTile(
          icon: Assets.icons.bell,
          title: l10n.permissionNotificationsTitle,
          body: l10n.permissionNotificationsBody,
          kind: PermissionKind.notifications,
          status: state.notifications,
          requesting: state.requesting == PermissionKind.notifications,
        ),
        if (state.camera == AppPermissionStatus.denied) ...[
          12.hSpace,
          MessageBanner(l10n.permissionCameraDeniedHelp),
        ],
      ],
    );
  }
}

class _PermissionTile extends StatelessWidget {
  const new({
    required this.icon,
    required this.title,
    required this.body,
    required this.kind,
    required this.status,
    required this.requesting,
  });

  final SvgGenImage icon;
  final String title;
  final String body;
  final PermissionKind kind;
  final AppPermissionStatus status;
  final bool requesting;

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          Container(
            width: Dimens.iconTileSize,
            height: Dimens.iconTileSize,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.iconTile,
              borderRadius: BorderRadius.circular(Dimens.radius12),
            ),
            child: AppSvgIcon(
              icon,
              size: Dimens.iconSmall,
              color: AppColors.primaryDark,
            ),
          ),
          12.wSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.base.s15.w600),
                2.hSpace,
                Text(body, style: AppTextStyles.base.s12.secondaryTextColor()),
              ],
            ),
          ),
          12.wSpace,
          _Action(kind: kind, status: status, requesting: requesting),
        ],
      ),
    );
  }
}

class _Action extends StatelessWidget {
  const new({
    required this.kind,
    required this.status,
    required this.requesting,
  });

  final PermissionKind kind;
  final AppPermissionStatus status;
  final bool requesting;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (status == AppPermissionStatus.granted) {
      return StatusChip(
        label: l10n.permissionAllowed,
        tone: StatusTone.success,
      );
    }
    // Browsers won't re-prompt a blocked notification permission.
    if (status == AppPermissionStatus.denied &&
        kind == PermissionKind.notifications) {
      return StatusChip(label: l10n.permissionBlocked, tone: StatusTone.error);
    }
    return AppButton(
      label: l10n.permissionAllow,
      variant: AppButtonVariant.outline,
      expand: false,
      isLoading: requesting,
      onPressed: () => context.read<FirstSignInCubit>().request(kind),
    );
  }
}
