import 'package:equatable/equatable.dart';

enum ReportStatus { notReady, ready, submitted, approved, returned }

/// HO's reason for returning a report (X10).
class ReturnNote extends Equatable {
  const new({
    required this.taskId,
    required this.taskNumber,
    required this.taskTitle,
    required this.comment,
    required this.at,
  });

  final String taskId;
  final int taskNumber;
  final String taskTitle;
  final String comment;
  final DateTime at;

  @override
  List<Object?> get props => [taskId, taskNumber, taskTitle, comment, at];
}

/// One section's report for the day (SM-30).
class SectionReport extends Equatable {
  const new({
    required this.id,
    required this.section,
    required this.status,
    required this.opensAt,
    required this.closesAt,
    required this.done,
    required this.total,
    this.notDone = 0,
    this.photos = 0,
    this.toVerify = 0,
    this.revision = 1,
    this.includesDailySummary = false,
    this.statusAt,
    this.returnNote,
  });

  final String id;
  final String section;
  final ReportStatus status;
  final DateTime opensAt;
  final DateTime closesAt;
  final int done;
  final int total;
  final int notDone;
  final int photos;
  final int toVerify;
  final int revision;

  /// Closing report: needs the daily summary (SM-31).
  final bool includesDailySummary;

  /// When it was submitted / approved / returned.
  final DateTime? statusAt;
  final ReturnNote? returnNote;

  @override
  List<Object?> get props => [
    id,
    section,
    status,
    opensAt,
    closesAt,
    done,
    total,
    notDone,
    photos,
    toVerify,
    revision,
    includesDailySummary,
    statusAt,
    returnNote,
  ];
}
