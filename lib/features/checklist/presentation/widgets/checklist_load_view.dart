import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/today_checklist_cubit.dart';

/// Loading / error / empty handling shared by the Home and Checklist tabs;
/// [builder] runs only when there is data to show.
class ChecklistLoadView extends StatelessWidget {
  const new({required this.builder, super.key});

  final Widget Function(BuildContext context, TodayChecklist checklist) builder;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodayChecklistCubit, TodayChecklistState>(
      buildWhen: (prev, next) =>
          prev.status != next.status || prev.checklist != next.checklist,
      builder: (context, state) {
        final checklist = state.checklist;
        if (checklist != null) {
          return checklist.total == 0
              ? AppMessageView(message: context.l10n.checklistNoTasksToday)
              : builder(context, checklist);
        }
        if (state.status == LoadStatus.loading) {
          return const Center(child: AppLoader());
        }
        return AppMessageView(
          message:
              state.failure?.message(context.l10n) ?? context.l10n.errorUnknown,
          onRetry: context.read<TodayChecklistCubit>().load,
        );
      },
    );
  }
}
