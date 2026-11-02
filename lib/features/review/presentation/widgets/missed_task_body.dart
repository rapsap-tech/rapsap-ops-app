import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_detail.dart';

/// C6: unlock for the staff member, or do it yourself (SM-22, SM-23).
class MissedTaskBody extends StatelessWidget {
  const new({required this.detail, super.key});

  final ReviewDetail detail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final item = detail.item;
    final lockedAt = detail.lockedAt ?? item.at;
    final until = DateTime.now().add(Duration(minutes: detail.unlockMinutes));
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Text(
          l10n.reviewAssignedTo(item.staffName, item.staffRole),
          style: AppTextStyles.base.s13.secondaryTextColor(),
        ),
        Text(
          l10n.taskDueAt(item.at.storeClock(locale)),
          style: AppTextStyles.base.s13.w600.primaryDarkColor(),
        ),
        12.hSpace,
        Text(item.title, style: AppTextStyles.base.s22.w700.l1),
        8.hSpace,
        StatusChip(
          label: l10n.reviewLockedAt(lockedAt.storeClock(locale)),
          tone: StatusTone.error,
        ),
        16.hSpace,
        _Option(
          title: l10n.reviewUnlockTitle(detail.unlockMinutes),
          body: l10n.reviewUnlockBody(item.staffName, until.storeClock(locale)),
        ),
        12.hSpace,
        _Option(title: l10n.reviewDoItTitle, body: l10n.reviewDoItBody),
      ],
    );
  }
}

class _Option extends StatelessWidget {
  const new({required this.title, required this.body});

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => AppCard(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.base.s15.w600),
        4.hSpace,
        Text(body, style: AppTextStyles.base.s13.secondaryTextColor()),
      ],
    ),
  );
}
