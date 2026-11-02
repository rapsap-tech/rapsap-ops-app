import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/filter_chip_button.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/today_checklist_cubit.dart';

class ChecklistFilterChips extends StatelessWidget {
  const new({required this.checklist, required this.now, super.key});

  final TodayChecklist checklist;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selected = context.select<TodayChecklistCubit, ChecklistFilter>(
      (c) => c.state.filter,
    );
    String label(ChecklistFilter f) {
      final n = checklist.count(f, now);
      return switch (f) {
        ChecklistFilter.all => l10n.filterAll(n),
        ChecklistFilter.open => l10n.filterOpen(n),
        ChecklistFilter.done => l10n.filterDone(n),
        ChecklistFilter.missed => l10n.filterMissed(n),
      };
    }

    return Wrap(
      spacing: Dimens.paddingSmall,
      runSpacing: Dimens.paddingSmall,
      children: [
        for (final filter in ChecklistFilter.values)
          FilterChipButton(
            label: label(filter),
            selected: filter == selected,
            onTap: () => context.read<TodayChecklistCubit>().setFilter(filter),
          ),
      ],
    );
  }
}
