// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_checklist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodayChecklistModel _$TodayChecklistModelFromJson(Map<String, dynamic> json) =>
    _TodayChecklistModel(
      date: DateTime.parse(json['date'] as String),
      sections: (json['sections'] as List<dynamic>)
          .map((e) => ChecklistSectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      shift: json['shift'] as String?,
    );

Map<String, dynamic> _$TodayChecklistModelToJson(
  _TodayChecklistModel instance,
) => <String, dynamic>{
  'date': instance.date.toIso8601String(),
  'sections': instance.sections.map((e) => e.toJson()).toList(),
  'shift': instance.shift,
};

_ChecklistSectionModel _$ChecklistSectionModelFromJson(
  Map<String, dynamic> json,
) => _ChecklistSectionModel(
  name: json['name'] as String,
  tasks: (json['tasks'] as List<dynamic>)
      .map((e) => ChecklistTaskModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  opensAt: json['opens_at'] == null
      ? null
      : DateTime.parse(json['opens_at'] as String),
  closesAt: json['closes_at'] == null
      ? null
      : DateTime.parse(json['closes_at'] as String),
);

Map<String, dynamic> _$ChecklistSectionModelToJson(
  _ChecklistSectionModel instance,
) => <String, dynamic>{
  'name': instance.name,
  'tasks': instance.tasks.map((e) => e.toJson()).toList(),
  'opens_at': instance.opensAt?.toIso8601String(),
  'closes_at': instance.closesAt?.toIso8601String(),
};

_ChecklistTaskModel _$ChecklistTaskModelFromJson(Map<String, dynamic> json) =>
    _ChecklistTaskModel(
      id: const IdConverter().fromJson(json['id'] as Object),
      number: (json['number'] as num).toInt(),
      title: json['title'] as String,
      status: json['status'] as String,
      opensAt: json['opens_at'] == null
          ? null
          : DateTime.parse(json['opens_at'] as String),
      dueAt: json['due_at'] == null
          ? null
          : DateTime.parse(json['due_at'] as String),
      actorName: json['actor_name'] as String?,
      actedAt: json['acted_at'] == null
          ? null
          : DateTime.parse(json['acted_at'] as String),
    );

Map<String, dynamic> _$ChecklistTaskModelToJson(_ChecklistTaskModel instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'number': instance.number,
      'title': instance.title,
      'status': instance.status,
      'opens_at': instance.opensAt?.toIso8601String(),
      'due_at': instance.dueAt?.toIso8601String(),
      'actor_name': instance.actorName,
      'acted_at': instance.actedAt?.toIso8601String(),
    };
