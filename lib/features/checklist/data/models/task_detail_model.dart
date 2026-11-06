import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/today_checklist_model.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';

part 'task_detail_model.freezed.dart';
part 'task_detail_model.g.dart';

@freezed
abstract class TaskDetailModel with _$TaskDetailModel {
  const factory({
    required ChecklistTaskModel task,
    required String section,
    @Default('') String assignedTo,
    @Default('') String photoHint,
    @Default('') String managerName,
    @Default('') String checklistGroup,
    SendBackNoteModel? sendBack,
    String? photoUrl,
    String? videoUrl,
    String? remarks,
    DateTime? lockedAt,
  }) = _TaskDetailModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$TaskDetailModelFromJson(json);

  TaskDetail toEntity() {
    final now = DateTime.now();
    // The server returns a submitted clip in `photo_url`.
    final photoIsVideo =
        photoUrl != null && AppConstants.videoUrlPattern.hasMatch(photoUrl!);
    return TaskDetail(
      task: task.toEntity(section, DateTime(now.year, now.month, now.day)),
      assignedTo: assignedTo,
      photoHint: photoHint,
      managerName: managerName,
      checklistGroup: checklistGroup,
      sendBack: sendBack?.toEntity(),
      photoUrl: photoIsVideo ? null : photoUrl,
      videoUrl: videoUrl ?? (photoIsVideo ? photoUrl : null),
      remarks: remarks,
      lockedAt: lockedAt,
    );
  }
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
