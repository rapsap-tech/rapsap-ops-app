import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';

/// Name + job roles on the left, date + shift on the right.
class HomeGreeting extends StatelessWidget {
  const new({
    required this.name,
    required this.jobRoles,
    required this.date,
    this.shift,
    super.key,
  });

  final String name;
  final List<String> jobRoles;
  final DateTime date;
  final Shift? shift;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final shiftLabel = switch (shift) {
      Shift.opening => l10n.shiftOpening,
      Shift.mid => l10n.shiftMid,
      Shift.closing => l10n.shiftClosing,
      null => null,
    };
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: AppTextStyles.base.s22.w700.l1),
              6.hSpace,
              Text(
                jobRoles.join(l10n.listSeparator),
                style: AppTextStyles.base.s13.secondaryTextColor(),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              date.storeHeaderDate(locale),
              style: AppTextStyles.base.s19.w700.p1,
            ),
            if (shiftLabel != null) ...[
              6.hSpace,
              StatusChip(
                label: shiftLabel.toUpperCase(),
                tone: StatusTone.neutral,
              ),
            ],
          ],
        ),
      ],
    );
  }
}
