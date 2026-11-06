import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/fake_checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/today_checklist_model.dart';
import 'package:rapsap_ops_app/features/review/data/datasources/review_remote_data_source.dart';
import 'package:rapsap_ops_app/features/review/data/models/review_models.dart';

/// Reads and changes the same in-memory day as the fake checklist, so the
/// SM's actions show up on the staff side.
@fakeApi
@LazySingleton(as: ReviewRemoteDataSource)
class FakeReviewRemoteDataSource implements ReviewRemoteDataSource {
  new(ChecklistRemoteDataSource checklist)
    : _checklist = checklist as FakeChecklistRemoteDataSource;

  final FakeChecklistRemoteDataSource _checklist;
  static const Duration _latency = Duration(milliseconds: 400);
  static const Duration _reopenFor = Duration(minutes: 30);
  static const List<(String, String)> _staff = [
    ('Imran Shaikh', 'FNV'),
    ('Meena', 'Merchandising'),
    ('Kavita', 'Cashier'),
    ('Santosh', 'Store Admin'),
    ('Priya', 'Housekeeping'),
  ];

  Iterable<(ChecklistSectionModel, ChecklistTaskModel)> get _tasks sync* {
    for (final s in _checklist.current.sections) {
      for (final t in s.tasks) {
        yield (s, t);
      }
    }
  }

  ReviewItemModel? _item(ChecklistSectionModel s, ChecklistTaskModel t) {
    final now = DateTime.now();
    final kind = switch (t.status) {
      'submitted' => 'needs_review',
      'missed' => 'missed',
      'not_done' => 'not_done',
      'pending' when !now.isBefore(t.opensAt!) => 'open_now',
      _ => null,
    };
    if (kind == null) return null;
    final (name, role) = _staff[t.number % _staff.length];
    return ReviewItemModel(
      taskId: t.id,
      number: t.number,
      title: t.title,
      section: s.name,
      staffName: name,
      staffRole: role,
      kind: kind,
      at: t.actedAt ?? t.dueAt,
      reason: kind == 'not_done' ? 'Change short' : null,
    );
  }

  @override
  Future<ManagerDashboardModel> dashboard() async {
    await Future<void>.delayed(_latency);
    final day = _checklist.current;
    final all = [for (final (_, t) in _tasks) t];
    int count(String status) => all.where((t) => t.status == status).length;
    final now = DateTime.now();
    return ManagerDashboardModel(
      date: day.date,
      done: count('submitted') + count('verified'),
      total: all.length,
      toReview: count('submitted'),
      missed: count('missed'),
      notDone: count('not_done'),
      sections: [
        for (final s in day.sections)
          SectionProgressModel(
            id: s.name.toLowerCase(),
            name: s.name,
            status: _sectionStatus(s, now),
            done: s.tasks
                .where(
                  (t) => const {'submitted', 'verified'}.contains(t.status),
                )
                .length,
            total: s.tasks.length,
            missed: s.tasks.where((t) => t.status == 'missed').length,
          ),
      ],
      sales: SalesSummaryModel(
        month: now,
        salesMtd: 1840000,
        target: 2750000,
        dsrDueAt: DateTime(now.year, now.month, now.day, 23),
      ),
    );
  }

  String _sectionStatus(ChecklistSectionModel s, DateTime now) {
    if (s.tasks.any((t) => t.status == 'missed')) return 'critical';
    final closed = s.tasks.every(
      (t) => now.isAfter(t.dueAt!) || t.status != 'pending',
    );
    return closed ? 'ready' : 'in_progress';
  }

  @override
  Future<List<ReviewItemModel>> queue() async {
    await Future<void>.delayed(_latency);
    return [for (final (s, t) in _tasks) ?_item(s, t)];
  }

  @override
  Future<ReviewDetailModel> detail(String taskId) async {
    await Future<void>.delayed(_latency);
    for (final (s, t) in _tasks) {
      if (t.id != taskId) continue;
      final item = _item(s, t);
      if (item == null) break;
      return ReviewDetailModel(
        item: ReviewTaskModel(
          number: item.number,
          title: item.title,
          section: item.section,
        ),
        status: t.status,
        remarks: t.status == 'submitted' ? 'Done as per the standard.' : null,
        lockedAt: t.status == 'missed'
            ? t.dueAt?.add(const Duration(minutes: 2))
            : null,
      );
    }
    throw const NotFoundException();
  }

  @override
  Future<void> verify(String taskId) => _change(
    taskId,
    (t) => t.copyWith(status: 'verified', actorName: 'Rahul'),
  );

  @override
  Future<void> sendBack(String taskId, String reason) => _change(
    taskId,
    (t) => t.copyWith(
      status: 'sent_back',
      actorName: 'Rahul',
      dueAt: DateTime.now().add(_reopenFor),
    ),
  );

  @override
  Future<void> edit({
    required String taskId,
    required MediaFile media,
    required String captureToken,
    required String reason,
    required String remarks,
  }) => _change(taskId, (t) => t.copyWith(actedAt: DateTime.now()));

  @override
  Future<void> unlock(String taskId) => _change(
    taskId,
    (t) => t.copyWith(status: 'pending', dueAt: DateTime.now().add(_reopenFor)),
  );

  @override
  Future<void> takeOver(String taskId) => unlock(taskId);

  Future<void> _change(
    String taskId,
    ChecklistTaskModel Function(ChecklistTaskModel) change,
  ) async {
    await Future<void>.delayed(_latency);
    _checklist.updateTask(taskId, change);
  }
}
