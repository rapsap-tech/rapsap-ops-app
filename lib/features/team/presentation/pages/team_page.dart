import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/filter_chip_button.dart';
import 'package:rapsap_ops_app/core/widgets/load_state_view.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/team_cubit.dart';
import 'package:rapsap_ops_app/features/team/presentation/widgets/member_tile.dart';

/// C7 · My team.
class TeamPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final store = context.select<SessionCubit, String>(
      (c) => c.state.user?.storeName ?? '',
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final cubit = getIt<TeamCubit>();
            unawaited(cubit.load());
            return cubit;
          },
        ),
        BlocProvider(create: (_) => getIt<TeamFilterCubit>()),
      ],
      child: Builder(
        builder: (context) => AppScaffold(
          header: PageHeader(
            title: context.l10n.teamTitle,
            subtitle: context.select<TeamCubit, String>(
              (c) =>
                  context.l10n.teamSubtitle(store, c.state.data?.length ?? 0),
            ),
          ),
          body: LoadStateView<TeamCubit, List<TeamMember>>(
            builder: (context, members) => _List(members: members),
          ),
          footer: AppButton(
            label: context.l10n.teamCreateLogin,
            onPressed: () => _create(context),
          ),
        ),
      ),
    );
  }

  Future<void> _create(BuildContext context) async {
    final team = context.read<TeamCubit>();
    await context.pushNamed(RouteNames.teamNew);
    if (!team.isClosed) unawaited(team.load());
  }
}

class _List extends StatelessWidget {
  const new({required this.members});

  final List<TeamMember> members;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final filter = context.watch<TeamFilterCubit>().state;
    int count(MemberStatus s) => members.where((m) => m.status == s).length;
    final chips = <MemberStatus?, String>{
      null: l10n.filterAll(members.length),
      MemberStatus.active: l10n.teamActive(count(MemberStatus.active)),
      MemberStatus.invited: l10n.teamInvited(count(MemberStatus.invited)),
      MemberStatus.deactivated: l10n.teamDeactivated(
        count(MemberStatus.deactivated),
      ),
    };
    final visible = [
      for (final m in members)
        if (filter == null || m.status == filter) m,
    ];
    return RefreshIndicator(
      onRefresh: context.read<TeamCubit>().load,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: Dimens.pagePadding,
        children: [
          Wrap(
            spacing: Dimens.paddingSmall,
            runSpacing: Dimens.paddingSmall,
            children: [
              for (final entry in chips.entries)
                FilterChipButton(
                  label: entry.value,
                  selected: entry.key == filter,
                  onTap: () =>
                      context.read<TeamFilterCubit>().select(entry.key),
                ),
            ],
          ),
          12.hSpace,
          for (final m in visible) MemberTile(member: m),
        ],
      ),
    );
  }
}
