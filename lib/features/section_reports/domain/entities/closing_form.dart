import 'package:equatable/equatable.dart';

class StaffOption extends Equatable {
  const new({required this.id, required this.name});

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

/// C16 data: who can be picked as having closed the store.
class ClosingForm extends Equatable {
  const new({
    required this.taskId,
    required this.walkthroughTaskId,
    required this.dueAt,
    required this.earlyBefore,
    required this.staff,
  });

  final String taskId;

  /// #46 store walkthrough video, done in the same closing window.
  final String walkthroughTaskId;
  final DateTime dueAt;

  /// Closing before this time is flagged to Admin (CK-32).
  final DateTime earlyBefore;
  final List<StaffOption> staff;

  @override
  List<Object?> get props => [
    taskId,
    walkthroughTaskId,
    dueAt,
    earlyBefore,
    staff,
  ];
}
