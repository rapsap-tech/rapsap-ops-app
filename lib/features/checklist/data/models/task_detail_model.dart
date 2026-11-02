import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/today_checklist_model.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';

part 'task_detail_model.freezed.dart';
part 'task_detail_model.g.dart';

@freezed
abstract class TaskDetailModel with _$TaskDetailModel {
  const factory({
    required ChecklistTaskModel task,
    required String section,
    required String assignedTo,
    required String photoHint,
    required String managerName,
    required String checklistGroup,
    required String checklistGroupId,
    SendBackNoteModel? sendBack,
    String? photoUrl,
    String? remarks,
    DateTime? lockedAt,
  }) = _TaskDetailModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$TaskDetailModelFromJson(json);

  TaskDetail toEntity() => TaskDetail(
    task: task.toEntity(section),
    assignedTo: assignedTo,
    photoHint: photoHint,
    managerName: managerName,
    checklistGroup: checklistGroup,
    checklistGroupId: checklistGroupId,
    sendBack: sendBack?.toEntity(),
    photoUrl: photoUrl,
    remarks: remarks,
    lockedAt: lockedAt,
  );
}

@freezed
abstract class SendBackNoteModel with _$SendBackNoteModel {
  const factory({
    required String by,
    required DateTime at,
    required String reason,
  }) = _SendBackNoteModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$SendBackNoteModelFromJson(json);

  SendBackNote toEntity() => SendBackNote(by: by, at: at, reason: reason);
}
