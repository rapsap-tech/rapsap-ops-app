import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/num_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';

/// Month target: "₹18.4 L of ₹27.5 L · 67% achieved · need ₹75,800 a day".
class TargetCard extends StatelessWidget {
  const new({required this.overview, super.key});

  final SalesOverview overview;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final o = overview;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.dsrMonthTarget(o.date.monthName(locale)),
            style: AppTextStyles.base.s13.secondaryTextColor(),
          ),
          4.hSpace,
          Text(
            l10n.amountOf(o.salesMtd.lakhs(locale), o.target.lakhs(locale)),
            style: AppTextStyles.base.s20.w700,
          ),
          8.hSpace,
          ClipRRect(
            borderRadius: BorderRadius.circular(Dimens.radiusPill),
            child: LinearProgressIndicator(
              value: (o.percent / 100).clamp(0, 1).toDouble(),
              minHeight: Dimens.progressHeight,
              color: AppColors.primary,
              backgroundColor: AppColors.track,
            ),
          ),
          8.hSpace,
          Text(l10n.dsrAchieved(o.percent), style: AppTextStyles.base.s13.w600),
          Text(
            l10n.dsrNeedPerDay(o.needPerDay.rupees(locale)),
            style: AppTextStyles.base.s12.secondaryTextColor(),
          ),
        ],
      ),
    );
  }
}
