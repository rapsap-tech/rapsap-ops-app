// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotificationModel _$AppNotificationModelFromJson(
  Map<String, dynamic> json,
) => _AppNotificationModel(
  id: json['id'] as String,
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  read: json['read'] as bool? ?? false,
  targetType: json['target_type'] as String?,
  targetId: json['target_id'] as String?,
);

Map<String, dynamic> _$AppNotificationModelToJson(
  _AppNotificationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'created_at': instance.createdAt.toIso8601String(),
  'read': instance.read,
  'target_type': instance.targetType,
  'target_id': instance.targetId,
};
