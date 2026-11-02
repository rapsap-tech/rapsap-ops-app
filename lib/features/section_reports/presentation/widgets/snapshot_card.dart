import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/brand_logo.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/report_snapshot.dart';

/// The card that becomes the shared snapshot image (SM-32).
class SnapshotCard extends StatelessWidget {
  const new({required this.snapshot, super.key});

  final ReportSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final s = snapshot;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BrandLogo(),
          12.hSpace,
          Text(s.title, style: AppTextStyles.base.s20.w700),
          Text(s.storeName, style: AppTextStyles.base.s13.secondaryTextColor()),
          Text(
            l10n.snapshotWindow(
              s.date.storeHeaderDate(locale),
              s.opensAt.storeTime(),
              s.closesAt.storeTime(),
            ),
            style: AppTextStyles.base.s13.secondaryTextColor(),
          ),
          12.hSpace,
          Text(
            l10n.statDoneValue(s.done, s.total),
            style: AppTextStyles.numeric.s28,
          ),
          12.hSpace,
          for (final line in s.lines) _Line(line: line),
        ],
      ),
    );
  }
}

class _Line extends StatelessWidget {
  const new({required this.line});

  final SnapshotLine line;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final (mark, color) = switch (line.mark) {
      SnapshotMark.done => (l10n.snapshotMarkDone, AppColors.successText),
      SnapshotMark.missed => (l10n.snapshotMarkMissed, AppColors.errorText),
      SnapshotMark.notDone => (l10n.snapshotMarkNotDone, AppColors.warningText),
    };
    final by = line.by;
    final at = line.at;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Dimens.paddingExtraSmall),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(mark, style: AppTextStyles.base.s14.w700.copyWith(color: color)),
          8.wSpace,
          Expanded(
            child: Text(
              l10n.taskTitle(line.number, line.title),
              style: AppTextStyles.base.s13,
            ),
          ),
          if (by != null || at != null)
            Text(
              [?by, if (at != null) at.storeClock(locale)].join(' · '),
              style: AppTextStyles.base.s11.secondaryTextColor(),
            ),
        ],
      ),
    );
  }
}
