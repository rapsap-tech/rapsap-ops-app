import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/filter_chip_button.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_queue_cubit.dart';

class ReviewFilterChips extends StatelessWidget {
  const new({required this.items, super.key});

  final List<ReviewItem> items;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final selected = context.watch<ReviewFilterCubit>().state;
    int count(ReviewKind k) => items.where((i) => i.kind == k).length;
    final labels = {
      ReviewKind.needsReview: l10n.reviewNeedsReview(
        count(ReviewKind.needsReview),
      ),
      ReviewKind.missed: l10n.filterMissed(count(ReviewKind.missed)),
      ReviewKind.notDone: l10n.reviewNotDone(count(ReviewKind.notDone)),
      ReviewKind.openNow: l10n.reviewOpenNow(count(ReviewKind.openNow)),
    };
    return Wrap(
      spacing: Dimens.paddingSmall,
      runSpacing: Dimens.paddingSmall,
      children: [
        for (final entry in labels.entries)
          FilterChipButton(
            label: entry.value,
            selected: entry.key == selected,
            onTap: () => context.read<ReviewFilterCubit>().select(entry.key),
          ),
      ],
    );
  }
}
