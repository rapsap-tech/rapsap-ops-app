import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';

/// "My checklist · 2 of 9 tasks done today" with a progress bar.
class ChecklistSummaryCard extends StatelessWidget {
  const new({required this.checklist, super.key});

  final TodayChecklist checklist;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final progress = checklist.total == 0
        ? 0.0
        : checklist.done / checklist.total;
    return AppCard(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.checklistMyTitle,
                  style: AppTextStyles.base.s20.w700,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    l10n.checklistDoneOf(checklist.done, checklist.total),
                    style: AppTextStyles.numeric.s28.p1,
                  ),
                  Text(
                    l10n.checklistDoneToday,
                    style: AppTextStyles.base.s12.secondaryTextColor(),
                  ),
                ],
              ),
            ],
          ),
          10.hSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.radiusPill),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: Dimens.progressHeight,
              color: AppColors.primary,
              backgroundColor: AppColors.track,
              semanticsLabel: l10n.checklistDoneToday,
            ),
          ),
        ],
      ),
    );
  }
}
