import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/section_reports_cubit.dart';

/// Closing section: #46 walkthrough, #47 closing report, daily summary.
class ClosingActions extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final reports = context.read<SectionReportsCubit>();
    void go(String route) => unawaited(
      context
          .pushNamed(route)
          .then((_) => reports.isClosed ? null : reports.load()),
    );
    return Column(
      children: [
        AppButton(
          label: l10n.reportWalkthrough,
          variant: AppButtonVariant.outline,
          onPressed: () => go(RouteNames.walkthrough),
        ),
        12.hSpace,
        AppButton(
          label: l10n.reportClosing,
          variant: AppButtonVariant.outline,
          onPressed: () => go(RouteNames.closingReport),
        ),
        12.hSpace,
        AppButton(
          label: l10n.reportDailySummary,
          onPressed: () => go(RouteNames.dailySummary),
        ),
      ],
    );
  }
}
