import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/fake_checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/today_checklist_model.dart';
import 'package:rapsap_ops_app/features/section_reports/data/datasources/report_remote_data_source.dart';
import 'package:rapsap_ops_app/features/section_reports/data/models/report_models.dart';

/// Section reports built from the fake checklist day. The DSR is "not
/// uploaded" until the fake DSR source saves one.
@fakeApi
@LazySingleton(as: ReportRemoteDataSource)
class FakeReportRemoteDataSource implements ReportRemoteDataSource {
  new(ChecklistRemoteDataSource checklist)
    : _checklist = checklist as FakeChecklistRemoteDataSource;

  final FakeChecklistRemoteDataSource _checklist;
  static const Duration _latency = Duration(milliseconds: 400);
  static const int _uploadSteps = 5;
  final Map<String, String> _status = {
    'hygiene': 'approved',
    'trading': 'returned',
  };

  /// Set by the fake DSR source when today's DSR is saved.
  static ({num sales, int bills})? todaysDsr;

  @override
  Future<List<SectionReportModel>> reports() async {
    await Future<void>.delayed(_latency);
    final now = DateTime.now();
    return [
      for (final s in _checklist.current.sections)
        _report(
          s.name,
          s.tasks,
          s.opensAt,
          s.closesAt ?? s.tasks.last.dueAt,
          now,
        ),
    ];
  }

  SectionReportModel _report(
    String name,
    List<ChecklistTaskModel> tasks,
    DateTime opensAt,
    DateTime closesAt,
    DateTime now,
  ) {
    final id = name.toLowerCase();
    final statuses = [for (final t in tasks) t.status];
    final done = statuses
        .where((s) => s == 'submitted' || s == 'verified')
        .length;
    final closed = now.isAfter(closesAt);
    final status = _status[id] ?? (closed ? 'ready' : 'not_ready');
    return SectionReportModel(
      id: id,
      section: name,
      status: status,
      opensAt: opensAt,
      closesAt: closesAt,
      done: done,
      total: tasks.length,
      notDone: statuses.where((s) => s == 'not_done').length,
      photos: done,
      toVerify: statuses.where((s) => s == 'submitted').length,
      includesDailySummary: id == 'closing',
      statusAt: status == 'not_ready' || status == 'ready' ? null : now,
      returnNote: status == 'returned'
          ? ReturnNoteModel(
              taskId: tasks.first.id,
              taskNumber: tasks.first.number,
              taskTitle: tasks.first.title,
              comment: "The photo doesn't show the full area.",
              at: now.subtract(const Duration(minutes: 30)),
            )
          : null,
    );
  }

  @override
  Future<void> submit(String id, String note) async {
    await Future<void>.delayed(_latency);
    _status[id] = 'submitted';
  }

  @override
  Future<DailySummaryFormModel> dailySummaryForm() async {
    await Future<void>.delayed(_latency);
    final dsr = todaysDsr;
    return DailySummaryFormModel(
      staffTotal: 14,
      sales: dsr?.sales,
      bills: dsr?.bills,
    );
  }

  @override
  Future<void> submitDailySummary(Map<String, dynamic> body) async {
    await Future<void>.delayed(_latency);
    if (todaysDsr == null) throw const ValidationException({'dsr': 'missing'});
    _status['closing'] = 'submitted';
  }

  @override
  Future<ReportSnapshotModel> snapshot(String id) async {
    await Future<void>.delayed(_latency);
    final section = _checklist.current.sections.firstWhere(
      (s) => s.name.toLowerCase() == id,
      orElse: () => throw const NotFoundException(),
    );
    final now = DateTime.now();
    return ReportSnapshotModel(
      reportId: id,
      title: '${section.name} report',
      storeName: 'Walk Hiranandani',
      date: now,
      opensAt: section.opensAt,
      closesAt: section.closesAt ?? section.tasks.last.dueAt,
      done: section.tasks
          .where((t) => t.status == 'submitted' || t.status == 'verified')
          .length,
      total: section.tasks.length,
      lines: [
        for (final t in section.tasks)
          SnapshotLineModel(
            number: t.number,
            title: t.title,
            mark: switch (t.status) {
              'missed' => 'missed',
              'not_done' => 'not_done',
              _ => 'done',
            },
            by: t.actorName,
            at: t.actedAt,
          ),
      ],
      targets: const [
        PostTargetModel(
          conversationId: 'c-checklist',
          name: 'Walk - Checklist',
        ),
        PostTargetModel(conversationId: 'c-daily', name: 'Daily Checklist'),
      ],
      sentAt: _status[id] == 'submitted' ? now : null,
    );
  }

  @override
  Future<void> post(String id, Uint8List image, List<String> conversationIds) =>
      Future<void>.delayed(_latency);

  @override
  Future<ClosingFormModel> closingForm() async {
    await Future<void>.delayed(_latency);
    final now = DateTime.now();
    final day = DateTime(now.year, now.month, now.day);
    String idOf(int number) =>
        [for (final s in _checklist.current.sections) ...s.tasks]
            .firstWhere((t) => t.number == number)
            .id;
    return ClosingFormModel(
      taskId: idOf(47),
      walkthroughTaskId: idOf(46),
      dueAt: day.add(const Duration(hours: 23, minutes: 15)),
      earlyBefore: day.add(const Duration(hours: 23)),
      staff: const [
        {'id': 'u-2001', 'name': 'Rahul'},
        {'id': 'm-4', 'name': 'Santosh'},
        {'id': 'm-6', 'name': 'Vijay'},
        {'id': 'm-2', 'name': 'Kavita'},
      ],
    );
  }

  @override
  Future<void> submitClosing({
    required String taskId,
    required List<String> closedBy,
    required Uint8List photo,
    required String captureToken,
  }) => Future<void>.delayed(_latency);

  @override
  Future<void> submitWalkthrough({
    required String taskId,
    required Uint8List video,
    required String fileName,
    required void Function(int sent, int total) onProgress,
  }) async {
    for (var step = 1; step <= _uploadSteps; step++) {
      await Future<void>.delayed(_latency);
      onProgress(video.length * step ~/ _uploadSteps, video.length);
    }
  }
}
