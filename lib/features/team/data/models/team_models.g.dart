// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_JobRoleModel _$JobRoleModelFromJson(Map<String, dynamic> json) =>
    _JobRoleModel(
      id: const IdConverter().fromJson(json['id'] as Object),
      name: json['name'] as String,
    );

Map<String, dynamic> _$JobRoleModelToJson(_JobRoleModel instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'name': instance.name,
    };

_TaskTemplateModel _$TaskTemplateModelFromJson(Map<String, dynamic> json) =>
    _TaskTemplateModel(
      id: const IdConverter().fromJson(json['id'] as Object),
      number: (json['number'] as num).toInt(),
      title: json['title'] as String,
      roleIds:
          (json['role_ids'] as List<dynamic>?)
              ?.map((e) => const IdConverter().fromJson(e as Object))
              .toList() ??
          const <String>[],
    );

Map<String, dynamic> _$TaskTemplateModelToJson(_TaskTemplateModel instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'number': instance.number,
      'title': instance.title,
      'role_ids': instance.roleIds.map(const IdConverter().toJson).toList(),
    };

_RoleCatalogModel _$RoleCatalogModelFromJson(Map<String, dynamic> json) =>
    _RoleCatalogModel(
      roles: (json['roles'] as List<dynamic>)
          .map((e) => JobRoleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskTemplateModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoleCatalogModelToJson(_RoleCatalogModel instance) =>
    <String, dynamic>{
      'roles': instance.roles.map((e) => e.toJson()).toList(),
      'tasks': instance.tasks.map((e) => e.toJson()).toList(),
    };

_TeamMemberModel _$TeamMemberModelFromJson(Map<String, dynamic> json) =>
    _TeamMemberModel(
      id: const IdConverter().fromJson(json['id'] as Object),
      name: json['name'] as String,
      status: json['status'] as String,
      phone: json['phone'] as String? ?? '',
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      since: json['since'] == null
          ? null
          : DateTime.parse(json['since'] as String),
    );

Map<String, dynamic> _$TeamMemberModelToJson(_TeamMemberModel instance) =>
    <String, dynamic>{
      'id': const IdConverter().toJson(instance.id),
      'name': instance.name,
      'status': instance.status,
      'phone': instance.phone,
      'roles': instance.roles,
      'since': instance.since?.toIso8601String(),
    };
