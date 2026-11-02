// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'capture_session_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CaptureSessionModel _$CaptureSessionModelFromJson(Map<String, dynamic> json) =>
    _CaptureSessionModel(
      token: json['token'] as String,
      serverTime: DateTime.parse(json['server_time'] as String),
      storeCode: json['store_code'] as String,
      storeName: json['store_name'] as String,
      staffName: json['staff_name'] as String,
      taskNumber: (json['task_number'] as num).toInt(),
    );

Map<String, dynamic> _$CaptureSessionModelToJson(
  _CaptureSessionModel instance,
) => <String, dynamic>{
  'token': instance.token,
  'server_time': instance.serverTime.toIso8601String(),
  'store_code': instance.storeCode,
  'store_name': instance.storeName,
  'staff_name': instance.staffName,
  'task_number': instance.taskNumber,
};
