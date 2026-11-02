import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/manager_dashboard.dart';

/// "All Checklist · 18 of 45 activities completed" + review shortcuts (SM-02).
class OverallProgressCard extends StatelessWidget {
  const new({required this.dashboard, super.key});

  final ManagerDashboard dashboard;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final d = dashboard;
    final progress = d.total == 0 ? 0.0 : d.done / d.total;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  l10n.managerAllChecklist,
                  style: AppTextStyles.base.s16.w700,
                ),
              ),
              Text(
                l10n.checklistDoneOf(d.done, d.total),
                style: AppTextStyles.numeric.s28,
              ),
            ],
          ),
          Text(
            l10n.managerActivitiesDone,
            style: AppTextStyles.base.s12.secondaryTextColor(),
          ),
          10.hSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.radiusPill),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: Dimens.progressHeight,
              color: AppColors.primary,
              backgroundColor: AppColors.track,
            ),
          ),
          12.hSpace,
          Wrap(
            spacing: Dimens.paddingSmall,
            runSpacing: Dimens.paddingSmall,
            children: [
              _Shortcut(
                label: l10n.managerToReview(d.toReview),
                tone: StatusTone.info,
              ),
              _Shortcut(
                label: l10n.managerMissed(d.missed),
                tone: StatusTone.error,
              ),
              _Shortcut(
                label: l10n.managerNotDone(d.notDone),
                tone: StatusTone.neutral,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Shortcut extends StatelessWidget {
  const new({required this.label, required this.tone});

  final String label;
  final StatusTone tone;

  @override
  Widget build(BuildContext context) => InkWell(
    borderRadius: BorderRadius.circular(Dimens.radiusPill),
    onTap: () => context.goNamed(RouteNames.checklist),
    child: StatusChip(label: label, tone: tone),
  );
}
