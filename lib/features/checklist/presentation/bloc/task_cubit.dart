import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/submission_result.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/get_task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/start_capture.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_not_done.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_photo.dart';
import 'package:rapsap_ops_app/features/uploads/domain/entities/pending_upload.dart';
import 'package:rapsap_ops_app/features/uploads/domain/usecases/find_saved_proof.dart';
import 'package:rapsap_ops_app/features/uploads/domain/usecases/remove_upload.dart';
import 'package:rapsap_ops_app/features/uploads/domain/usecases/save_upload.dart';

enum TaskLoadStatus { loading, success, failure }

enum TaskAction {
  idle,
  preparingCamera,
  cameraReady,
  submitting,
  submitted,
  interrupted,
  failure,
}

class TaskState extends Equatable {
  const new({
    this.load = TaskLoadStatus.loading,
    this.detail,
    this.action = TaskAction.idle,
    this.session,
    this.media,
    this.remarks = '',
    this.notDoneMode = false,
    this.reason = '',
    this.progress = 0,
    this.failure,
    this.result,
  });

  final TaskLoadStatus load;
  final TaskDetail? detail;
  final TaskAction action;
  final CaptureSession? session;
  final MediaFile? media;
  final String remarks;
  final bool notDoneMode;
  final String reason;
  final double progress;
  final Failure? failure;
  final SubmissionResult? result;

  bool get isBusy =>
      action == TaskAction.preparingCamera || action == TaskAction.submitting;

  TaskState copyWith({
    TaskLoadStatus? load,
    TaskDetail? detail,
    TaskAction? action,
    CaptureSession? session,
    MediaFile? media,
    String? remarks,
    bool? notDoneMode,
    String? reason,
    double? progress,
    Failure? failure,
    SubmissionResult? result,
  }) => TaskState(
    load: load ?? this.load,
    detail: detail ?? this.detail,
    action: action ?? this.action,
    session: session ?? this.session,
    media: media ?? this.media,
    remarks: remarks ?? this.remarks,
    notDoneMode: notDoneMode ?? this.notDoneMode,
    reason: reason ?? this.reason,
    progress: progress ?? this.progress,
    failure: failure,
    result: result ?? this.result,
  );

  @override
  List<Object?> get props => [
    load,
    detail,
    action,
    session,
    media,
    remarks,
    notDoneMode,
    reason,
    progress,
    failure,
    result,
  ];
}

/// One task: load it, open the camera with a server capture token, then
/// submit the photo or video (or a not-done reason). Proof is saved on the
/// device before it is sent and kept there if the connection drops, so it
/// survives a reload (X4).
@injectable
class TaskCubit extends Cubit<TaskState> {
  new(
    this._getDetail,
    this._startCapture,
    this._submitPhoto,
    this._submitNotDone,
    this._findSavedProof,
    this._saveUpload,
    this._removeUpload,
  ) : super(const TaskState());

  final GetTaskDetail _getDetail;
  final StartCapture _startCapture;
  final SubmitTaskPhoto _submitPhoto;
  final SubmitTaskNotDone _submitNotDone;
  final FindSavedProof _findSavedProof;
  final SaveUpload _saveUpload;
  final RemoveUpload _removeUpload;
  late String _taskId;

  /// The device copy of the proof in [TaskState.media], once saved.
  SavedProof? _saved;

  Future<void> load(String taskId) async {
    _taskId = taskId;
    emit(state.copyWith(load: TaskLoadStatus.loading));
    final result = await _getDetail(taskId);
    final saved = (await _findSavedProof(taskId)).getOrElse((_) => null);
    if (isClosed) return;
    emit(
      result.match(
        (failure) =>
            state.copyWith(load: TaskLoadStatus.failure, failure: failure),
        (detail) => _restore(
          state.copyWith(load: TaskLoadStatus.success, detail: detail),
          saved,
        ),
      ),
    );
  }

  TaskState _restore(TaskState loaded, SavedProof? saved) {
    if (saved == null) return loaded;
    _saved = saved;
    return loaded.copyWith(
      action: TaskAction.interrupted,
      media: saved.media,
      remarks: saved.upload.remarks,
    );
  }

  Future<void> reload() => load(_taskId);

  Future<void> openCamera() async {
    if (state.isBusy) return;
    emit(state.copyWith(action: TaskAction.preparingCamera));
    final result = await _startCapture(_taskId);
    if (isClosed) return;
    emit(
      result.match(
        (failure) =>
            state.copyWith(action: TaskAction.failure, failure: failure),
        (session) =>
            state.copyWith(action: TaskAction.cameraReady, session: session),
      ),
    );
  }

  void mediaTaken(MediaFile? media) {
    if (state.action == TaskAction.submitting) return;
    emit(
      state.copyWith(action: TaskAction.idle, media: media, notDoneMode: false),
    );
  }

  void remarksChanged(String value) => emit(state.copyWith(remarks: value));

  void reasonChanged(String value) => emit(state.copyWith(reason: value));

  void setNotDoneMode({required bool enabled}) {
    if (state.isBusy) return;
    emit(state.copyWith(notDoneMode: enabled, action: TaskAction.idle));
  }

  Future<void> submit() async {
    final media = state.media;
    if (state.isBusy || media == null) return;
    final upload = _uploadFor(media);
    if (upload == null) return;
    emit(state.copyWith(action: TaskAction.submitting, progress: 0));
    await _keepOnDevice(upload, media);
    final result = await _submitPhoto(
      taskId: _taskId,
      clientId: upload.id,
      media: media,
      captureToken: upload.captureToken,
      remarks: upload.remarks,
      onProgress: (progress) {
        if (!isClosed) emit(state.copyWith(progress: progress));
      },
    );
    if (result.isRight() || _isRefused(result)) await _forget();
    _finish(result, keepMediaOnDrop: true);
  }

  /// Reuses the saved record (and its `client_id`) while the media is the
  /// same; new media needs the token from a new camera session.
  PendingUpload? _uploadFor(MediaFile media) {
    final saved = _saved;
    final remarks = state.remarks.trim();
    if (saved != null && identical(saved.media, media)) {
      return saved.upload.withRemarks(remarks);
    }
    final session = state.session;
    final task = state.detail?.task;
    if (session == null || task == null) return null;
    return PendingUpload(
      id: 'local-${DateTime.now().microsecondsSinceEpoch}',
      kind: UploadKind.taskProof,
      targetId: _taskId,
      taskNumber: task.number,
      taskTitle: task.title,
      isVideo: media.isVideo,
      videoName: media.name,
      captureToken: session.token,
      remarks: remarks,
      savedAt: DateTime.now(),
    );
  }

  /// A save failure is already logged; the upload is still tried.
  Future<void> _keepOnDevice(PendingUpload upload, MediaFile media) async {
    final previous = _saved;
    if (previous != null && previous.upload.id != upload.id) await _forget();
    final result = await _saveUpload(upload, media);
    if (result.isRight()) _saved = (upload: upload, media: media);
  }

  Future<void> _forget() async {
    final saved = _saved;
    if (saved == null) return;
    _saved = null;
    await _removeUpload(saved.upload.id);
  }

  /// The server said no to this proof; anything else (offline, cancelled,
  /// unknown) keeps the saved copy so nothing is lost.
  static bool _isRefused(Either<Failure, Object> result) => result.match(
    (failure) => switch (failure) {
      MessageBlockedFailure() ||
      ValidationFailure() ||
      ForbiddenFailure() ||
      NotFoundFailure() => true,
      _ => false,
    },
    (_) => false,
  );

  static bool _isDropped(Either<Failure, Object> result) => result.match(
    (failure) => failure is NoInternetFailure || failure is TimeoutFailure,
    (_) => false,
  );

  Future<void> submitNotDone() async {
    if (state.isBusy) return;
    emit(state.copyWith(action: TaskAction.submitting, progress: 0));
    final result = await _submitNotDone(taskId: _taskId, reason: state.reason);
    _finish(result, keepMediaOnDrop: false);
  }

  void backToTask() => emit(state.copyWith(action: TaskAction.idle));

  void _finish(
    Either<Failure, SubmissionResult> result, {
    required bool keepMediaOnDrop,
  }) {
    if (isClosed) return;
    emit(
      result.match((failure) {
        return state.copyWith(
          action: _isDropped(result) && keepMediaOnDrop
              ? TaskAction.interrupted
              : TaskAction.failure,
          failure: failure,
        );
      }, (r) => state.copyWith(action: TaskAction.submitted, result: r)),
    );
  }
}
