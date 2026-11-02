import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/member_detail_cubit.dart';

/// Save changes + Deactivate (C14), or Reactivate (X8) for a past member.
class MemberActions extends StatelessWidget {
  const new({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<MemberDetailCubit>().state;
    final cubit = context.read<MemberDetailCubit>();
    final busy = state.running != null;
    if (member.status == MemberStatus.deactivated) {
      return AppButton(
        label: l10n.teamReactivate,
        isLoading: state.running == MemberAction.reactivate,
        onPressed: busy ? null : () => unawaited(_confirmReactivate(context)),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppButton(
          label: l10n.editSave,
          isLoading: state.running == MemberAction.save,
          onPressed: busy || !state.dirty || state.roleIds.isEmpty
              ? null
              : cubit.save,
        ),
        12.hSpace,
        AppButton(
          label: l10n.teamDeactivate,
          variant: AppButtonVariant.danger,
          isLoading: state.running == MemberAction.deactivate,
          onPressed: busy ? null : () => unawaited(_confirmDeactivate(context)),
        ),
      ],
    );
  }

  Future<void> _confirmDeactivate(BuildContext context) async {
    final l10n = context.l10n;
    final cubit = context.read<MemberDetailCubit>();
    final ok = await _confirm(
      context,
      title: l10n.teamDeactivateTitle(member.name),
      points: [
        l10n.teamDeactivateSignedOut,
        l10n.teamDeactivateGroups,
        l10n.teamDeactivateHistory,
        l10n.teamDeactivateReactivate,
      ],
      action: l10n.teamDeactivate,
      variant: AppButtonVariant.danger,
    );
    if (ok) unawaited(cubit.deactivate());
  }

  Future<void> _confirmReactivate(BuildContext context) async {
    final l10n = context.l10n;
    final cubit = context.read<MemberDetailCubit>();
    final ok = await _confirm(
      context,
      title: l10n.teamReactivateTitle(member.name),
      points: [
        member.roles.map((r) => r.name).join(' · '),
        l10n.teamDefaultGroups,
        l10n.teamReactivateTasks,
      ],
      action: l10n.teamReactivate,
      variant: AppButtonVariant.primary,
    );
    if (ok) unawaited(cubit.reactivate());
  }

  static Future<bool> _confirm(
    BuildContext context, {
    required String title,
    required List<String> points,
    required String action,
    required AppButtonVariant variant,
  }) async {
    final result = await showModalBottomSheet<bool>(
      context: context,
      isScrollControlled: true,
      builder: (sheet) => SafeArea(
        child: Padding(
          padding: Dimens.pagePadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.base.s20.w700),
              12.hSpace,
              for (final p in points) ...[
                Text('✓  $p', style: AppTextStyles.base.s14),
                8.hSpace,
              ],
              16.hSpace,
              AppButton(
                label: action,
                variant: variant,
                onPressed: () => Navigator.of(sheet).pop(true),
              ),
              12.hSpace,
              AppButton(
                label: sheet.l10n.actionCancel,
                variant: AppButtonVariant.secondary,
                onPressed: () => Navigator.of(sheet).pop(false),
              ),
            ],
          ),
        ),
      ),
    );
    return result ?? false;
  }
}
