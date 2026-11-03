import 'package:equatable/equatable.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';

/// SM's reason for sending a task back (B7).
class SendBackNote extends Equatable {
  const new({required this.by, required this.at, required this.reason});

  final String by;
  final DateTime at;
  final String reason;

  @override
  List<Object?> get props => [by, at, reason];
}

class TaskDetail extends Equatable {
  const new({
    required this.task,
    required this.assignedTo,
    required this.photoHint,
    required this.managerName,
    required this.checklistGroup,
    required this.checklistGroupId,
    this.sendBack,
    this.photoUrl,
    this.videoUrl,
    this.remarks,
    this.lockedAt,
  });

  final ChecklistTask task;
  final String assignedTo;
  final String photoHint;
  final String managerName;

  /// Store chat group the proof photo is auto-posted to (CKG-02).
  final String checklistGroup;
  final String checklistGroupId;
  final SendBackNote? sendBack;

  /// Last submitted proof photo or video, if any.
  final String? photoUrl;
  final String? videoUrl;
  final String? remarks;
  final DateTime? lockedAt;

  @override
  List<Object?> get props => [
    task,
    assignedTo,
    photoHint,
    managerName,
    checklistGroup,
    checklistGroupId,
    sendBack,
    photoUrl,
    videoUrl,
    remarks,
    lockedAt,
  ];
}
