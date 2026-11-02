import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_card.dart';
import 'package:rapsap_ops_app/features/notifications/domain/entities/app_notification.dart';
import 'package:rapsap_ops_app/features/notifications/presentation/bloc/notifications_cubit.dart';

/// Tapping opens the related task or chat (NOT spec).
class NotificationTile extends StatelessWidget {
  const new({required this.notification, super.key});

  final AppNotification notification;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final unread = !notification.read;
    return InkWell(
      borderRadius: BorderRadius.circular(Dimens.radius14),
      onTap: () => _open(context),
      child: AppCard(
        radius: Dimens.radius14,
        color: unread ? AppColors.primaryLight : AppColors.surface,
        padding: Dimens.tilePadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notification.title,
                    style: unread
                        ? AppTextStyles.base.s14.w700
                        : AppTextStyles.base.s14.w500,
                  ),
                  4.hSpace,
                  Text(
                    context.l10n.notificationMeta(
                      notification.subtitle,
                      notification.createdAt.storeClock(locale),
                    ),
                    style: AppTextStyles.base.s11.secondaryTextColor(),
                  ),
                ],
              ),
            ),
            if (unread)
              Padding(
                padding: EdgeInsets.only(left: Dimens.paddingSmall),
                child: Semantics(
                  label: context.l10n.notificationUnreadDot,
                  child: CircleAvatar(
                    radius: Dimens.unreadDot,
                    backgroundColor: AppColors.primary,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _open(BuildContext context) {
    context.read<NotificationsCubit>().opened(notification);
    final id = notification.targetId;
    if (id == null) return;
    switch (notification.targetType) {
      case NotificationTargetType.task:
        unawaited(
          context.pushNamed(
            RouteNames.task,
            pathParameters: {RoutePaths.taskIdParam: id},
          ),
        );
      case NotificationTargetType.conversation:
        unawaited(
          context.pushNamed(
            RouteNames.conversation,
            pathParameters: {RoutePaths.conversationIdParam: id},
          ),
        );
      case NotificationTargetType.none:
        break;
    }
  }
}
