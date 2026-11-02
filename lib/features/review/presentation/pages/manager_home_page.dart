import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/load_state_view.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/home/presentation/widgets/home_greeting.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/manager_dashboard.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/manager_dashboard_cubit.dart';
import 'package:rapsap_ops_app/features/review/presentation/widgets/overall_progress_card.dart';
import 'package:rapsap_ops_app/features/review/presentation/widgets/sales_card.dart';
import 'package:rapsap_ops_app/features/review/presentation/widgets/section_progress_tile.dart';

/// C1 · SM home. [ManagerDashboardCubit] lives in the shell.
class ManagerHomePage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadStateView<ManagerDashboardCubit, ManagerDashboard>(
      builder: (context, dashboard) => _Body(dashboard: dashboard),
    );
  }
}

class _Body extends StatelessWidget {
  const new({required this.dashboard});

  final ManagerDashboard dashboard;

  @override
  Widget build(BuildContext context) {
    final user = context.select<SessionCubit, User?>((c) => c.state.user);
    final sales = dashboard.sales;
    final children = [
      HomeGreeting(
        name: user?.name ?? '',
        jobRoles: [context.l10n.roleStoreManager],
        date: dashboard.date,
      ),
      OverallProgressCard(dashboard: dashboard),
      Text(context.l10n.managerSections, style: AppTextStyles.base.s14.w600),
      for (final section in dashboard.sections)
        SectionProgressTile(section: section),
      if (sales != null) SalesCard(sales: sales),
    ];
    return RefreshIndicator(
      onRefresh: context.read<ManagerDashboardCubit>().load,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: Dimens.pagePadding,
        itemCount: children.length,
        separatorBuilder: (_, _) => 12.hSpace,
        itemBuilder: (_, i) => children[i],
      ),
    );
  }
}
