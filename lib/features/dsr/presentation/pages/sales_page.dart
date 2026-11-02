import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/bloc/sales_cubit.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/widgets/dsr_status_card.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/widgets/posting_history.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/widgets/target_card.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/widgets/trend_card.dart';

/// C20 · Sales (DSR) tab.
class SalesPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<SalesCubit>();
        unawaited(cubit.load());
        return cubit;
      },
      child: BlocListener<ConnectivityCubit, ConnectivityStatus>(
        listenWhen: (_, n) => n == ConnectivityStatus.online,
        listener: (context, _) =>
            context.read<SalesCubit>().onConnectionRestored(),
        child: BlocBuilder<SalesCubit, SalesState>(
          builder: (context, state) {
            final overview = state.overview;
            if (overview != null) return _Body(overview: overview);
            return state.status == LoadStatus.loading
                ? const Center(child: AppLoader())
                : AppMessageView(
                    message:
                        state.failure?.message(context.l10n) ??
                        context.l10n.errorUnknown,
                    onRetry: context.read<SalesCubit>().load,
                  );
          },
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const new({required this.overview});

  final SalesOverview overview;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SalesCubit>();
    return RefreshIndicator(
      onRefresh: cubit.load,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: Dimens.pagePadding,
        children: [
          Text(context.l10n.salesTitle, style: AppTextStyles.base.s24.w700.l1),
          12.hSpace,
          DsrStatusCard(
            overview: overview,
            onUpload: () => unawaited(
              context.pushNamed(RouteNames.dsrUpload).then((_) {
                if (!cubit.isClosed) unawaited(cubit.load());
              }),
            ),
          ),
          12.hSpace,
          TargetCard(overview: overview),
          12.hSpace,
          TrendCard(overview: overview),
          12.hSpace,
          PostingHistory(history: overview.history),
        ],
      ),
    );
  }
}
