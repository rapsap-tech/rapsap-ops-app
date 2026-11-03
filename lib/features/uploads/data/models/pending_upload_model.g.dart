// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pending_upload_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PendingUploadModel _$PendingUploadModelFromJson(Map<String, dynamic> json) =>
    _PendingUploadModel(
      id: json['id'] as String,
      kind: $enumDecode(_$UploadKindEnumMap, json['kind']),
      targetId: json['target_id'] as String,
      taskNumber: (json['task_number'] as num).toInt(),
      taskTitle: json['task_title'] as String,
      isVideo: json['is_video'] as bool,
      captureToken: json['capture_token'] as String,
      remarks: json['remarks'] as String,
      savedAt: DateTime.parse(json['saved_at'] as String),
      videoName: json['video_name'] as String?,
      status:
          $enumDecodeNullable(_$UploadStatusEnumMap, json['status']) ??
          UploadStatus.waiting,
      rejection: $enumDecodeNullable(
        _$UploadRejectionEnumMap,
        json['rejection'],
      ),
    );

Map<String, dynamic> _$PendingUploadModelToJson(_PendingUploadModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'kind': _$UploadKindEnumMap[instance.kind]!,
      'target_id': instance.targetId,
      'task_number': instance.taskNumber,
      'task_title': instance.taskTitle,
      'is_video': instance.isVideo,
      'capture_token': instance.captureToken,
      'remarks': instance.remarks,
      'saved_at': instance.savedAt.toIso8601String(),
      'video_name': instance.videoName,
      'status': _$UploadStatusEnumMap[instance.status]!,
      'rejection': _$UploadRejectionEnumMap[instance.rejection],
    };

const _$UploadKindEnumMap = {UploadKind.taskProof: 'taskProof'};

const _$UploadStatusEnumMap = {
  UploadStatus.waiting: 'waiting',
  UploadStatus.uploading: 'uploading',
  UploadStatus.failed: 'failed',
};

const _$UploadRejectionEnumMap = {
  UploadRejection.remarksBlocked: 'remarksBlocked',
  UploadRejection.notAccepted: 'notAccepted',
};
