import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/segmented_tabs.dart';
import 'package:rapsap_ops_app/features/notifications/presentation/bloc/notifications_cubit.dart';

/// Title, unread count, "Mark all read" and the All / Unread tabs.
class NotificationsHeader extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<NotificationsCubit>().state;
    final cubit = context.read<NotificationsCubit>();
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(
            Dimens.paddingMedium,
            Dimens.space12,
            Dimens.paddingMedium,
            Dimens.space12,
          ),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.notificationsTitle,
                      style: AppTextStyles.base.s24.w700.l1,
                    ),
                    Text(
                      l10n.notificationsUnread(state.unread),
                      style: AppTextStyles.base.s13.secondaryTextColor(),
                    ),
                  ],
                ),
              ),
              AppButton(
                label: l10n.notificationsMarkAllRead,
                variant: AppButtonVariant.outline,
                expand: false,
                isLoading: state.markingAll,
                onPressed: state.unread == 0 ? null : cubit.markAllRead,
              ),
            ],
          ),
        ),
        SegmentedTabs(
          labels: [
            l10n.filterAllPlain,
            l10n.notificationsUnreadTab(state.unread),
          ],
          selected: state.unreadOnly ? 1 : 0,
          onSelected: (i) => cubit.showUnreadOnly(value: i == 1),
        ),
        Divider(height: Dimens.borderWidth, color: AppColors.divider),
      ],
    );
  }
}
