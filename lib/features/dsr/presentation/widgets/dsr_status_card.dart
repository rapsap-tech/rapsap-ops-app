import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';

/// "Due by 11:00 PM · 19 OCT 2026 · Not uploaded · Upload today's DSR".
class DsrStatusCard extends StatelessWidget {
  const new({required this.overview, required this.onUpload, super.key});

  final SalesOverview overview;
  final VoidCallback onUpload;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final posting = overview.todaysPosting;
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  overview.date.storeHeaderDate(locale),
                  style: AppTextStyles.base.s19.w700.p1,
                ),
              ),
              Text(
                l10n.dsrDueBy(overview.dueAt.storeClock(locale)),
                style: AppTextStyles.base.s12.secondaryTextColor(),
              ),
            ],
          ),
          8.hSpace,
          _PostingChip(posting: posting, locale: locale),
          12.hSpace,
          AppButton(
            label: posting == null ? l10n.dsrUpload : l10n.dsrReupload,
            variant: posting == null
                ? AppButtonVariant.primary
                : AppButtonVariant.outline,
            onPressed: onUpload,
          ),
        ],
      ),
    );
  }
}

class _PostingChip extends StatelessWidget {
  const new({required this.posting, required this.locale});

  final DsrPosting? posting;
  final String locale;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final posting = this.posting;
    if (posting == null) {
      return StatusChip(label: l10n.dsrNotUploaded, tone: StatusTone.error);
    }
    final postedAt = posting.postedAt;
    if (postedAt == null) {
      return StatusChip(label: l10n.dsrUploaded, tone: StatusTone.success);
    }
    final time = postedAt.storeClock(locale);
    final onTime = posting.onTime ?? true;
    return StatusChip(
      label: onTime ? l10n.dsrUploadedOnTime(time) : l10n.dsrUploadedLate(time),
      tone: onTime ? StatusTone.success : StatusTone.error,
    );
  }
}
