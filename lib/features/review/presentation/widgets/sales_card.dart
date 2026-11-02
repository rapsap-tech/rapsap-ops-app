import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/extensions/num_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/manager_dashboard.dart';

/// "Sales · October MTD · ₹18.4 L of ₹27.5 L · 67%" (SM-03).
class SalesCard extends StatelessWidget {
  const new({required this.sales, super.key});

  final SalesSummary sales;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    return InkWell(
      borderRadius: BorderRadius.circular(Dimens.radius16),
      onTap: () => context.goNamed(RouteNames.sales),
      child: AppCard(
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.managerSalesMtd(sales.month.monthName(locale)),
                    style: AppTextStyles.base.s13.secondaryTextColor(),
                  ),
                  4.hSpace,
                  Text(
                    l10n.amountOf(
                      sales.salesMtd.lakhs(locale),
                      sales.target.lakhs(locale),
                    ),
                    style: AppTextStyles.base.s16.w700,
                  ),
                  4.hSpace,
                  Text(
                    l10n.dsrDueBy(sales.dsrDueAt.storeClock(locale)),
                    style: AppTextStyles.base.s12.secondaryTextColor(),
                  ),
                ],
              ),
            ),
            Text(l10n.percent(sales.percent), style: AppTextStyles.numeric.s28),
          ],
        ),
      ),
    );
  }
}
