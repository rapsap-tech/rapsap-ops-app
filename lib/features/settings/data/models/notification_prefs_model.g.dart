// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_prefs_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationPrefsModel _$NotificationPrefsModelFromJson(
  Map<String, dynamic> json,
) => _NotificationPrefsModel(
  chatMessages: json['chat_messages'] as bool? ?? true,
  announcements: json['announcements'] as bool? ?? true,
);

Map<String, dynamic> _$NotificationPrefsModelToJson(
  _NotificationPrefsModel instance,
) => <String, dynamic>{
  'chat_messages': instance.chatMessages,
  'announcements': instance.announcements,
};
