import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/submission_result.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/get_task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/start_capture.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_not_done.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_photo.dart';

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
    this.photo,
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
  final Uint8List? photo;
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
    Uint8List? photo,
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
    photo: photo ?? this.photo,
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
    photo,
    remarks,
    notDoneMode,
    reason,
    progress,
    failure,
    result,
  ];
}

/// One task: load it, open the camera with a server capture token, then
/// submit the photo (or a not-done reason). Uploads are never auto-retried.
@injectable
class TaskCubit extends Cubit<TaskState> {
  new(
    this._getDetail,
    this._startCapture,
    this._submitPhoto,
    this._submitNotDone,
  ) : super(const TaskState());

  final GetTaskDetail _getDetail;
  final StartCapture _startCapture;
  final SubmitTaskPhoto _submitPhoto;
  final SubmitTaskNotDone _submitNotDone;
  late String _taskId;

  Future<void> load(String taskId) async {
    _taskId = taskId;
    emit(state.copyWith(load: TaskLoadStatus.loading));
    final result = await _getDetail(taskId);
    if (isClosed) return;
    emit(
      result.match(
        (failure) =>
            state.copyWith(load: TaskLoadStatus.failure, failure: failure),
        (detail) =>
            state.copyWith(load: TaskLoadStatus.success, detail: detail),
      ),
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

  void photoTaken(Uint8List? photo) {
    if (state.action == TaskAction.submitting) return;
    emit(
      state.copyWith(action: TaskAction.idle, photo: photo, notDoneMode: false),
    );
  }

  void remarksChanged(String value) => emit(state.copyWith(remarks: value));

  void reasonChanged(String value) => emit(state.copyWith(reason: value));

  void setNotDoneMode({required bool enabled}) {
    if (state.isBusy) return;
    emit(state.copyWith(notDoneMode: enabled, action: TaskAction.idle));
  }

  Future<void> submit() async {
    final photo = state.photo;
    final session = state.session;
    if (state.isBusy || photo == null || session == null) return;
    emit(state.copyWith(action: TaskAction.submitting, progress: 0));
    final result = await _submitPhoto(
      taskId: _taskId,
      photo: photo,
      captureToken: session.token,
      remarks: state.remarks,
      onProgress: (progress) {
        if (!isClosed) emit(state.copyWith(progress: progress));
      },
    );
    _finish(result, keepPhotoOnDrop: true);
  }

  Future<void> submitNotDone() async {
    if (state.isBusy) return;
    emit(state.copyWith(action: TaskAction.submitting, progress: 0));
    final result = await _submitNotDone(taskId: _taskId, reason: state.reason);
    _finish(result, keepPhotoOnDrop: false);
  }

  void backToTask() => emit(state.copyWith(action: TaskAction.idle));

  void _finish(
    Either<Failure, SubmissionResult> result, {
    required bool keepPhotoOnDrop,
  }) {
    if (isClosed) return;
    emit(
      result.match((failure) {
        final dropped =
            failure is NoInternetFailure || failure is TimeoutFailure;
        return state.copyWith(
          action: dropped && keepPhotoOnDrop
              ? TaskAction.interrupted
              : TaskAction.failure,
          failure: failure,
        );
      }, (r) => state.copyWith(action: TaskAction.submitted, result: r)),
    );
  }
}
