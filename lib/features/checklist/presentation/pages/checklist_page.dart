import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/today_checklist_cubit.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/checklist_filter_chips.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/checklist_load_view.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/checklist_sections.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/checklist_summary_card.dart';

/// B2 · Daily checklist.
class ChecklistPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return ChecklistLoadView(
      builder: (context, checklist) => _ChecklistList(checklist: checklist),
    );
  }
}

class _ChecklistList extends StatelessWidget {
  const new({required this.checklist});

  final TodayChecklist checklist;

  @override
  Widget build(BuildContext context) {
    final filter = context.select<TodayChecklistCubit, ChecklistFilter>(
      (c) => c.state.filter,
    );
    final now = DateTime.now();
    final items = checklistSectionItems(
      context: context,
      checklist: checklist,
      filter: filter,
      now: now,
    );
    final children = [
      ChecklistSummaryCard(checklist: checklist),
      ChecklistFilterChips(checklist: checklist, now: now),
      if (items.isEmpty)
        AppMessageView(message: context.l10n.checklistEmpty)
      else
        ...items,
    ];
    return RefreshIndicator(
      onRefresh: context.read<TodayChecklistCubit>().load,
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
