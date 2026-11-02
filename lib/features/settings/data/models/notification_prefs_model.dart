import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/settings/domain/entities/notification_prefs.dart';

part 'notification_prefs_model.freezed.dart';
part 'notification_prefs_model.g.dart';

@freezed
abstract class NotificationPrefsModel with _$NotificationPrefsModel {
  const factory({
    @Default(true) bool chatMessages,
    @Default(true) bool announcements,
  }) = _NotificationPrefsModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$NotificationPrefsModelFromJson(json);

  factory fromEntity(NotificationPrefs prefs) => NotificationPrefsModel(
    chatMessages: prefs.chatMessages,
    announcements: prefs.announcements,
  );

  NotificationPrefs toEntity() => NotificationPrefs(
    chatMessages: chatMessages,
    announcements: announcements,
  );
}
