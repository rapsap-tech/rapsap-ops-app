import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/notifications/domain/entities/app_notification.dart';

part 'app_notification_model.freezed.dart';
part 'app_notification_model.g.dart';

@freezed
abstract class AppNotificationModel with _$AppNotificationModel {
  const factory({
    required String id,
    required String title,
    required String subtitle,
    required DateTime createdAt,
    @Default(false) bool read,
    String? targetType,
    String? targetId,
  }) = _AppNotificationModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$AppNotificationModelFromJson(json);

  AppNotification toEntity() => AppNotification(
    id: id,
    title: title,
    subtitle: subtitle,
    createdAt: createdAt,
    read: read,
    targetType: switch (targetType) {
      'task' => NotificationTargetType.task,
      'conversation' => NotificationTargetType.conversation,
      _ => NotificationTargetType.none,
    },
    targetId: targetId,
  );
}
