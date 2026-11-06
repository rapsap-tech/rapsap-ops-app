import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';

class PostingHistory extends StatelessWidget {
  const new({required this.history, super.key});

  final List<DsrPosting> history;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.dsrHistory, style: AppTextStyles.base.s16.w700),
          for (final h in history) ...[
            Divider(color: AppColors.divider, height: Dimens.paddingMedium),
            Row(
              children: [
                Expanded(
                  child: Text(
                    h.date.storeShortDate(locale),
                    style: AppTextStyles.base.s14.w600,
                  ),
                ),
                if (h.postedAt case final postedAt?) ...[
                  Text(
                    postedAt.storeClock(locale),
                    style: AppTextStyles.base.s13.secondaryTextColor(),
                  ),
                  12.wSpace,
                ],
                if (h.onTime case final onTime?)
                  StatusChip(
                    label: onTime ? l10n.dsrOnTime : l10n.dsrLate,
                    tone: onTime ? StatusTone.success : StatusTone.error,
                  ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
