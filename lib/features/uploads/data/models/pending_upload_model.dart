import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/uploads/domain/entities/pending_upload.dart';

part 'pending_upload_model.freezed.dart';
part 'pending_upload_model.g.dart';

/// How a [PendingUpload] is stored on the device (media bytes are kept
/// separately).
@freezed
abstract class PendingUploadModel with _$PendingUploadModel {
  const factory({
    required String id,
    required UploadKind kind,
    required String targetId,
    required int taskNumber,
    required String taskTitle,
    required bool isVideo,
    required String captureToken,
    required String remarks,
    required DateTime savedAt,
    String? videoName,
    @Default(UploadStatus.waiting) UploadStatus status,
    UploadRejection? rejection,
  }) = _PendingUploadModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$PendingUploadModelFromJson(json);

  factory fromEntity(PendingUpload upload) => PendingUploadModel(
    id: upload.id,
    kind: upload.kind,
    targetId: upload.targetId,
    taskNumber: upload.taskNumber,
    taskTitle: upload.taskTitle,
    isVideo: upload.isVideo,
    remarks: upload.remarks,
    savedAt: upload.savedAt,
    videoName: upload.videoName,
    captureToken: upload.captureToken,
    status: upload.status,
    rejection: upload.rejection,
  );

  PendingUpload toEntity() => PendingUpload(
    id: id,
    kind: kind,
    targetId: targetId,
    taskNumber: taskNumber,
    taskTitle: taskTitle,
    isVideo: isVideo,
    remarks: remarks,
    savedAt: savedAt,
    videoName: videoName,
    captureToken: captureToken,
    status: status,
    rejection: rejection,
  );
}
