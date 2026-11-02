import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/core/widgets/result_view.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/daily_summary_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/widgets/daily_summary_form_view.dart';

/// C18 · Closing daily summary; X12 when today's DSR is missing.
class DailySummaryPage extends StatelessWidget {
  const new({super.key});

  static const String _closingReportId = 'closing';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<DailySummaryCubit>(),
      child: BlocListener<DailySummaryCubit, DailySummaryState>(
        listenWhen: (p, n) => n.sent && !p.sent,
        listener: (context, _) => context.pushReplacementNamed(
          RouteNames.reportSnapshot,
          pathParameters: {RoutePaths.reportIdParam: _closingReportId},
        ),
        child: const _View(),
      ),
    );
  }
}

class _View extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<DailySummaryCubit>().state;
    final form = state.form;
    final body = switch (state.load) {
      LoadStatus.loading => const Center(child: AppLoader()),
      LoadStatus.failure => AppMessageView(
        message: state.failure?.message(l10n) ?? l10n.errorUnknown,
        onRetry: context.read<DailySummaryCubit>().load,
      ),
      LoadStatus.success when form?.dsr == null => ResultView(
        tone: ResultTone.actionNeeded,
        badge: l10n.resultActionNeeded,
        title: l10n.summaryDsrFirstTitle,
        message: l10n.summaryDsrFirstBody,
        details: [
          l10n.summaryNotAvailable(l10n.summarySales),
          l10n.summaryNotAvailable(l10n.summaryBills),
          l10n.summaryNotAvailable(l10n.summaryTicket),
        ],
        primary: ResultAction(
          label: l10n.summaryGoToSales,
          onPressed: () => context.goNamed(RouteNames.sales),
        ),
      ),
      LoadStatus.success => DailySummaryFormView(form: form!),
    };
    return AppScaffold(
      header: PageHeader(
        title: l10n.summaryTitle,
        subtitle: l10n.summarySubtitle,
      ),
      body: body,
    );
  }
}
