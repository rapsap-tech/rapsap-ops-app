import 'package:equatable/equatable.dart';

/// Which submit endpoint a saved proof goes to.
enum UploadKind { taskProof }

enum UploadStatus { waiting, uploading, failed }

/// Why the server refused a saved proof. Refused proofs are never re-sent
/// automatically.
enum UploadRejection { remarksBlocked, notAccepted }

/// Proof saved on the device until the server confirms it. [id] is sent as
/// the `client_id`, so a repeat send can't create a second submission.
class PendingUpload extends Equatable {
  const new({
    required this.id,
    required this.kind,
    required this.targetId,
    required this.taskNumber,
    required this.taskTitle,
    required this.isVideo,
    required this.captureToken,
    required this.remarks,
    required this.savedAt,
    this.videoName,
    this.status = UploadStatus.waiting,
    this.rejection,
  });

  final String id;
  final UploadKind kind;

  /// The task the proof belongs to.
  final String targetId;

  /// Shown in the pending list, e.g. "#22 Chiller temperature".
  final int taskNumber;
  final String taskTitle;
  final bool isVideo;
  final String? videoName;
  final String captureToken;
  final String remarks;
  final DateTime savedAt;
  final UploadStatus status;
  final UploadRejection? rejection;

  PendingUpload withRemarks(String remarks) => PendingUpload(
    id: id,
    kind: kind,
    targetId: targetId,
    taskNumber: taskNumber,
    taskTitle: taskTitle,
    isVideo: isVideo,
    videoName: videoName,
    captureToken: captureToken,
    remarks: remarks,
    savedAt: savedAt,
    status: status,
    rejection: rejection,
  );

  @override
  List<Object?> get props => [
    id,
    kind,
    targetId,
    taskNumber,
    taskTitle,
    isVideo,
    videoName,
    captureToken,
    remarks,
    savedAt,
    status,
    rejection,
  ];
}
