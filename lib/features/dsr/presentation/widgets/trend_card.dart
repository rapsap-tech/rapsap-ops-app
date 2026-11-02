import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/filter_chip_button.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/bloc/sales_cubit.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/widgets/trend_chart.dart';

/// Trend with 1M / 3M / 6M / 1Y and the change vs the same days before.
class TrendCard extends StatelessWidget {
  const new({required this.overview, super.key});

  final SalesOverview overview;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final period = context.select<SalesCubit, TrendPeriod>(
      (c) => c.state.period,
    );
    final labels = {
      TrendPeriod.month: l10n.dsrPeriod1M,
      TrendPeriod.quarter: l10n.dsrPeriod3M,
      TrendPeriod.half: l10n.dsrPeriod6M,
      TrendPeriod.year: l10n.dsrPeriod1Y,
    };
    final change = overview.changePercent;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(l10n.dsrTrend, style: AppTextStyles.base.s16.w700),
              ),
              Text(
                l10n.dsrChangePercent(
                  change >= 0 ? '+' : '',
                  change.toStringAsFixed(1),
                ),
                style: AppTextStyles.base.s14.w700.copyWith(
                  color: change >= 0
                      ? AppColors.successText
                      : AppColors.errorText,
                ),
              ),
            ],
          ),
          8.hSpace,
          Wrap(
            spacing: Dimens.paddingSmall,
            children: [
              for (final entry in labels.entries)
                FilterChipButton(
                  label: entry.value,
                  selected: entry.key == period,
                  onTap: () =>
                      context.read<SalesCubit>().selectPeriod(entry.key),
                ),
            ],
          ),
          12.hSpace,
          Semantics(
            label: l10n.dsrTrendLabel,
            child: SizedBox(
              height: Dimens.chartHeight,
              child: TrendChart(points: overview.trend),
            ),
          ),
          8.hSpace,
          Text(
            l10n.dsrLegend,
            style: AppTextStyles.base.s11.secondaryTextColor(),
          ),
        ],
      ),
    );
  }
}
