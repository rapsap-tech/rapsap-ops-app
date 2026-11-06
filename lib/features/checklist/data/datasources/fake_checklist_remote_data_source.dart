import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/network/network_info.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/capture_session_model.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/submission_result_model.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/task_detail_model.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/today_checklist_model.dart';

/// In-memory sample day built around the first "now", so there is always a
/// task due soon; submissions update it until the page reloads.
@fakeApi
@LazySingleton(as: ChecklistRemoteDataSource)
class FakeChecklistRemoteDataSource implements ChecklistRemoteDataSource {
  new(this._network);

  /// Uploads fail with no device network, like the real API.
  final NetworkInfo _network;

  static const Duration _latency = Duration(milliseconds: 500);
  static const int _uploadSteps = 5;
  static const String _manager = 'Rahul';

  TodayChecklistModel? _day;

  TodayChecklistModel get _today => _day ??= _buildDay(DateTime.now());

  /// Current sample day, for other fakes (review, reports) to read.
  TodayChecklistModel get current => _today;

  /// Lets other fakes change a task (verify, send back, unlock).
  void updateTask(
    String taskId,
    ChecklistTaskModel Function(ChecklistTaskModel task) change,
  ) {
    _day = _today.copyWith(
      sections: [
        for (final s in _today.sections)
          s.copyWith(
            tasks: [
              for (final t in s.tasks)
                if (t.id == taskId) change(t) else t,
            ],
          ),
      ],
    );
  }

  @override
  Future<TodayChecklistModel> today() async {
    await Future<void>.delayed(_latency);
    return _today;
  }

  @override
  Future<TaskDetailModel> taskDetail(String taskId) async {
    await Future<void>.delayed(_latency);
    final (section, task) = _find(taskId);
    final sentBack = task.status == 'sent_back';
    return TaskDetailModel(
      task: task,
      section: section,
      assignedTo: 'Maintenance',
      photoHint: 'Show the display and the full unit',
      managerName: _manager,
      checklistGroup: 'Walk - Checklist',
      sendBack: sentBack
          ? SendBackNoteModel(
              by: _manager,
              at: task.opensAt!,
              reason: 'Photo is blurry. Show the full shelf.',
            )
          : null,
      lockedAt: task.status == 'missed'
          ? task.dueAt!.add(const Duration(minutes: 2))
          : null,
    );
  }

  @override
  Future<CaptureSessionModel> startCapture(String taskId) async {
    await Future<void>.delayed(_latency);
    final (_, task) = _find(taskId);
    return CaptureSessionModel(
      token: 'fake-capture-$taskId-${DateTime.now().millisecondsSinceEpoch}',
      serverTime: DateTime.now(),
      storeCode: 'S04',
      storeName: 'WALK HIRANANDANI',
      staffName: 'Priya',
      taskNumber: task.number,
    );
  }

  @override
  Future<SubmissionResultModel> submitPhoto({
    required String taskId,
    required String clientId,
    required MediaFile media,
    required String captureToken,
    required String remarks,
    required void Function(int sent, int total) onProgress,
  }) async {
    if (!await _network.isConnected) throw const NoInternetException();
    for (var step = 1; step <= _uploadSteps; step++) {
      await Future<void>.delayed(_latency ~/ _uploadSteps);
      onProgress(media.bytes.length * step ~/ _uploadSteps, media.bytes.length);
    }
    return _complete(taskId, 'submitted');
  }

  @override
  Future<SubmissionResultModel> submitNotDone({
    required String taskId,
    required String reason,
  }) async {
    await Future<void>.delayed(_latency);
    return _complete(taskId, 'not_done');
  }

  SubmissionResultModel _complete(String taskId, String status) {
    final now = DateTime.now();
    final (_, task) = _find(taskId);
    updateTask(taskId, (t) => t.copyWith(status: status, actedAt: now));
    return SubmissionResultModel(
      submittedAt: now,
      onTime: !now.isAfter(task.dueAt!),
    );
  }

  (String, ChecklistTaskModel) _find(String taskId) {
    for (final section in _today.sections) {
      for (final task in section.tasks) {
        if (task.id == taskId) return (section.name, task);
      }
    }
    throw const NotFoundException();
  }

  static TodayChecklistModel _buildDay(DateTime now) {
    DateTime at(int minutes) => now.add(Duration(minutes: minutes));
    ChecklistTaskModel task(
      int number,
      String title,
      int opens,
      int due,
      String status, {
      String? actor,
      int? acted,
    }) => ChecklistTaskModel(
      id: 't-$number-$opens',
      number: number,
      title: title,
      opensAt: at(opens),
      dueAt: at(due),
      status: status,
      actorName: actor,
      actedAt: acted == null ? null : at(acted),
    );

    return TodayChecklistModel(
      date: now,
      shift: 'opening',
      sections: [
        ChecklistSectionModel(
          name: 'Opening',
          opensAt: at(-180),
          closesAt: at(-90),
          tasks: [
            task(
              2,
              'Lights, AC, signage working',
              -180,
              -135,
              'verified',
              actor: _manager,
              acted: -140,
            ),
            task(
              5,
              'Fresh produce display filled before opening',
              -150,
              24,
              'sent_back',
              actor: _manager,
              acted: -60,
            ),
            task(
              11,
              'Fire exits clear and extinguishers available',
              -170,
              -120,
              'missed',
            ),
          ],
        ),
        ChecklistSectionModel(
          name: 'Hygiene',
          opensAt: at(-90),
          tasks: [
            task(
              30,
              'Pest control observations',
              -90,
              -30,
              'submitted',
              acted: -38,
            ),
          ],
        ),
        ChecklistSectionModel(
          name: 'Trading',
          opensAt: at(-30),
          tasks: [
            task(
              22,
              'Temperature of chillers / freezers recorded',
              -20,
              12,
              'pending',
            ),
            task(22, 'Chiller temperature', 300, 330, 'pending'),
          ],
        ),
        ChecklistSectionModel(
          name: 'Closing',
          opensAt: at(700),
          tasks: [
            task(38, 'Chillers working before shutdown', 705, 735, 'pending'),
            task(45, 'Cash drawer counted and locked', 715, 745, 'pending'),
            task(46, 'Store walkthrough video', 720, 750, 'pending'),
            task(47, 'Closing report', 730, 765, 'pending'),
          ],
        ),
      ],
    );
  }
}
