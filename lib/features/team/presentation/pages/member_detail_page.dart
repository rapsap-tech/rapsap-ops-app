import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/extensions/string_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/info_rows_card.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/member_detail_cubit.dart';
import 'package:rapsap_ops_app/features/team/presentation/widgets/member_actions.dart';
import 'package:rapsap_ops_app/features/team/presentation/widgets/role_picker.dart';
import 'package:rapsap_ops_app/features/team/presentation/widgets/task_list_card.dart';

/// C11 · Staff detail (+ C14 deactivate, X8 reactivate).
class MemberDetailPage extends StatelessWidget {
  const new({required this.memberId, super.key});

  final String memberId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<MemberDetailCubit>();
        unawaited(cubit.load(memberId));
        return cubit;
      },
      child: BlocListener<MemberDetailCubit, MemberDetailState>(
        listenWhen: (p, n) => n.done != null && p.done == null,
        listener: (context, state) =>
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(switch (state.done!) {
                  MemberAction.save => context.l10n.teamSaved,
                  MemberAction.deactivate => context.l10n.teamDeactivatedDone,
                  MemberAction.reactivate => context.l10n.teamReactivatedDone,
                }),
              ),
            ),
        child: const _View(),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MemberDetailCubit>().state;
    final member = state.member;
    return AppScaffold(
      header: PageHeader(title: member?.name ?? ''),
      body: switch (state.load) {
        LoadStatus.loading when member == null => const Center(
          child: AppLoader(),
        ),
        LoadStatus.failure when member == null => AppMessageView(
          message:
              state.failure?.message(context.l10n) ?? context.l10n.errorUnknown,
          onRetry: context.read<MemberDetailCubit>().reload,
        ),
        _ when member != null => _Body(member: member, state: state),
        _ => const SizedBox.shrink(),
      },
      footer: member == null ? null : MemberActions(member: member),
    );
  }
}

class _Body extends StatelessWidget {
  const new({required this.member, required this.state});

  final TeamMember member;
  final MemberDetailState state;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final cubit = context.read<MemberDetailCubit>();
    final catalog = state.catalog;
    final failure = state.failure;
    final phone = '${AppConstants.countryCode} ${member.phone.maskedPhone}';
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        InfoRowsCard(rows: [(l10n.profileMobile, phone)]),
        if (member.status != MemberStatus.deactivated)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () => unawaited(
                context.pushNamed(
                  RouteNames.teamNumber,
                  pathParameters: {RoutePaths.memberIdParam: member.id},
                ),
              ),
              child: Text(
                l10n.teamChangeNumber,
                style: AppTextStyles.base.s14.w600.primaryDarkColor(),
              ),
            ),
          ),
        16.hSpace,
        Text(l10n.teamJobRoles, style: AppTextStyles.base.s16.w700),
        8.hSpace,
        if (catalog != null) ...[
          RolePicker(
            roles: catalog.roles,
            selected: state.roleIds,
            onToggle: cubit.toggleRole,
          ),
          16.hSpace,
          TaskListCard(
            tasks: catalog.tasksFor(state.roleIds),
            catalog: catalog,
            extraTaskIds: const {},
            onToggleExtra: (_) {},
          ),
        ],
        if (failure != null) ...[
          16.hSpace,
          MessageBanner(failure.message(l10n)),
        ],
      ],
    );
  }
}
