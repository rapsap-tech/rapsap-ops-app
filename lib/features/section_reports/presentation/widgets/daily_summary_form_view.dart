import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/extensions/num_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_text_field.dart';
import 'package:rapsap_ops_app/core/widgets/info_rows_card.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/daily_summary.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/daily_summary_cubit.dart';

/// Read-only DSR figures + the SM's closing numbers (SM-31).
class DailySummaryFormView extends StatelessWidget {
  const new({required this.form, super.key});

  final DailySummaryForm form;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final state = context.watch<DailySummaryCubit>().state;
    final cubit = context.read<DailySummaryCubit>();
    final dsr = form.dsr!;
    final failure = state.failure;
    Widget number(
      SummaryField field,
      String label, {
      bool decimal = false,
      String? Function(String?)? validator,
    }) => Padding(
      padding: EdgeInsets.only(bottom: Dimens.paddingMedium),
      child: AppTextField(
        label: label,
        keyboardType: TextInputType.numberWithOptions(decimal: decimal),
        maxLength: AppConstants.summaryNumberMaxLength,
        inputFormatters: [
          FilteringTextInputFormatter.allow(
            decimal ? AppConstants.decimalInput : AppConstants.integerInput,
          ),
        ],
        validator: validator ?? (v) => Validators.requiredNumber(v, l10n),
        onChanged: (v) => cubit.changed(field, v),
      ),
    );
    return ListView(
      padding: Dimens.pagePadding,
      children: [
        Text(l10n.summaryFromDsr, style: AppTextStyles.base.s14.w600),
        8.hSpace,
        InfoRowsCard(
          rows: [
            (l10n.summarySales, dsr.sales.rupees(locale)),
            (l10n.summaryBills, '${dsr.bills}'),
            (l10n.summaryTicket, dsr.ticketSize.round().rupees(locale)),
          ],
        ),
        6.hSpace,
        Text(
          l10n.summaryFixExcel,
          style: AppTextStyles.base.s12.secondaryTextColor(),
        ),
        20.hSpace,
        number(
          SummaryField.margin,
          l10n.summaryMargin,
          decimal: true,
          validator: (v) => Validators.numberInRange(v, 0, 100, l10n),
        ),
        number(
          SummaryField.complaints,
          l10n.summaryComplaints,
          validator: (v) => Validators.numberInRange(
            v,
            0,
            AppConstants.summaryMaxCount,
            l10n,
          ),
        ),
        number(
          SummaryField.damages,
          l10n.summaryDamages,
          decimal: true,
          validator: (v) => Validators.numberInRange(
            v,
            0,
            AppConstants.summaryMaxAmount,
            l10n,
          ),
        ),
        number(
          SummaryField.shrinkage,
          l10n.summaryShrinkage,
          decimal: true,
          validator: (v) => Validators.numberInRange(
            v,
            0,
            AppConstants.summaryMaxAmount,
            l10n,
          ),
        ),
        number(
          SummaryField.manpower,
          l10n.summaryManpower(form.staffTotal),
          validator: (v) =>
              Validators.numberInRange(v, 0, form.staffTotal, l10n),
        ),
        AppTextField(
          label: l10n.summaryKeyIssues,
          maxLines: 3,
          maxLength: AppConstants.remarksMaxLength,
          validator: (v) => Validators.optionalText(v, l10n),
          onChanged: (v) => cubit.changed(SummaryField.keyIssues, v),
        ),
        if (failure != null) ...[
          16.hSpace,
          MessageBanner(failure.message(l10n)),
        ],
        24.hSpace,
        AppButton(
          label: l10n.summarySend,
          isLoading: state.sending,
          onPressed: state.valid ? cubit.submit : null,
        ),
      ],
    );
  }
}
