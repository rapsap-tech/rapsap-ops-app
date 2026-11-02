import 'package:equatable/equatable.dart';

/// Status as stored by the server.
enum TaskStatus { pending, submitted, verified, sentBack, missed, notDone }

/// What the staff member sees right now (pending splits by time).
enum TaskPhase { later, open, submitted, verified, sentBack, missed, notDone }

class ChecklistTask extends Equatable {
  const new({
    required this.id,
    required this.number,
    required this.title,
    required this.section,
    required this.opensAt,
    required this.dueAt,
    required this.status,
    this.actorName,
    this.actedAt,
  });

  final String id;
  final int number;
  final String title;
  final String section;
  final DateTime opensAt;
  final DateTime dueAt;
  final TaskStatus status;

  /// Who verified / sent back the task.
  final String? actorName;

  /// When it was submitted or acted on.
  final DateTime? actedAt;

  TaskPhase phaseAt(DateTime now) => switch (status) {
    TaskStatus.pending =>
      now.isBefore(opensAt) ? TaskPhase.later : TaskPhase.open,
    TaskStatus.submitted => TaskPhase.submitted,
    TaskStatus.verified => TaskPhase.verified,
    TaskStatus.sentBack => TaskPhase.sentBack,
    TaskStatus.missed => TaskPhase.missed,
    TaskStatus.notDone => TaskPhase.notDone,
  };

  bool get isDone =>
      status == TaskStatus.submitted || status == TaskStatus.verified;
  bool get isMissed =>
      status == TaskStatus.missed || status == TaskStatus.notDone;

  @override
  List<Object?> get props => [
    id,
    number,
    title,
    section,
    opensAt,
    dueAt,
    status,
    actorName,
    actedAt,
  ];
}
