import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_avatar.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/team_cubit.dart';

class MemberTile extends StatelessWidget {
  const new({required this.member, super.key});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    final roles = member.roles.map((r) => r.name).join(', ');
    return InkWell(
      onTap: () => _open(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimens.space12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.divider,
              width: Dimens.borderWidth,
            ),
          ),
        ),
        child: Row(
          children: [
            AppAvatar(name: member.name),
            12.wSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(member.name, style: AppTextStyles.base.s15.w600),
                  2.hSpace,
                  Text(
                    _subtitle(context, roles),
                    style: AppTextStyles.base.s12.secondaryTextColor(),
                  ),
                ],
              ),
            ),
            8.wSpace,
            _Trailing(member: member),
          ],
        ),
      ),
    );
  }

  String _subtitle(BuildContext context, String roles) {
    final since = member.since;
    if (since == null) return roles;
    final days = DateTime.now().difference(since).inDays;
    return switch (member.status) {
      MemberStatus.invited => context.l10n.teamInvitedLine(roles, days),
      MemberStatus.deactivated => context.l10n.teamLeftLine(roles, days),
      MemberStatus.active => roles,
    };
  }

  Future<void> _open(BuildContext context) async {
    final team = context.read<TeamCubit>();
    await context.pushNamed(
      RouteNames.teamMember,
      pathParameters: {RoutePaths.memberIdParam: member.id},
    );
    if (!team.isClosed) unawaited(team.load());
  }
}

class _Trailing extends StatelessWidget {
  const new({required this.member});

  final TeamMember member;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return switch (member.status) {
      MemberStatus.active => StatusChip(
        label: l10n.teamStatusActive,
        tone: StatusTone.success,
      ),
      MemberStatus.deactivated => StatusChip(
        label: l10n.teamStatusDeactivated,
        tone: StatusTone.neutral,
      ),
      MemberStatus.invited => BlocProvider(
        create: (_) => getIt<InviteCubit>(),
        child: BlocBuilder<InviteCubit, InviteState>(
          builder: (context, state) => state.status == InviteStatus.sent
              ? StatusChip(label: l10n.teamSmsSent, tone: StatusTone.info)
              : AppButton(
                  label: l10n.teamResendSms,
                  variant: AppButtonVariant.outline,
                  expand: false,
                  isLoading: state.status == InviteStatus.sending,
                  onPressed: () =>
                      context.read<InviteCubit>().resend(member.id),
                ),
        ),
      ),
    };
  }
}
