// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SectionProgressModel _$SectionProgressModelFromJson(
  Map<String, dynamic> json,
) => _SectionProgressModel(
  id: json['id'] as String,
  name: json['name'] as String,
  status: json['status'] as String,
  done: (json['done'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  missed: (json['missed'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SectionProgressModelToJson(
  _SectionProgressModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'status': instance.status,
  'done': instance.done,
  'total': instance.total,
  'missed': instance.missed,
};

_SalesSummaryModel _$SalesSummaryModelFromJson(Map<String, dynamic> json) =>
    _SalesSummaryModel(
      month: DateTime.parse(json['month'] as String),
      salesMtd: json['sales_mtd'] as num,
      target: json['target'] as num,
      dsrDueAt: DateTime.parse(json['dsr_due_at'] as String),
    );

Map<String, dynamic> _$SalesSummaryModelToJson(_SalesSummaryModel instance) =>
    <String, dynamic>{
      'month': instance.month.toIso8601String(),
      'sales_mtd': instance.salesMtd,
      'target': instance.target,
      'dsr_due_at': instance.dsrDueAt.toIso8601String(),
    };

_ManagerDashboardModel _$ManagerDashboardModelFromJson(
  Map<String, dynamic> json,
) => _ManagerDashboardModel(
  date: DateTime.parse(json['date'] as String),
  done: (json['done'] as num).toInt(),
  total: (json['total'] as num).toInt(),
  toReview: (json['to_review'] as num).toInt(),
  missed: (json['missed'] as num).toInt(),
  notDone: (json['not_done'] as num).toInt(),
  sections: (json['sections'] as List<dynamic>)
      .map((e) => SectionProgressModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  sales: json['sales'] == null
      ? null
      : SalesSummaryModel.fromJson(json['sales'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ManagerDashboardModelToJson(
  _ManagerDashboardModel instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'done': instance.done,
  'total': instance.total,
  'to_review': instance.toReview,
  'missed': instance.missed,
  'not_done': instance.notDone,
  'sections': instance.sections.map((e) => e.toJson()).toList(),
  'sales': instance.sales?.toJson(),
};

_ReviewItemModel _$ReviewItemModelFromJson(Map<String, dynamic> json) =>
    _ReviewItemModel(
      taskId: json['task_id'] as String,
      number: (json['number'] as num).toInt(),
      title: json['title'] as String,
      section: json['section'] as String,
      staffName: json['staff_name'] as String,
      staffRole: json['staff_role'] as String,
      kind: json['kind'] as String,
      at: DateTime.parse(json['at'] as String),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$ReviewItemModelToJson(_ReviewItemModel instance) =>
    <String, dynamic>{
      'task_id': instance.taskId,
      'number': instance.number,
      'title': instance.title,
      'section': instance.section,
      'staff_name': instance.staffName,
      'staff_role': instance.staffRole,
      'kind': instance.kind,
      'at': instance.at.toIso8601String(),
      'reason': instance.reason,
    };

_ReviewDetailModel _$ReviewDetailModelFromJson(Map<String, dynamic> json) =>
    _ReviewDetailModel(
      item: ReviewItemModel.fromJson(json['item'] as Map<String, dynamic>),
      photoUrl: json['photo_url'] as String?,
      remarks: json['remarks'] as String?,
      lockedAt: json['locked_at'] == null
          ? null
          : DateTime.parse(json['locked_at'] as String),
      unlockMinutes: (json['unlock_minutes'] as num?)?.toInt() ?? 30,
    );

Map<String, dynamic> _$ReviewDetailModelToJson(_ReviewDetailModel instance) =>
    <String, dynamic>{
      'item': instance.item.toJson(),
      'photo_url': instance.photoUrl,
      'remarks': instance.remarks,
      'locked_at': instance.lockedAt?.toIso8601String(),
      'unlock_minutes': instance.unlockMinutes,
    };
