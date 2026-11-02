import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_text_field.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/section_report.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/section_reports_cubit.dart';

/// "Note to HO" + Snapshot + Submit to HO; the snapshot opens after submit.
class SubmitReportForm extends StatelessWidget {
  const new({required this.report, super.key});

  final SectionReport report;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocConsumer<SubmitReportCubit, SubmitReportState>(
      listenWhen: (p, n) =>
          p.status != n.status && n.status == SubmitReportStatus.sent,
      listener: (context, _) => _openSnapshot(context),
      builder: (context, state) {
        final failure = state.failure;
        final cubit = context.read<SubmitReportCubit>();
        return Column(
          children: [
            AppTextField(
              label: l10n.reportNote,
              maxLines: 3,
              maxLength: AppConstants.remarksMaxLength,
              validator: (v) => Validators.optionalText(v, l10n),
              onChanged: cubit.noteChanged,
            ),
            if (failure != null) ...[
              12.hSpace,
              MessageBanner(failure.message(l10n)),
            ],
            12.hSpace,
            Row(
              children: [
                Expanded(
                  child: AppButton(
                    label: l10n.reportSnapshot,
                    variant: AppButtonVariant.outline,
                    onPressed: () => _openSnapshot(context),
                  ),
                ),
                12.wSpace,
                Expanded(
                  child: AppButton(
                    label: l10n.reportSubmit,
                    isLoading: state.status == SubmitReportStatus.sending,
                    onPressed: () => cubit.submit(report.id),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  void _openSnapshot(BuildContext context) {
    final reports = context.read<SectionReportsCubit>();
    unawaited(
      context
          .pushNamed(
            RouteNames.reportSnapshot,
            pathParameters: {RoutePaths.reportIdParam: report.id},
          )
          .then((_) => reports.isClosed ? null : reports.load()),
    );
  }
}
