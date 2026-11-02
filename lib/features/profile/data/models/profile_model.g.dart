// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) =>
    _ProfileModel(
      name: json['name'] as String,
      employeeId: json['employee_id'] as String,
      phone: json['phone'] as String,
      storeName: json['store_name'] as String,
      reportsTo: json['reports_to'] as String,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      onTimePercent: (json['on_time_percent'] as num?)?.toInt() ?? 0,
      doneThisMonth: (json['done_this_month'] as num?)?.toInt() ?? 0,
      missedThisMonth: (json['missed_this_month'] as num?)?.toInt() ?? 0,
      emergencyContact: json['emergency_contact'] as String?,
    );

Map<String, dynamic> _$ProfileModelToJson(_ProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'employee_id': instance.employeeId,
      'phone': instance.phone,
      'store_name': instance.storeName,
      'reports_to': instance.reportsTo,
      'tags': instance.tags,
      'on_time_percent': instance.onTimePercent,
      'done_this_month': instance.doneThisMonth,
      'missed_this_month': instance.missedThisMonth,
      'emergency_contact': instance.emergencyContact,
    };
