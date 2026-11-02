import 'package:equatable/equatable.dart';

enum ReviewKind { needsReview, missed, notDone, openNow }

/// One row in the SM's review queue (C2).
class ReviewItem extends Equatable {
  const new({
    required this.taskId,
    required this.number,
    required this.title,
    required this.section,
    required this.staffName,
    required this.staffRole,
    required this.kind,
    required this.at,
    this.reason,
  });

  final String taskId;
  final int number;
  final String title;
  final String section;
  final String staffName;
  final String staffRole;
  final ReviewKind kind;

  /// Submitted time, or due time for missed / open tasks.
  final DateTime at;

  /// Staff's reason for "not done".
  final String? reason;

  @override
  List<Object?> get props => [
    taskId,
    number,
    title,
    section,
    staffName,
    staffRole,
    kind,
    at,
    reason,
  ];
}
