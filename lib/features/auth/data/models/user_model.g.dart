// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  id: const IdConverter().fromJson(json['id'] as Object),
  role: json['role'] as String,
  name: json['name'] as String? ?? '',
  storeName: json['store_name'] as String? ?? '',
  jobRoles:
      (json['job_roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  consentAccepted: json['consent_accepted'] as bool? ?? false,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'role': instance.role,
      'name': instance.name,
      'store_name': instance.storeName,
      'job_roles': instance.jobRoles,
      'consent_accepted': instance.consentAccepted,
    };
