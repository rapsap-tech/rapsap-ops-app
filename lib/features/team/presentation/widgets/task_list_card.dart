import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';

/// "Tasks from these roles" + "+ Add a task" (extra tasks outside the roles).
class TaskListCard extends StatelessWidget {
  const new({
    required this.tasks,
    required this.catalog,
    required this.extraTaskIds,
    required this.onToggleExtra,
    super.key,
  });

  final List<TaskTemplate> tasks;
  final RoleCatalog catalog;
  final Set<String> extraTaskIds;
  final ValueChanged<String> onToggleExtra;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.teamTasksFromRoles,
                  style: AppTextStyles.base.s14.w600,
                ),
              ),
              Text('${tasks.length}', style: AppTextStyles.numeric.s20),
            ],
          ),
          8.hSpace,
          for (final t in tasks)
            Padding(
              padding: EdgeInsets.symmetric(vertical: Dimens.paddingExtraSmall),
              child: Text(
                l10n.taskTitle(t.number, t.title),
                style: AppTextStyles.base.s13,
              ),
            ),
          TextButton(
            onPressed: () => unawaited(_addTask(context)),
            child: Text(
              l10n.teamAddTask,
              style: AppTextStyles.base.s14.w600.primaryDarkColor(),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _addTask(BuildContext context) => showModalBottomSheet<void>(
    context: context,
    builder: (sheet) => SafeArea(
      child: ListView(
        shrinkWrap: true,
        children: [
          for (final t in catalog.tasks)
            CheckboxListTile(
              value: extraTaskIds.contains(t.id) || tasks.contains(t),
              activeColor: AppColors.primary,
              title: Text(
                context.l10n.taskTitle(t.number, t.title),
                style: AppTextStyles.base.s14,
              ),
              onChanged: tasks.contains(t) && !extraTaskIds.contains(t.id)
                  ? null
                  : (_) {
                      onToggleExtra(t.id);
                      Navigator.of(sheet).pop();
                    },
            ),
        ],
      ),
    ),
  );
}
