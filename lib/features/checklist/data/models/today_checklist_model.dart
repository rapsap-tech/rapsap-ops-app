import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/core/network/json_converters.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';

part 'today_checklist_model.freezed.dart';
part 'today_checklist_model.g.dart';

@freezed
abstract class TodayChecklistModel with _$TodayChecklistModel {
  const factory({
    required DateTime date,
    required List<ChecklistSectionModel> sections,
    String? shift,
  }) = _TodayChecklistModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$TodayChecklistModelFromJson(json);

  /// The server names the section open right now (`trading`, `hygiene`,
  /// ...); anything between opening and closing is the mid shift.
  TodayChecklist toEntity() => TodayChecklist(
    date: date,
    shift: switch (shift) {
      null => null,
      'opening' => Shift.opening,
      'closing' => Shift.closing,
      _ => Shift.mid,
    },
    sections: [for (final s in sections) s.toEntity(date)],
  );
}

@freezed
abstract class ChecklistSectionModel with _$ChecklistSectionModel {
  const factory({
    required String name,
    required List<ChecklistTaskModel> tasks,
    DateTime? opensAt,
    DateTime? closesAt,
  }) = _ChecklistSectionModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$ChecklistSectionModelFromJson(json);

  ChecklistSection toEntity(DateTime day) => ChecklistSection(
    name: name,
    opensAt: opensAt ?? day,
    closesAt: closesAt,
    tasks: [for (final t in tasks) t.toEntity(name, day)],
  );
}

@freezed
abstract class ChecklistTaskModel with _$ChecklistTaskModel {
  const factory({
    @IdConverter() required String id,
    required int number,
    required String title,
    required String status,
    DateTime? opensAt,
    DateTime? dueAt,
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

  /// A task with no time window is open all [day].
  ChecklistTask toEntity(String section, DateTime day) => ChecklistTask(
    id: id,
    number: number,
    title: title,
    section: section,
    opensAt: opensAt ?? day,
    dueAt: dueAt ?? day.add(const Duration(days: 1)),
    status: _statuses[status] ?? TaskStatus.pending,
    actorName: actorName,
    actedAt: actedAt,
  );
}
