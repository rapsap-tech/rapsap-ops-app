import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/extensions/num_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/brand_logo.dart';
import 'package:rapsap_ops_app/core/widgets/filter_chip_button.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/bloc/dsr_upload_cubit.dart';

/// C23 · DSR saved + snapshot to post in "DSR Reports".
class DsrSavedView extends StatelessWidget {
  const new({required this.snapshotKey, required this.onPost, super.key});

  final GlobalKey snapshotKey;
  final VoidCallback onPost;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final state = context.watch<DsrUploadCubit>().state;
    final saved = state.saved!;
    final failure = state.failure;
    final time = saved.savedAt.storeClock(locale);
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        StatusChip(
          label: saved.onTime
              ? l10n.dsrSavedOnTime(time)
              : l10n.dsrSavedLate(time),
          tone: saved.onTime ? StatusTone.success : StatusTone.error,
        ),
        16.hSpace,
        RepaintBoundary(
          key: snapshotKey,
          child: AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BrandLogo(),
                12.hSpace,
                Text(
                  l10n.dsrSnapshotTitle(saved.date.storeShortDate(locale)),
                  style: AppTextStyles.base.s20.w700,
                ),
                Text(
                  saved.storeName,
                  style: AppTextStyles.base.s13.secondaryTextColor(),
                ),
                12.hSpace,
                Text(
                  saved.sales.rupees(locale),
                  style: AppTextStyles.numeric.s28,
                ),
                Text(
                  l10n.dsrSnapshotLine(
                    saved.bills,
                    saved.ticketSize.round().rupees(locale),
                    saved.mtdPercent,
                  ),
                  style: AppTextStyles.base.s13,
                ),
              ],
            ),
          ),
        ),
        20.hSpace,
        Text(l10n.snapshotPostTo, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        Align(
          alignment: Alignment.centerLeft,
          child: FilterChipButton(
            label: l10n.dsrReportsGroup,
            selected: true,
            onTap: () {},
          ),
        ),
        if (failure != null) ...[
          16.hSpace,
          MessageBanner(failure.message(l10n)),
        ],
        24.hSpace,
        AppButton(
          label: l10n.snapshotPost,
          isLoading: state.stage == DsrStage.posting,
          onPressed: onPost,
        ),
      ],
    );
  }
}
