import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/checklist_task.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';

final DateTime now = DateTime(2026, 11, 2, 10);

ChecklistTask task(
  String id,
  TaskStatus status, {
  int opens = -30,
  int due = 10,
}) => ChecklistTask(
  id: id,
  number: 1,
  title: id,
  section: 'S',
  opensAt: now.add(Duration(minutes: opens)),
  dueAt: now.add(Duration(minutes: due)),
  status: status,
);

void main() {
  final checklist = TodayChecklist(
    date: now,
    shift: Shift.opening,
    sections: [
      ChecklistSection(
        name: 'S',
        opensAt: now,
        tasks: [
          task('verified', TaskStatus.verified),
          task('submitted', TaskStatus.submitted),
          task('missed', TaskStatus.missed),
          task('openLate', TaskStatus.pending, due: 40),
          task('openSoon', TaskStatus.pending, due: 5),
          task('later', TaskStatus.pending, opens: 60, due: 90),
        ],
      ),
    ],
  );

  test('counts done, missed and left', () {
    expect(checklist.done, 2);
    expect(checklist.missed, 1);
    expect(checklist.left, 3);
  });

  test('pending splits into open and later by opening time', () {
    expect(checklist.count(ChecklistFilter.open, now), 2);
    expect(checklist.upcoming(now).single.id, 'later');
  });

  test('next task is the open one due soonest', () {
    expect(checklist.nextTask(now)?.id, 'openSoon');
  });
}
