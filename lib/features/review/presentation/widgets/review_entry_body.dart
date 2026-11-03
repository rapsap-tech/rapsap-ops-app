import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/photo_proof.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_detail.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';

/// C3: who submitted, the photo proof and remarks (or the not-done reason).
class ReviewEntryBody extends StatelessWidget {
  const new({required this.detail, super.key});

  final ReviewDetail detail;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final item = detail.item;
    final remarks = detail.remarks;
    final reason = item.reason;
    final (chip, tone) = switch (item.kind) {
      ReviewKind.needsReview => (l10n.reviewChipNeedsReview, StatusTone.info),
      ReviewKind.notDone => (l10n.taskChipNotDone, StatusTone.error),
      ReviewKind.openNow => (l10n.taskChipDueSoon, StatusTone.info),
      ReviewKind.missed => (l10n.taskChipMissed, StatusTone.error),
    };
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Text(
          l10n.reviewSubmittedBy(item.staffName),
          style: AppTextStyles.base.s13.secondaryTextColor(),
        ),
        Text(
          l10n.reviewToday(item.at.storeClock(locale)),
          style: AppTextStyles.base.s12.secondaryTextColor(),
        ),
        12.hSpace,
        Text(item.title, style: AppTextStyles.base.s22.w700.l1),
        8.hSpace,
        Row(
          children: [
            StatusChip(label: chip, tone: tone),
            8.wSpace,
            Text(
              l10n.taskHeader(item.section, item.number),
              style: AppTextStyles.base.s13.secondaryTextColor(),
            ),
          ],
        ),
        16.hSpace,
        if (item.kind == ReviewKind.notDone && reason != null) ...[
          Text(l10n.reviewReason, style: AppTextStyles.base.s14.w600),
          6.hSpace,
          Text(reason, style: AppTextStyles.base.s15),
        ] else if (item.kind == ReviewKind.needsReview) ...[
          Text(l10n.taskPhotoProof, style: AppTextStyles.base.s14.w600),
          8.hSpace,
          StoredPhoto(url: detail.photoUrl, videoUrl: detail.videoUrl),
        ],
        if (remarks != null) ...[
          16.hSpace,
          Text(l10n.taskRemarks, style: AppTextStyles.base.s14.w600),
          6.hSpace,
          Text(remarks, style: AppTextStyles.base.s15),
        ],
      ],
    );
  }
}
