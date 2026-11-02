import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/today_checklist_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/checklist_load_view.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_display.dart';
import 'package:rapsap_ops_app/features/home/presentation/widgets/caught_up_card.dart';
import 'package:rapsap_ops_app/features/home/presentation/widgets/do_now_card.dart';
import 'package:rapsap_ops_app/features/home/presentation/widgets/home_greeting.dart';
import 'package:rapsap_ops_app/features/home/presentation/widgets/home_stats_row.dart';

/// B1 · Staff home.
class StaffHomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ChecklistLoadView(
      builder: (context, checklist) => _HomeList(checklist: checklist),
    );
  }
}

class _HomeList extends StatelessWidget {
  const new({required this.checklist});

  final TodayChecklist checklist;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final user = context.select<SessionCubit, User?>((c) => c.state.user);
    final next = checklist.nextTask(now);
    final upcoming = checklist.upcoming(now);
    final children = [
      HomeGreeting(
        name: user?.name ?? '',
        jobRoles: user?.jobRoles ?? const [],
        date: checklist.date,
        shift: checklist.shift,
      ),
      HomeStatsRow(checklist: checklist),
      if (next != null)
        DoNowCard(task: next, now: now)
      else
        CaughtUpCard(next: upcoming.firstOrNull),
      if (upcoming.isNotEmpty)
        Text(context.l10n.homeComingUp, style: AppTextStyles.base.s14.w600),
      for (final task in upcoming)
        ChecklistTaskTile(task: task, now: now, showSectionAsSubtitle: true),
    ];
    return RefreshIndicator(
      onRefresh: context.read<TodayChecklistCubit>().load,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: Dimens.pagePadding,
        itemCount: children.length,
        separatorBuilder: (_, _) => 14.hSpace,
        itemBuilder: (_, i) => children[i],
      ),
    );
  }
}
