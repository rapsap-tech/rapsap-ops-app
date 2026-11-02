import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/core/widgets/status_chip.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/section_report.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/section_reports_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/widgets/closing_actions.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/widgets/submit_report_form.dart';

/// One section in C17; what it offers depends on its status.
class ReportCard extends StatelessWidget {
  const new({required this.report, super.key});

  final SectionReport report;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final at = report.statusAt?.storeClock(locale) ?? '';
    final (label, tone) = switch (report.status) {
      ReportStatus.notReady => (l10n.reportNotReady, StatusTone.neutral),
      ReportStatus.ready => (l10n.reportReady, StatusTone.info),
      ReportStatus.submitted => (
        l10n.reportSubmittedAt(at),
        StatusTone.neutral,
      ),
      ReportStatus.approved => (l10n.reportApprovedAt(at), StatusTone.success),
      ReportStatus.returned => (l10n.reportReturned, StatusTone.error),
    };
    return AppCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(report.section, style: AppTextStyles.base.s16.w700),
              ),
              Text(
                l10n.statDoneValue(report.done, report.total),
                style: AppTextStyles.numeric.s20,
              ),
            ],
          ),
          6.hSpace,
          StatusChip(label: label, tone: tone),
          8.hSpace,
          _Detail(report: report),
          ..._actions(context),
        ],
      ),
    );
  }

  List<Widget> _actions(BuildContext context) {
    final l10n = context.l10n;
    return switch (report.status) {
      ReportStatus.ready when report.includesDailySummary => [
        12.hSpace,
        const ClosingActions(),
      ],
      ReportStatus.ready => [
        12.hSpace,
        BlocProvider(
          create: (_) => getIt<SubmitReportCubit>(),
          child: SubmitReportForm(report: report),
        ),
      ],
      ReportStatus.notReady when report.includesDailySummary => [
        12.hSpace,
        const ClosingActions(),
      ],
      ReportStatus.submitted || ReportStatus.approved => [
        12.hSpace,
        AppButton(
          label: l10n.reportSnapshot,
          variant: AppButtonVariant.outline,
          onPressed: () => _push(context, RouteNames.reportSnapshot),
        ),
      ],
      ReportStatus.returned => [
        12.hSpace,
        AppButton(
          label: l10n.reportFix,
          variant: AppButtonVariant.danger,
          onPressed: () => _push(context, RouteNames.reportReturned),
        ),
      ],
      ReportStatus.notReady => const [],
    };
  }

  void _push(BuildContext context, String route) {
    final reports = context.read<SectionReportsCubit>();
    unawaited(
      context
          .pushNamed(
            route,
            pathParameters: {RoutePaths.reportIdParam: report.id},
          )
          .then((_) => reports.isClosed ? null : reports.load()),
    );
  }
}

class _Detail extends StatelessWidget {
  const new({required this.report});

  final SectionReport report;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final note = report.returnNote;
    final text = switch (report.status) {
      ReportStatus.returned when note != null => l10n.reportReturnedLine(
        note.taskNumber,
        note.comment,
      ),
      ReportStatus.notReady when report.includesDailySummary =>
        l10n.reportOpensWithSummary(report.opensAt.storeClock(locale)),
      ReportStatus.notReady => l10n.reportSendAfterLast,
      _ => l10n.reportStats(report.notDone, report.photos, report.toVerify),
    };
    return Text(text, style: AppTextStyles.base.s13.secondaryTextColor());
  }
}
