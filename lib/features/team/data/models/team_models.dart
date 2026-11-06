import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/core/network/json_converters.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';

part 'team_models.freezed.dart';
part 'team_models.g.dart';

@freezed
abstract class JobRoleModel with _$JobRoleModel {
  const factory({@IdConverter() required String id, required String name}) =
      _JobRoleModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) => _$JobRoleModelFromJson(json);

  JobRole toEntity() => JobRole(id: id, name: name);
}

@freezed
abstract class TaskTemplateModel with _$TaskTemplateModel {
  const factory({
    @IdConverter() required String id,
    required int number,
    required String title,
    @IdConverter() @Default(<String>[]) List<String> roleIds,
  }) = _TaskTemplateModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$TaskTemplateModelFromJson(json);

  TaskTemplate toEntity() =>
      TaskTemplate(id: id, number: number, title: title, roleIds: roleIds);
}

@freezed
abstract class RoleCatalogModel with _$RoleCatalogModel {
  const factory({
    required List<JobRoleModel> roles,
    required List<TaskTemplateModel> tasks,
  }) = _RoleCatalogModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$RoleCatalogModelFromJson(json);

  RoleCatalog toEntity() => RoleCatalog(
    roles: [for (final r in roles) r.toEntity()],
    tasks: [for (final t in tasks) t.toEntity()],
  );
}

@freezed
abstract class TeamMemberModel with _$TeamMemberModel {
  const factory({
    @IdConverter() required String id,
    required String name,
    required String status,
    @Default('') String phone,
    @Default(<String>[]) List<String> roles,
    DateTime? since,
  }) = _TeamMemberModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$TeamMemberModelFromJson(json);

  /// The server lists role names only; [catalog] gives them their ids so
  /// the role picker can show them as selected.
  TeamMember toEntity({List<JobRole> catalog = const []}) => TeamMember(
    id: id,
    name: name,
    roles: [
      for (final name in roles)
        catalog.where((r) => r.name == name).firstOrNull ??
            JobRole(id: name, name: name),
    ],
    status: MemberStatus.values.asNameMap()[status] ?? MemberStatus.active,
    phone: phone,
    since: since,
  );
}
