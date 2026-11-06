import 'package:equatable/equatable.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';

enum Shift { opening, mid, closing }

enum ChecklistFilter { all, open, done, missed }

class ChecklistSection extends Equatable {
  const new({
    required this.name,
    required this.opensAt,
    required this.tasks,
    this.closesAt,
  });

  final String name;
  final DateTime opensAt;
  final DateTime? closesAt;
  final List<ChecklistTask> tasks;

  @override
  List<Object?> get props => [name, opensAt, closesAt, tasks];
}

class TodayChecklist extends Equatable {
  const new({required this.date, required this.sections, this.shift});

  final DateTime date;

  /// Null when no section is open right now.
  final Shift? shift;
  final List<ChecklistSection> sections;

  List<ChecklistTask> get tasks => [for (final s in sections) ...s.tasks];

  int get total => tasks.length;
  int get done => tasks.where((t) => t.isDone).length;
  int get missed => tasks.where((t) => t.isMissed).length;
  int get left => total - done - missed;

  bool matches(ChecklistTask task, ChecklistFilter filter, DateTime now) =>
      switch (filter) {
        ChecklistFilter.all => true,
        ChecklistFilter.done => task.isDone,
        ChecklistFilter.missed => task.isMissed,
        ChecklistFilter.open => const {
          TaskPhase.open,
          TaskPhase.sentBack,
        }.contains(task.phaseAt(now)),
      };

  int count(ChecklistFilter filter, DateTime now) =>
      tasks.where((t) => matches(t, filter, now)).length;

  /// The open task due soonest: the "Do this now" card on Home.
  ChecklistTask? nextTask(DateTime now) {
    final open =
        tasks.where((t) => matches(t, ChecklistFilter.open, now)).toList()
          ..sort((a, b) => a.dueAt.compareTo(b.dueAt));
    return open.isEmpty ? null : open.first;
  }

  List<ChecklistTask> upcoming(DateTime now) =>
      tasks.where((t) => t.phaseAt(now) == TaskPhase.later).toList()
        ..sort((a, b) => a.opensAt.compareTo(b.opensAt));

  @override
  List<Object?> get props => [date, shift, sections];
}
