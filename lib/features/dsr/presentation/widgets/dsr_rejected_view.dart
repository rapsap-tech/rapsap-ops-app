import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/extensions/navigation_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/bloc/dsr_upload_cubit.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/widgets/dsr_file_card.dart';

/// C22 · Can't save this file.
class DsrRejectedView extends StatelessWidget {
  const new({required this.onRetry, super.key});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<DsrUploadCubit>().state;
    final file = state.file;
    final failure = state.failure;
    final reasons = [
      l10n.dsrUnreadableDate,
      l10n.dsrNoSales,
      l10n.dsrTooLarge(AppConstants.dsrMaxUploadMb),
      l10n.dsrHasMacros,
    ];
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        if (file != null) ...[
          DsrFileCard(
            name: file.name,
            size: file.size,
            note: l10n.dsrNotReadable,
          ),
          16.hSpace,
        ],
        if (failure != null) MessageBanner(failure.message(l10n)),
        20.hSpace,
        Text(l10n.dsrOtherReasons, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        for (final r in reasons)
          Padding(
            padding: EdgeInsets.only(bottom: Dimens.paddingExtraSmall),
            child: Text(
              '•  $r',
              style: AppTextStyles.base.s13.secondaryTextColor(),
            ),
          ),
        24.hSpace,
        AppButton(label: l10n.dsrUploadAnother, onPressed: onRetry),
        12.hSpace,
        AppButton(
          label: l10n.actionCancel,
          variant: AppButtonVariant.secondary,
          onPressed: () => context.back(fallback: RouteNames.sales),
        ),
      ],
    );
  }
}
