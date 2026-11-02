import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';

part 'today_checklist_model.freezed.dart';
part 'today_checklist_model.g.dart';

@freezed
abstract class TodayChecklistModel with _$TodayChecklistModel {
  const factory({
    required DateTime date,
    required String shift,
    required List<ChecklistSectionModel> sections,
  }) = _TodayChecklistModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$TodayChecklistModelFromJson(json);

  TodayChecklist toEntity() => TodayChecklist(
    date: date,
    shift: Shift.values.asNameMap()[shift] ?? Shift.opening,
    sections: [for (final s in sections) s.toEntity()],
  );
}

@freezed
abstract class ChecklistSectionModel with _$ChecklistSectionModel {
  const factory({
    required String name,
    required DateTime opensAt,
    required List<ChecklistTaskModel> tasks,
    DateTime? closesAt,
  }) = _ChecklistSectionModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ChecklistSectionModelFromJson(json);

  ChecklistSection toEntity() => ChecklistSection(
    name: name,
    opensAt: opensAt,
    closesAt: closesAt,
    tasks: [for (final t in tasks) t.toEntity(name)],
  );
}

@freezed
abstract class ChecklistTaskModel with _$ChecklistTaskModel {
  const factory({
    required String id,
    required int number,
    required String title,
    required DateTime opensAt,
    required DateTime dueAt,
    required String status,
    String? actorName,
    DateTime? actedAt,
  }) = _ChecklistTaskModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ChecklistTaskModelFromJson(json);

  static const Map<String, TaskStatus> _statuses = {
    'pending': TaskStatus.pending,
    'submitted': TaskStatus.submitted,
    'verified': TaskStatus.verified,
    'sent_back': TaskStatus.sentBack,
    'missed': TaskStatus.missed,
    'not_done': TaskStatus.notDone,
  };

  ChecklistTask toEntity(String section) => ChecklistTask(
    id: id,
    number: number,
    title: title,
    section: section,
    opensAt: opensAt,
    dueAt: dueAt,
    status: _statuses[status] ?? TaskStatus.pending,
    actorName: actorName,
    actedAt: actedAt,
  );
}
