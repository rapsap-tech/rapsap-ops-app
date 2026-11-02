import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/notifications/domain/entities/app_notification.dart';
import 'package:rapsap_ops_app/features/notifications/domain/usecases/get_notifications.dart';
import 'package:rapsap_ops_app/features/notifications/domain/usecases/mark_all_notifications_read.dart';
import 'package:rapsap_ops_app/features/notifications/domain/usecases/mark_notification_read.dart';

class NotificationsState extends Equatable {
  const new({
    this.status = LoadStatus.loading,
    this.items,
    this.unreadOnly = false,
    this.markingAll = false,
    this.failure,
  });

  final LoadStatus status;
  final List<AppNotification>? items;
  final bool unreadOnly;
  final bool markingAll;
  final Failure? failure;

  int get unread => items?.where((n) => !n.read).length ?? 0;

  List<AppNotification> get visible => [
    for (final n in items ?? const <AppNotification>[])
      if (!unreadOnly || !n.read) n,
  ];

  NotificationsState copyWith({
    LoadStatus? status,
    List<AppNotification>? items,
    bool? unreadOnly,
    bool? markingAll,
    Failure? failure,
  }) => NotificationsState(
    status: status ?? this.status,
    items: items ?? this.items,
    unreadOnly: unreadOnly ?? this.unreadOnly,
    markingAll: markingAll ?? this.markingAll,
    failure: failure,
  );

  @override
  List<Object?> get props => [status, items, unreadOnly, markingAll, failure];
}

/// B9 list plus the unread badge on the Alerts tab.
@injectable
class NotificationsCubit extends Cubit<NotificationsState> {
  new(this._get, this._markOne, this._markAll)
    : super(const NotificationsState());

  final GetNotifications _get;
  final MarkNotificationRead _markOne;
  final MarkAllNotificationsRead _markAll;

  Future<void> load() async {
    final result = await _get();
    if (isClosed) return;
    emit(
      result.match(
        (failure) =>
            state.copyWith(status: LoadStatus.failure, failure: failure),
        (items) => state.copyWith(status: LoadStatus.success, items: items),
      ),
    );
  }

  void showUnreadOnly({required bool value}) =>
      emit(state.copyWith(unreadOnly: value));

  Future<void> markAllRead() async {
    if (state.markingAll || state.unread == 0) return;
    emit(state.copyWith(markingAll: true));
    final result = await _markAll();
    if (isClosed) return;
    result.match(
      (failure) => emit(state.copyWith(markingAll: false, failure: failure)),
      (_) => emit(
        state.copyWith(
          markingAll: false,
          items: [
            for (final n in state.items ?? <AppNotification>[]) n.markRead(),
          ],
        ),
      ),
    );
  }

  /// Marks read locally at once; the server call is best-effort.
  void opened(AppNotification notification) {
    if (notification.read) return;
    emit(
      state.copyWith(
        items: [
          for (final n in state.items ?? <AppNotification>[])
            if (n.id == notification.id) n.markRead() else n,
        ],
      ),
    );
    unawaited(_markOne(notification.id));
  }

  void onConnectionRestored() {
    if (state.failure is NoInternetFailure) unawaited(load());
  }
}
