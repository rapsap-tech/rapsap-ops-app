import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/profile/domain/entities/profile.dart';

/// "This month · 91% on time · Done 168 · Missed 4".
class MonthStatsCard extends StatelessWidget {
  const new({required this.profile, super.key});

  final Profile profile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(l10n.profileThisMonth, style: AppTextStyles.base.s14.w600),
          8.hSpace,
          Text(
            l10n.profileOnTime(profile.onTimePercent),
            style: AppTextStyles.numeric.s28,
          ),
          4.hSpace,
          Text(
            l10n.profileDoneMissed(
              profile.doneThisMonth,
              profile.missedThisMonth,
            ),
            style: AppTextStyles.base.s13.secondaryTextColor(),
          ),
        ],
      ),
    );
  }
}
