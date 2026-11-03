import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/camera_service.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/core/services/media/photo_processor.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';

enum CameraStatus {
  starting,
  ready,
  denied,
  unavailable,
  recording,
  processing,
  captured,
}

enum CameraMode { photo, video }

class CameraState extends Equatable {
  const new({
    this.status = CameraStatus.starting,
    this.mode = CameraMode.photo,
    this.seconds = 0,
    this.media,
    this.failure,
  });

  final CameraStatus status;
  final CameraMode mode;
  final int seconds;
  final MediaFile? media;

  /// Why the last capture didn't work; cleared by the next change.
  final Failure? failure;

  CameraState copyWith({
    CameraStatus? status,
    CameraMode? mode,
    int? seconds,
    MediaFile? media,
    Failure? failure,
  }) => CameraState(
    status: status ?? this.status,
    mode: mode ?? this.mode,
    seconds: seconds ?? this.seconds,
    media: media ?? this.media,
    failure: failure,
  );

  @override
  List<Object?> get props => [status, mode, seconds, media, failure];
}

/// Live in-app camera for proof photos (stamped and compressed) and clips
/// (up to [AppConstants.maxVideoSeconds], uploaded as recorded).
@injectable
class CameraCubit extends Cubit<CameraState> {
  new(this.camera, this._processor) : super(const CameraState());

  final CameraService camera;
  final PhotoProcessor _processor;
  Timer? _ticker;

  /// Start/stop recording in flight; stops double taps.
  bool _busy = false;

  Future<void> start() async {
    final result = await camera.start(
      withAudio: state.mode == CameraMode.video,
    );
    if (isClosed) return;
    emit(
      state.copyWith(
        status: switch (result) {
          CameraStartResult.ready => CameraStatus.ready,
          CameraStartResult.denied => CameraStatus.denied,
          CameraStartResult.unavailable => CameraStatus.unavailable,
        },
      ),
    );
  }

  /// Video needs the microphone, so the camera restarts with audio.
  Future<void> setMode(CameraMode mode) async {
    if (mode == state.mode || state.status != CameraStatus.ready) return;
    emit(state.copyWith(status: CameraStatus.starting, mode: mode));
    await camera.dispose();
    if (isClosed) return;
    await start();
  }

  /// [stamp] is built at the moment of capture so its time is exact.
  Future<void> capture(List<String> Function() stamp) async {
    if (state.status != CameraStatus.ready) return;
    emit(state.copyWith(status: CameraStatus.processing));
    try {
      final raw = await camera.takePhoto();
      final photo = await _processor.stampAndCompress(raw, stamp());
      if (!isClosed) {
        emit(
          state.copyWith(
            status: CameraStatus.captured,
            media: MediaFile.photo(photo),
          ),
        );
      }
    } on Object catch (error, stackTrace) {
      appLogger.e('Capture failed', error: error, stackTrace: stackTrace);
      if (!isClosed) {
        emit(
          state.copyWith(
            status: CameraStatus.ready,
            failure: const UnknownFailure(),
          ),
        );
      }
    }
  }

  Future<void> record() async {
    if (state.status != CameraStatus.ready || _busy) return;
    _busy = true;
    try {
      await camera.startVideo();
    } on Object catch (error, stackTrace) {
      appLogger.e(
        'Start recording failed',
        error: error,
        stackTrace: stackTrace,
      );
      if (!isClosed) emit(state.copyWith(failure: const UnknownFailure()));
      return;
    } finally {
      _busy = false;
    }
    if (isClosed) return;
    emit(state.copyWith(status: CameraStatus.recording, seconds: 0));
    _ticker?.cancel();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      if (isClosed) return;
      final next = state.seconds + 1;
      emit(state.copyWith(seconds: next));
      if (next >= AppConstants.maxVideoSeconds) unawaited(stop());
    });
  }

  Future<void> stop() async {
    if (state.status != CameraStatus.recording || _busy) return;
    _busy = true;
    _ticker?.cancel();
    emit(state.copyWith(status: CameraStatus.processing));
    try {
      final clip = await camera.stopVideo();
      final bytes = await clip.readAsBytes();
      if (bytes.length > AppConstants.videoMaxBytes) {
        if (!isClosed) {
          emit(
            state.copyWith(
              status: CameraStatus.ready,
              failure: const MediaTooLargeFailure(),
            ),
          );
        }
        return;
      }
      if (!isClosed) {
        emit(
          state.copyWith(
            status: CameraStatus.captured,
            media: MediaFile.video(bytes, name: clip.name, path: clip.path),
          ),
        );
      }
    } on Object catch (error, stackTrace) {
      appLogger.e(
        'Stop recording failed',
        error: error,
        stackTrace: stackTrace,
      );
      if (!isClosed) {
        emit(
          state.copyWith(
            status: CameraStatus.ready,
            failure: const UnknownFailure(),
          ),
        );
      }
    } finally {
      _busy = false;
    }
  }

  @override
  Future<void> close() async {
    _ticker?.cancel();
    await camera.dispose();
    await super.close();
  }
}
