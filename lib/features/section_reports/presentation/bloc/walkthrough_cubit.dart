import 'dart:async';
import 'dart:typed_data';

import 'package:camera/camera.dart' show XFile;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/camera_service.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_walkthrough.dart';

enum WalkStatus {
  starting,
  ready,
  denied,
  unavailable,
  recording,
  review,
  sending,
  sent,
}

class WalkthroughState extends Equatable {
  const new({
    this.status = WalkStatus.starting,
    this.seconds = 0,
    this.clip,
    this.progress = 0,
    this.failure,
  });

  final WalkStatus status;
  final int seconds;
  final XFile? clip;
  final double progress;
  final Failure? failure;

  WalkthroughState copyWith({
    WalkStatus? status,
    int? seconds,
    XFile? clip,
    double? progress,
    Failure? failure,
  }) => WalkthroughState(
    status: status ?? this.status,
    seconds: seconds ?? this.seconds,
    clip: clip ?? this.clip,
    progress: progress ?? this.progress,
    failure: failure,
  );

  @override
  List<Object?> get props => [status, seconds, clip?.path, progress, failure];
}

/// C15 record (stops at 45 s) → X9 review → upload (CK-30).
@injectable
class WalkthroughCubit extends Cubit<WalkthroughState> {
  new(this.camera, this._submit) : super(const WalkthroughState());

  final CameraService camera;
  final SubmitWalkthrough _submit;
  Timer? _ticker;

  /// Start/stop in flight; stops double taps.
  bool _busy = false;

  Future<void> start() async {
    final result = await camera.start(withAudio: true);
    if (isClosed) return;
    emit(
      WalkthroughState(
        status: switch (result) {
          CameraStartResult.ready => WalkStatus.ready,
          CameraStartResult.denied => WalkStatus.denied,
          CameraStartResult.unavailable => WalkStatus.unavailable,
        },
      ),
    );
  }

  Future<void> record() async {
    if (state.status != WalkStatus.ready || _busy) return;
    _busy = true;
    try {
      await camera.startVideo();
    } on Object catch (error, stackTrace) {
      appLogger.e(
        'Start recording failed',
        error: error,
        stackTrace: stackTrace,
      );
      _busy = false;
      if (!isClosed) emit(state.copyWith(failure: const UnknownFailure()));
      return;
    }
    _busy = false;
    if (isClosed) return;
    emit(state.copyWith(status: WalkStatus.recording, seconds: 0));
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (isClosed) return;
      final next = state.seconds + 1;
      emit(state.copyWith(seconds: next));
      if (next >= AppConstants.walkthroughVideoSeconds) unawaited(stop());
    });
  }

  Future<void> stop() async {
    if (state.status != WalkStatus.recording || _busy) return;
    _busy = true;
    _ticker?.cancel();
    try {
      final clip = await camera.stopVideo();
      if (!isClosed) {
        emit(state.copyWith(status: WalkStatus.review, clip: clip));
      }
    } on Object catch (error, stackTrace) {
      appLogger.e(
        'Stop recording failed',
        error: error,
        stackTrace: stackTrace,
      );
      if (!isClosed) emit(state.copyWith(status: WalkStatus.ready));
    } finally {
      _busy = false;
    }
  }

  void retake() => emit(const WalkthroughState(status: WalkStatus.ready));

  Future<void> send(String taskId) async {
    final clip = state.clip;
    if (clip == null || state.status == WalkStatus.sending) return;
    emit(state.copyWith(status: WalkStatus.sending, progress: 0));
    final Uint8List video;
    try {
      video = await clip.readAsBytes();
    } on Object catch (error, stackTrace) {
      appLogger.e('Read video failed', error: error, stackTrace: stackTrace);
      if (!isClosed) {
        emit(
          state.copyWith(
            status: WalkStatus.review,
            failure: const UnknownFailure(),
          ),
        );
      }
      return;
    }
    final result = await _submit(
      taskId: taskId,
      video: video,
      fileName: clip.name,
      onProgress: (p) {
        if (!isClosed) emit(state.copyWith(progress: p));
      },
    );
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(status: WalkStatus.review, failure: f),
        (_) => state.copyWith(status: WalkStatus.sent),
      ),
    );
  }

  @override
  Future<void> close() async {
    _ticker?.cancel();
    await camera.dispose();
    await super.close();
  }
}
