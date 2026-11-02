import 'dart:async';

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
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_detail_cubit.dart';
import 'package:rapsap_ops_app/features/review/presentation/widgets/missed_task_body.dart';
import 'package:rapsap_ops_app/features/review/presentation/widgets/review_actions.dart';
import 'package:rapsap_ops_app/features/review/presentation/widgets/review_entry_body.dart';
import 'package:rapsap_ops_app/features/review/presentation/widgets/review_result_view.dart';

/// C3 report review · C6 missed task · X5 review complete.
class ReviewDetailPage extends StatelessWidget {
  const new({required this.taskId, super.key});

  final String taskId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final cubit = getIt<ReviewDetailCubit>();
        unawaited(cubit.load(taskId));
        return cubit;
      },
      child: BlocListener<ReviewDetailCubit, ReviewDetailState>(
        listenWhen: (prev, next) =>
            next.done == ReviewAction.takeOver && prev.done == null,
        // SM does it himself: same capture flow as staff (SM-22).
        listener: (context, _) => context.pushReplacementNamed(
          RouteNames.task,
          pathParameters: {RoutePaths.taskIdParam: taskId},
          queryParameters: {RoutePaths.openCameraQuery: RoutePaths.queryTrue},
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
    final state = context.watch<ReviewDetailCubit>().state;
    final detail = state.detail;
    final done = state.done;
    if (detail != null && done != null && done != ReviewAction.takeOver) {
      return ReviewResultView(detail: detail, action: done);
    }
    final missed = detail?.item.kind == ReviewKind.missed;
    return AppScaffold(
      header: PageHeader(
        title: missed
            ? context.l10n.reviewMissedTitle
            : context.l10n.reviewTitle,
      ),
      body: switch (state.load) {
        LoadStatus.loading => const Center(child: AppLoader()),
        LoadStatus.failure => AppMessageView(
          message:
              state.failure?.message(context.l10n) ?? context.l10n.errorUnknown,
          onRetry: context.read<ReviewDetailCubit>().reload,
        ),
        LoadStatus.success when detail != null =>
          missed
              ? MissedTaskBody(detail: detail)
              : ReviewEntryBody(detail: detail),
        LoadStatus.success => const SizedBox.shrink(),
      },
      footer: detail == null ? null : ReviewActions(detail: detail),
    );
  }
}
