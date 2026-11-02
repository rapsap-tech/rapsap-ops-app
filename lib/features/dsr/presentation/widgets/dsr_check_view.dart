import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/info_rows_card.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/dsr_check.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/bloc/dsr_upload_cubit.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/widgets/dsr_file_card.dart';

/// C21 · Check before saving.
class DsrCheckView extends StatelessWidget {
  const new({required this.onChange, super.key});

  final VoidCallback onChange;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<DsrUploadCubit>().state;
    final check = state.check!;
    final failure = state.failure;
    String label(DsrField f) => switch (f) {
      DsrField.store => l10n.profileStore,
      DsrField.date => l10n.dsrDate,
      DsrField.netSales => l10n.dsrNetSales,
      DsrField.bills => l10n.summaryBills,
      DsrField.monthTarget => l10n.dsrMonthTargetShort,
    };
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        DsrFileCard(
          name: check.fileName,
          size: check.size,
          note: l10n.dsrReadNow,
          onChange: state.stage == DsrStage.saving ? null : onChange,
        ),
        16.hSpace,
        InfoRowsCard(
          rows: [
            for (final line in check.lines)
              (label(line.field), '${line.value} ${line.ok ? '✓' : '✕'}'),
          ],
        ),
        for (final w in check.warnings) ...[12.hSpace, _Warning(text: w)],
        if (check.replacesExisting) ...[
          12.hSpace,
          _Warning(text: l10n.dsrReplaces),
        ],
        if (failure != null) ...[
          12.hSpace,
          MessageBanner(failure.message(l10n)),
        ],
        24.hSpace,
        AppButton(
          label: l10n.dsrSave,
          isLoading: state.stage == DsrStage.saving,
          onPressed: context.read<DsrUploadCubit>().save,
        ),
      ],
    );
  }
}

class _Warning extends StatelessWidget {
  const new({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: Dimens.bannerPadding,
    decoration: BoxDecoration(
      color: AppColors.warningSurface,
      borderRadius: BorderRadius.circular(Dimens.radius12),
    ),
    child: Text(
      text,
      style: AppTextStyles.base.s13.copyWith(color: AppColors.warningText),
    ),
  );
}
