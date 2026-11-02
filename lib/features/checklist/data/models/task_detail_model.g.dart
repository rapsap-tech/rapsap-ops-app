// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TaskDetailModel _$TaskDetailModelFromJson(Map<String, dynamic> json) =>
    _TaskDetailModel(
      task: ChecklistTaskModel.fromJson(json['task'] as Map<String, dynamic>),
      section: json['section'] as String,
      assignedTo: json['assigned_to'] as String,
      photoHint: json['photo_hint'] as String,
      managerName: json['manager_name'] as String,
      checklistGroup: json['checklist_group'] as String,
      checklistGroupId: json['checklist_group_id'] as String,
      sendBack: json['send_back'] == null
          ? null
          : SendBackNoteModel.fromJson(
              json['send_back'] as Map<String, dynamic>,
            ),
      photoUrl: json['photo_url'] as String?,
      remarks: json['remarks'] as String?,
      lockedAt: json['locked_at'] == null
          ? null
          : DateTime.parse(json['locked_at'] as String),
    );

Map<String, dynamic> _$TaskDetailModelToJson(_TaskDetailModel instance) =>
    <String, dynamic>{
      'task': instance.task.toJson(),
      'section': instance.section,
      'assigned_to': instance.assignedTo,
      'photo_hint': instance.photoHint,
      'manager_name': instance.managerName,
      'checklist_group': instance.checklistGroup,
      'checklist_group_id': instance.checklistGroupId,
      'send_back': instance.sendBack?.toJson(),
      'photo_url': instance.photoUrl,
      'remarks': instance.remarks,
      'locked_at': instance.lockedAt?.toIso8601String(),
    };

_SendBackNoteModel _$SendBackNoteModelFromJson(Map<String, dynamic> json) =>
    _SendBackNoteModel(
      by: json['by'] as String,
      at: DateTime.parse(json['at'] as String),
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$SendBackNoteModelToJson(_SendBackNoteModel instance) =>
    <String, dynamic>{
      'by': instance.by,
      'at': instance.at.toIso8601String(),
      'reason': instance.reason,
    };
