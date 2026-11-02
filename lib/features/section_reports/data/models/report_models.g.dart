// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ReturnNoteModel _$ReturnNoteModelFromJson(Map<String, dynamic> json) =>
    _ReturnNoteModel(
      taskId: json['task_id'] as String,
      taskNumber: (json['task_number'] as num).toInt(),
      taskTitle: json['task_title'] as String,
      comment: json['comment'] as String,
      at: DateTime.parse(json['at'] as String),
    );

Map<String, dynamic> _$ReturnNoteModelToJson(_ReturnNoteModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'task_number': instance.taskNumber,
      'task_title': instance.taskTitle,
      'comment': instance.comment,
      'at': instance.at.toIso8601String(),
    };

_SectionReportModel _$SectionReportModelFromJson(Map<String, dynamic> json) =>
    _SectionReportModel(
      id: json['id'] as String,
      section: json['section'] as String,
      status: json['status'] as String,
      opensAt: DateTime.parse(json['opens_at'] as String),
      closesAt: DateTime.parse(json['closes_at'] as String),
      done: (json['done'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      notDone: (json['not_done'] as num?)?.toInt() ?? 0,
      photos: (json['photos'] as num?)?.toInt() ?? 0,
      toVerify: (json['to_verify'] as num?)?.toInt() ?? 0,
      revision: (json['revision'] as num?)?.toInt() ?? 1,
      includesDailySummary: json['includes_daily_summary'] as bool? ?? false,
      statusAt: json['status_at'] == null
          ? null
          : DateTime.parse(json['status_at'] as String),
      returnNote: json['return_note'] == null
          ? null
          : ReturnNoteModel.fromJson(
              json['return_note'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SectionReportModelToJson(_SectionReportModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'section': instance.section,
      'status': instance.status,
      'opens_at': instance.opensAt.toIso8601String(),
      'closes_at': instance.closesAt.toIso8601String(),
      'done': instance.done,
      'total': instance.total,
      'not_done': instance.notDone,
      'photos': instance.photos,
      'to_verify': instance.toVerify,
      'revision': instance.revision,
      'includes_daily_summary': instance.includesDailySummary,
      'status_at': instance.statusAt?.toIso8601String(),
      'return_note': instance.returnNote?.toJson(),
    };

_DailySummaryFormModel _$DailySummaryFormModelFromJson(
  Map<String, dynamic> json,
) => _DailySummaryFormModel(
  staffTotal: (json['staff_total'] as num).toInt(),
  sales: json['sales'] as num?,
  bills: (json['bills'] as num?)?.toInt(),
);

Map<String, dynamic> _$DailySummaryFormModelToJson(
  _DailySummaryFormModel instance,
) => <String, dynamic>{
  'staff_total': instance.staffTotal,
  'sales': instance.sales,
  'bills': instance.bills,
};

_SnapshotLineModel _$SnapshotLineModelFromJson(Map<String, dynamic> json) =>
    _SnapshotLineModel(
      number: (json['number'] as num).toInt(),
      title: json['title'] as String,
      mark: json['mark'] as String,
      by: json['by'] as String?,
      at: json['at'] == null ? null : DateTime.parse(json['at'] as String),
    );

Map<String, dynamic> _$SnapshotLineModelToJson(_SnapshotLineModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'title': instance.title,
      'mark': instance.mark,
      'by': instance.by,
      'at': instance.at?.toIso8601String(),
    };

_PostTargetModel _$PostTargetModelFromJson(Map<String, dynamic> json) =>
    _PostTargetModel(
      conversationId: json['conversation_id'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$PostTargetModelToJson(_PostTargetModel instance) =>
    <String, dynamic>{
      'conversation_id': instance.conversationId,
      'name': instance.name,
    };

_ReportSnapshotModel _$ReportSnapshotModelFromJson(Map<String, dynamic> json) =>
    _ReportSnapshotModel(
      reportId: json['report_id'] as String,
      title: json['title'] as String,
      storeName: json['store_name'] as String,
      date: DateTime.parse(json['date'] as String),
      opensAt: DateTime.parse(json['opens_at'] as String),
      closesAt: DateTime.parse(json['closes_at'] as String),
      done: (json['done'] as num).toInt(),
      total: (json['total'] as num).toInt(),
      lines: (json['lines'] as List<dynamic>)
          .map((e) => SnapshotLineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      photoUrls:
          (json['photo_urls'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      targets:
          (json['targets'] as List<dynamic>?)
              ?.map((e) => PostTargetModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PostTargetModel>[],
      sentAt: json['sent_at'] == null
          ? null
          : DateTime.parse(json['sent_at'] as String),
    );

Map<String, dynamic> _$ReportSnapshotModelToJson(
  _ReportSnapshotModel instance,
) => <String, dynamic>{
  'report_id': instance.reportId,
  'title': instance.title,
  'store_name': instance.storeName,
  'date': instance.date.toIso8601String(),
  'opens_at': instance.opensAt.toIso8601String(),
  'closes_at': instance.closesAt.toIso8601String(),
  'done': instance.done,
  'total': instance.total,
  'lines': instance.lines.map((e) => e.toJson()).toList(),
  'photo_urls': instance.photoUrls,
  'targets': instance.targets.map((e) => e.toJson()).toList(),
  'sent_at': instance.sentAt?.toIso8601String(),
};

_ClosingFormModel _$ClosingFormModelFromJson(Map<String, dynamic> json) =>
    _ClosingFormModel(
      taskId: json['task_id'] as String,
      walkthroughTaskId: json['walkthrough_task_id'] as String,
      dueAt: DateTime.parse(json['due_at'] as String),
      earlyBefore: DateTime.parse(json['early_before'] as String),
      staff: (json['staff'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e as Map))
          .toList(),
    );

Map<String, dynamic> _$ClosingFormModelToJson(_ClosingFormModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'walkthrough_task_id': instance.walkthroughTaskId,
      'due_at': instance.dueAt.toIso8601String(),
      'early_before': instance.earlyBefore.toIso8601String(),
      'staff': instance.staff,
    };
