import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/task_display.dart';

/// Builds the section headers and task tiles as list items.
List<Widget> checklistSectionItems({
  required BuildContext context,
  required TodayChecklist checklist,
  required ChecklistFilter filter,
  required DateTime now,
}) {
  return [
    for (final section in checklist.sections)
      if (section.tasks.any((t) => checklist.matches(t, filter, now))) ...[
        _SectionHeader(section: section),
        for (final task in section.tasks)
          if (checklist.matches(task, filter, now))
            ChecklistTaskTile(task: task, now: now),
      ],
  ];
}

class _SectionHeader extends StatelessWidget {
  const new({required this.section});

  final ChecklistSection section;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final from = section.opensAt.storeTime();
    final closesAt = section.closesAt;
    final name = l10n.sectionName(section.name);
    final text = closesAt == null
        ? l10n.sectionFrom(name, from)
        : l10n.sectionWindow(name, from, closesAt.storeTime());
    return Semantics(
      header: true,
      child: Text(
        text.toUpperCase(),
        style: AppTextStyles.base.s11.w700.p7.secondaryTextColor(),
      ),
    );
  }
}
