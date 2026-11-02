import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/photo_proof.dart';

/// B8: locked after the grace time; only the SM can unlock.
class MissedSection extends StatelessWidget {
  const new({required this.detail, super.key});

  final TaskDetail detail;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final lockedAt = detail.lockedAt ?? detail.task.dueAt;
    final style = AppTextStyles.base.s13.w600.errorColor();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCard(
          color: AppColors.errorSurface,
          borderColor: AppColors.errorSurface,
          child: SizedBox(
            height: Dimens.photoBoxHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.lock_outline_rounded,
                  size: Dimens.iconMedium,
                  color: AppColors.errorText,
                ),
                8.hSpace,
                Text(
                  context.l10n.taskLockedAt(lockedAt.storeClock(locale)),
                  style: style,
                ),
              ],
            ),
          ),
        ),
        16.hSpace,
        Text(
          context.l10n.taskLockedHelp,
          style: AppTextStyles.base.s13.secondaryTextColor(),
        ),
      ],
    );
  }
}

class LaterSection extends StatelessWidget {
  const new({required this.task, super.key});

  final ChecklistTask task;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    return Text(
      context.l10n.taskOpensLater(task.opensAt.storeClock(locale)),
      style: AppTextStyles.base.s15.secondaryTextColor(),
    );
  }
}

/// Submitted, verified or not done: show what was sent.
class DoneSection extends StatelessWidget {
  const new({required this.detail, super.key});

  final TaskDetail detail;

  @override
  Widget build(BuildContext context) {
    final remarks = detail.remarks;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (detail.task.status != TaskStatus.notDone) ...[
          Text(context.l10n.taskYourPhoto, style: AppTextStyles.base.s14.w600),
          8.hSpace,
          StoredPhoto(url: detail.photoUrl),
        ],
        if (remarks != null && remarks.isNotEmpty) ...[
          16.hSpace,
          Text(remarks, style: AppTextStyles.base.s15),
        ],
      ],
    );
  }
}
