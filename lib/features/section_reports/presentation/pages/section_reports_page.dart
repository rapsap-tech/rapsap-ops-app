import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/core/widgets/load_state_view.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/section_report.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/section_reports_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/widgets/report_card.dart';

/// C17 · Section reports.
class SectionReportsPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final store = context.select<SessionCubit, String>(
      (c) => c.state.user?.storeName ?? '',
    );
    return BlocProvider(
      create: (_) {
        final cubit = getIt<SectionReportsCubit>();
        unawaited(cubit.load());
        return cubit;
      },
      child: AppScaffold(
        header: PageHeader(
          title: context.l10n.sectionReportsTitle,
          subtitle: context.l10n.listSeparatorJoin(
            store,
            DateTime.now().storeHeaderDate(locale),
          ),
        ),
        body: LoadStateView<SectionReportsCubit, List<SectionReport>>(
          isEmpty: (r) => r.isEmpty,
          builder: (context, reports) => RefreshIndicator(
            onRefresh: context.read<SectionReportsCubit>().load,
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: Dimens.pagePadding,
              itemCount: reports.length,
              separatorBuilder: (_, _) => 12.hSpace,
              itemBuilder: (_, i) => ReportCard(report: reports[i]),
            ),
          ),
        ),
      ),
    );
  }
}
