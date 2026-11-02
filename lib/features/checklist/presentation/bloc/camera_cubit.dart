import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/services/media/camera_service.dart';
import 'package:rapsap_ops_app/core/services/media/photo_processor.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';

enum CameraStatus { starting, ready, denied, unavailable, processing, captured }

class CameraState extends Equatable {
  const new({this.status = CameraStatus.starting, this.photo});

  final CameraStatus status;
  final Uint8List? photo;

  @override
  List<Object?> get props => [status, photo];
}

/// Live in-app camera for proof photos; the result is already stamped and
/// compressed.
@injectable
class CameraCubit extends Cubit<CameraState> {
  new(this.camera, this._processor) : super(const CameraState());

  final CameraService camera;
  final PhotoProcessor _processor;

  Future<void> start() async {
    final result = await camera.start();
    if (isClosed) return;
    emit(
      CameraState(
        status: switch (result) {
          CameraStartResult.ready => CameraStatus.ready,
          CameraStartResult.denied => CameraStatus.denied,
          CameraStartResult.unavailable => CameraStatus.unavailable,
        },
      ),
    );
  }

  Future<void> switchCamera() => camera.switchCamera();

  /// [stamp] is built at the moment of capture so its time is exact.
  Future<void> capture(List<String> Function() stamp) async {
    if (state.status != CameraStatus.ready) return;
    emit(const CameraState(status: CameraStatus.processing));
    try {
      final raw = await camera.takePhoto();
      final photo = await _processor.stampAndCompress(raw, stamp());
      if (!isClosed) {
        emit(CameraState(status: CameraStatus.captured, photo: photo));
      }
    } on Object catch (error, stackTrace) {
      appLogger.e('Capture failed', error: error, stackTrace: stackTrace);
      if (!isClosed) emit(const CameraState(status: CameraStatus.ready));
    }
  }

  @override
  Future<void> close() async {
    await camera.dispose();
    await super.close();
  }
}
