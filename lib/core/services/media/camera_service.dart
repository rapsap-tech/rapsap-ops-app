import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';

enum CameraStartResult { ready, denied, unavailable }

/// In-app live camera (web and mobile, via the camera plugin). No gallery.
@injectable
class CameraService {
  CameraController? _controller;
  bool _disposed = false;

  Future<CameraStartResult> start({bool withAudio = false}) async {
    _disposed = false;
    try {
      final cameras = await availableCameras();
      if (_disposed) return CameraStartResult.unavailable;
      if (cameras.isEmpty) return CameraStartResult.unavailable;
      final back = cameras.firstWhere(
        (c) => c.lensDirection == CameraLensDirection.back,
        orElse: () => cameras.first,
      );
      final controller = CameraController(
        back,
        withAudio ? ResolutionPreset.medium : ResolutionPreset.high,
        enableAudio: withAudio,
      );
      _controller = controller;
      await controller.initialize();
      // The page closed while the permission prompt was up.
      if (_disposed) {
        await dispose();
        return CameraStartResult.unavailable;
      }
      return CameraStartResult.ready;
    } on CameraException catch (error) {
      appLogger.w('Camera start failed', error: error.code);
      return error.code.contains('Denied')
          ? CameraStartResult.denied
          : CameraStartResult.unavailable;
    } on Object catch (error) {
      appLogger.w('Camera start failed', error: error.runtimeType);
      return CameraStartResult.unavailable;
    }
  }

  Widget preview() {
    final controller = _controller;
    if (controller == null || !controller.value.isInitialized) {
      return const SizedBox.shrink();
    }
    return controller.buildPreview();
  }

  Future<Uint8List> takePhoto() async {
    final controller = _controller;
    if (controller == null) throw StateError('Camera not started');
    final file = await controller.takePicture();
    return await file.readAsBytes();
  }

  Future<void> startVideo() async {
    final controller = _controller;
    if (controller == null) throw StateError('Camera not started');
    await controller.startVideoRecording();
  }

  /// Stops recording; the clip stays on the device until uploaded.
  Future<XFile> stopVideo() async {
    final controller = _controller;
    if (controller == null) throw StateError('Camera not started');
    return await controller.stopVideoRecording();
  }

  Future<void> dispose() async {
    _disposed = true;
    final controller = _controller;
    _controller = null;
    await controller?.dispose();
  }
}
