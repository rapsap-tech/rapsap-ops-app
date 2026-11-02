import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_queue_cubit.dart';

/// "#5 Fresh produce display… · Imran Shaikh · FNV · Today 8:24 am".
class ReviewTile extends StatelessWidget {
  const new({required this.item, super.key});

  final ReviewItem item;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final who = l10n.chatSenderWithRole(item.staffName, item.staffRole);
    final reason = item.reason;
    return InkWell(
      borderRadius: BorderRadius.circular(Dimens.radius14),
      onTap: () => _open(context),
      child: AppCard(
        radius: Dimens.radius14,
        padding: Dimens.tilePadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.taskTitle(item.number, item.title),
              style: AppTextStyles.base.s14.w600,
            ),
            4.hSpace,
            Text(
              reason == null
                  ? who
                  : l10n.reviewNotDoneLine(item.staffName, reason),
              style: AppTextStyles.base.s12.secondaryTextColor(),
            ),
            2.hSpace,
            Text(
              l10n.reviewToday(item.at.storeClock(locale)),
              style: AppTextStyles.base.s11.secondaryTextColor(),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _open(BuildContext context) async {
    final queue = context.read<ReviewQueueCubit>();
    await context.pushNamed(
      RouteNames.review,
      pathParameters: {RoutePaths.taskIdParam: item.taskId},
    );
    if (!queue.isClosed) unawaited(queue.load());
  }
}
