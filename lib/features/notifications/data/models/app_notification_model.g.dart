// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AppNotificationModel _$AppNotificationModelFromJson(
  Map<String, dynamic> json,
) => _AppNotificationModel(
  id: const IdConverter().fromJson(json['id'] as Object),
  title: json['title'] as String,
  createdAt: DateTime.parse(json['created_at'] as String),
  subtitle: json['subtitle'] as String? ?? '',
  read: json['read'] as bool? ?? false,
  targetType: json['target_type'] as String?,
  targetId: _$JsonConverterFromJson<Object, String>(
    json['target_id'],
    const IdConverter().fromJson,
  ),
);

Map<String, dynamic> _$AppNotificationModelToJson(
  _AppNotificationModel instance,
) => <String, dynamic>{
  'id': const IdConverter().toJson(instance.id),
  'title': instance.title,
  'created_at': instance.createdAt.toIso8601String(),
  'subtitle': instance.subtitle,
  'read': instance.read,
  'target_type': instance.targetType,
  'target_id': _$JsonConverterToJson<Object, String>(
    instance.targetId,
    const IdConverter().toJson,
  ),
};

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) => json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) => value == null ? null : toJson(value);
