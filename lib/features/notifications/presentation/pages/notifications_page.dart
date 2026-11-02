import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/features/notifications/presentation/bloc/notifications_cubit.dart';
import 'package:rapsap_ops_app/features/notifications/presentation/widgets/notification_tile.dart';
import 'package:rapsap_ops_app/features/notifications/presentation/widgets/notifications_header.dart';

/// B9 · Notifications (Alerts tab). The cubit lives in the staff shell.
class NotificationsPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectivityCubit, ConnectivityStatus>(
      listenWhen: (_, next) => next == ConnectivityStatus.online,
      listener: (context, _) =>
          context.read<NotificationsCubit>().onConnectionRestored(),
      child: const Column(
        children: [
          NotificationsHeader(),
          Expanded(child: _List()),
        ],
      ),
    );
  }
}

class _List extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<NotificationsCubit>().state;
    final cubit = context.read<NotificationsCubit>();
    if (state.items == null) {
      return state.status == LoadStatus.loading
          ? const Center(child: AppLoader())
          : AppMessageView(
              message:
                  state.failure?.message(context.l10n) ??
                  context.l10n.errorUnknown,
              onRetry: cubit.load,
            );
    }
    final items = state.visible;
    if (items.isEmpty) {
      return AppMessageView(message: context.l10n.notificationsEmpty);
    }
    return RefreshIndicator(
      onRefresh: cubit.load,
      child: ListView.separated(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: Dimens.pagePadding,
        itemCount: items.length,
        separatorBuilder: (_, _) => 12.hSpace,
        itemBuilder: (_, i) => NotificationTile(notification: items[i]),
      ),
    );
  }
}
