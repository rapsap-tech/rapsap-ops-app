import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/task_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_capture_section.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_display.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_status_sections.dart';

/// Scrollable task content; what it shows depends on the task's phase.
class TaskBody extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final detail = context.select<TaskCubit, TaskDetail?>(
      (c) => c.state.detail,
    );
    if (detail == null) return const SizedBox.shrink();
    final now = DateTime.now();
    final phase = detail.task.phaseAt(now);
    return SingleChildScrollView(
      padding: Dimens.pagePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MetaRow(detail: detail),
          16.hSpace,
          Text(detail.task.title, style: AppTextStyles.base.s22.w700.l1),
          12.hSpace,
          _PhaseChip(task: detail.task, phase: phase, now: now),
          16.hSpace,
          switch (phase) {
            TaskPhase.open ||
            TaskPhase.sentBack => TaskCaptureSection(detail: detail),
            TaskPhase.missed => MissedSection(detail: detail),
            TaskPhase.later => LaterSection(task: detail.task),
            TaskPhase.submitted ||
            TaskPhase.verified ||
            TaskPhase.notDone => DoneSection(detail: detail),
          },
        ],
      ),
    );
  }
}

class _MetaRow extends StatelessWidget {
  const new({required this.detail});

  final TaskDetail detail;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final style = AppTextStyles.base.s13;
    return Row(
      children: [
        Expanded(
          child: Text(
            context.l10n.taskAssignedTo(detail.assignedTo),
            style: style.secondaryTextColor(),
          ),
        ),
        Text(
          context.l10n.taskDueAt(detail.task.dueAt.storeClock(locale)),
          style: style.w600.primaryDarkColor(),
        ),
      ],
    );
  }
}

class _PhaseChip extends StatelessWidget {
  const new({required this.task, required this.phase, required this.now});

  final ChecklistTask task;
  final TaskPhase phase;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final minutes = minutesLeft(task, now);
    return switch (phase) {
      TaskPhase.open => StatusChip(
        label: l10n.taskDueSoonLeft(minutes),
        tone: StatusTone.info,
      ),
      TaskPhase.sentBack => Row(
        children: [
          StatusChip(label: l10n.taskChipSentBack, tone: StatusTone.error),
          8.wSpace,
          Text(
            l10n.taskReopenedLeft(minutes),
            style: AppTextStyles.base.s13.secondaryTextColor(),
          ),
        ],
      ),
      TaskPhase.missed => StatusChip(
        label: l10n.taskMissedWasDue(task.dueAt.storeClock(locale)),
        tone: StatusTone.error,
      ),
      TaskPhase.later => StatusChip(
        label: l10n.taskChipLater,
        tone: StatusTone.neutral,
      ),
      TaskPhase.submitted => StatusChip(
        label: l10n.taskChipSubmitted,
        tone: StatusTone.neutral,
      ),
      TaskPhase.verified => StatusChip(
        label: l10n.taskChipVerified,
        tone: StatusTone.success,
      ),
      TaskPhase.notDone => StatusChip(
        label: l10n.taskChipNotDone,
        tone: StatusTone.error,
      ),
    };
  }
}
