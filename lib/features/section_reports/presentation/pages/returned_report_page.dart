import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/core/widgets/result_view.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/section_report.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/section_reports_cubit.dart';

/// X10 report returned → fix the entry → X11 revised report sent.
class ReturnedReportPage extends StatelessWidget {
  const new({required this.reportId, super.key});

  final String reportId;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) {
            final cubit = getIt<SectionReportsCubit>();
            unawaited(cubit.load());
            return cubit;
          },
        ),
        BlocProvider(create: (_) => getIt<SubmitReportCubit>()),
      ],
      child: AppScaffold(
        header: PageHeader(title: context.l10n.sectionReportsTitle),
        body: BlocBuilder<SectionReportsCubit, LoadState<List<SectionReport>>>(
          builder: (context, state) {
            final report = state.data
                ?.where((r) => r.id == reportId)
                .firstOrNull;
            if (report == null) {
              return state.status == LoadStatus.loading
                  ? const Center(child: AppLoader())
                  : const SizedBox.shrink();
            }
            return _Body(report: report);
          },
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const new({required this.report});

  final SectionReport report;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final submit = context.watch<SubmitReportCubit>().state;
    final note = report.returnNote;
    if (submit.status == SubmitReportStatus.sent) {
      return ResultView(
        tone: ResultTone.confirmed,
        badge: l10n.resultConfirmed,
        title: l10n.reportResubmittedTitle,
        message: l10n.reportResubmittedBody,
        details: [
          l10n.reportRevision(report.section, report.revision + 1),
          if (note != null) l10n.reportNewPhoto(note.taskNumber),
        ],
        primary: ResultAction(
          label: l10n.reportBackToReports,
          onPressed: context.pop,
        ),
      );
    }
    return ResultView(
      tone: ResultTone.actionNeeded,
      badge: l10n.resultActionNeeded,
      title: l10n.reportNeedsCorrection(report.section),
      message: l10n.reportReturnedBody,
      details: [
        if (note != null) ...[
          l10n.taskTitle(note.taskNumber, note.taskTitle),
          '“${note.comment}”',
          l10n.reportReturnedAt(note.at.storeClock(locale)),
        ],
      ],
      primary: ResultAction(
        label: l10n.reportSendRevised,
        isLoading: submit.status == SubmitReportStatus.sending,
        onPressed: () => context.read<SubmitReportCubit>().submit(report.id),
      ),
      secondary: note == null
          ? null
          : ResultAction(
              label: l10n.reportFixEntry,
              onPressed: () => unawaited(
                context.pushNamed(
                  RouteNames.reviewEdit,
                  pathParameters: {RoutePaths.taskIdParam: note.taskId},
                ),
              ),
            ),
    );
  }
}
