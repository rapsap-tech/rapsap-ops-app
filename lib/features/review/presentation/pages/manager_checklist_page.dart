import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/load_state_view.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_queue_cubit.dart';
import 'package:rapsap_ops_app/features/review/presentation/widgets/review_filter_chips.dart';
import 'package:rapsap_ops_app/features/review/presentation/widgets/review_tile.dart';

/// C2 · SM checklist: needs review / missed / not done / open now.
class ManagerChecklistPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ReviewFilterCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              Dimens.paddingMedium,
              Dimens.space12,
              Dimens.paddingSmall,
              0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    context.l10n.navChecklist,
                    style: AppTextStyles.base.s24.w700.l1,
                  ),
                ),
                if (EnvConfig.instance.hasSectionReports)
                  TextButton(
                    onPressed: () =>
                        unawaited(context.pushNamed(RouteNames.sectionReports)),
                    child: Text(
                      context.l10n.sectionReportsTitle,
                      style: AppTextStyles.base.s14.w600.primaryDarkColor(),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: LoadStateView<ReviewQueueCubit, List<ReviewItem>>(
              builder: (context, items) => _Queue(items: items),
            ),
          ),
        ],
      ),
    );
  }
}

class _Queue extends StatelessWidget {
  const new({required this.items});

  final List<ReviewItem> items;

  @override
  Widget build(BuildContext context) {
    final filter = context.watch<ReviewFilterCubit>().state;
    final visible = [
      for (final i in items)
        if (i.kind == filter) i,
    ];
    return RefreshIndicator(
      onRefresh: context.read<ReviewQueueCubit>().load,
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: Dimens.pagePadding,
        children: [
          ReviewFilterChips(items: items),
          12.hSpace,
          if (visible.isEmpty)
            AppMessageView(message: context.l10n.reviewNothing)
          else
            for (final item in visible) ...[ReviewTile(item: item), 12.hSpace],
        ],
      ),
    );
  }
}
