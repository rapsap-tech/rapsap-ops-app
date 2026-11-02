import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';

/// X6 · No pending tasks, shown in place of "Do this now".
class CaughtUpCard extends StatelessWidget {
  const new({required this.next, super.key});

  final ChecklistTask? next;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final next = this.next;
    return AppCard(
      borderColor: AppColors.success,
      color: AppColors.successSurface,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.caughtUpTitle, style: AppTextStyles.base.s20.w700),
          6.hSpace,
          Text(
            l10n.caughtUpBody,
            style: AppTextStyles.base.s14.secondaryTextColor(),
          ),
          if (next != null) ...[
            12.hSpace,
            Text(
              l10n.caughtUpNext(l10n.taskTitle(next.number, next.title)),
              style: AppTextStyles.base.s14.w600,
            ),
            4.hSpace,
            Text(
              l10n.caughtUpOpens(next.opensAt.storeClock(locale)),
              style: AppTextStyles.base.s13.secondaryTextColor(),
            ),
          ],
        ],
      ),
    );
  }
}
