import 'package:flutter/widgets.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/core/widgets/task_tile.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_navigation.dart';

/// Builds the shared TaskTile for a task as of [now].
class ChecklistTaskTile extends StatelessWidget {
  const new({
    required this.task,
    required this.now,
    this.showSectionAsSubtitle = false,
    super.key,
  });

  final ChecklistTask task;
  final DateTime now;
  final bool showSectionAsSubtitle;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final phase = task.phaseAt(now);
    final (chip, tone) = switch (phase) {
      TaskPhase.later => (l10n.taskChipLater, StatusTone.neutral),
      TaskPhase.open => (l10n.taskChipDueSoon, StatusTone.info),
      TaskPhase.submitted => (l10n.taskChipSubmitted, StatusTone.neutral),
      TaskPhase.verified => (l10n.taskChipVerified, StatusTone.success),
      TaskPhase.sentBack => (l10n.taskChipSentBack, StatusTone.error),
      TaskPhase.missed => (l10n.taskChipMissed, StatusTone.error),
      TaskPhase.notDone => (l10n.taskChipNotDone, StatusTone.error),
    };
    final actedAt = task.actedAt?.storeClock(locale) ?? '';
    final subtitle = showSectionAsSubtitle
        ? task.section
        : switch (phase) {
            TaskPhase.later => l10n.taskOpensAt(
              task.opensAt.storeClock(locale),
            ),
            TaskPhase.open => l10n.taskMinutesLeft(minutesLeft(task, now)),
            TaskPhase.submitted => l10n.taskSubmittedAt(actedAt),
            TaskPhase.verified => l10n.taskVerifiedBy(task.actorName ?? ''),
            TaskPhase.sentBack => l10n.taskSentBackBy(task.actorName ?? ''),
            TaskPhase.missed => l10n.taskAskToUnlock,
            TaskPhase.notDone => l10n.taskMarkedNotDone,
          };
    return TaskTile(
      time: task.dueAt.storeTime(),
      title: l10n.taskTitle(task.number, task.title),
      subtitle: subtitle,
      chipLabel: chip,
      tone: tone,
      onTap: () => openTask(context, task.id),
    );
  }
}

/// Never negative: an overdue open task shows 0 until the server marks it.
int minutesLeft(ChecklistTask task, DateTime now) {
  final minutes = task.dueAt.difference(now).inMinutes;
  return minutes < 0 ? 0 : minutes;
}
