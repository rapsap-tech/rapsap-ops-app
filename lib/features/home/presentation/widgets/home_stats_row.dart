import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';

/// Done / Missed / Left counters.
class HomeStatsRow extends StatelessWidget {
  const new({required this.checklist, super.key});

  final TodayChecklist checklist;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final hasMissed = checklist.missed > 0;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Stat(
            label: l10n.statDone,
            value: l10n.statDoneValue(checklist.done, checklist.total),
          ),
          10.wSpace,
          _Stat(
            label: l10n.statMissed,
            value: '${checklist.missed}',
            alert: hasMissed,
          ),
          10.wSpace,
          _Stat(label: l10n.statLeft, value: '${checklist.left}'),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  const new({required this.label, required this.value, this.alert = false});

  final String label;
  final String value;
  final bool alert;

  @override
  Widget build(BuildContext context) {
    final number = AppTextStyles.numeric.s28.lineHeight(30.8);
    return Expanded(
      child: AppCard(
        radius: Dimens.radius14,
        padding: EdgeInsets.all(Dimens.space13),
        color: alert ? AppColors.errorSurface : AppColors.surface,
        borderColor: alert ? AppColors.error : AppColors.border,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: AppTextStyles.base.s12.secondaryTextColor()),
            2.hSpace,
            Text(value, style: alert ? number.errorColor() : number),
          ],
        ),
      ),
    );
  }
}
