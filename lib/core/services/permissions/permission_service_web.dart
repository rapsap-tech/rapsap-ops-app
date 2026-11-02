import 'dart:js_interop';

import 'package:rapsap_ops_app/core/services/permissions/permission_service.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:web/web.dart' as web;

PermissionService createPermissionService() => _WebPermissionService();

class _WebPermissionService implements PermissionService {
  @override
  Future<AppPermissionStatus> cameraStatus() async {
    try {
      final result = await web.window.navigator.permissions
          .query({'name': 'camera'}.jsify()! as JSObject)
          .toDart;
      return _fromWeb(result.state);
    } on Object catch (error) {
      // Safari has no camera permission query; ask on tap instead.
      appLogger.d('Camera status unavailable', error: error.runtimeType);
      return AppPermissionStatus.unknown;
    }
  }

  @override
  Future<AppPermissionStatus> requestCamera() async {
    try {
      final stream = await web.window.navigator.mediaDevices
          .getUserMedia(web.MediaStreamConstraints(video: true.toJS))
          .toDart;
      for (final track in stream.getTracks().toDart) {
        track.stop();
      }
      return AppPermissionStatus.granted;
    } on Object catch (error) {
      appLogger.w('Camera permission refused', error: error.runtimeType);
      return AppPermissionStatus.denied;
    }
  }

  @override
  Future<AppPermissionStatus> notificationStatus() async {
    try {
      return _fromWeb(web.Notification.permission);
    } on Object catch (error) {
      // iOS Safari exposes Notification only to installed PWAs.
      appLogger.d('Notifications unsupported', error: error.runtimeType);
      return AppPermissionStatus.denied;
    }
  }

  @override
  Future<AppPermissionStatus> requestNotifications() async {
    try {
      final result = await web.Notification.requestPermission().toDart;
      return _fromWeb(result.toDart);
    } on Object catch (error) {
      appLogger.w('Notification permission failed', error: error.runtimeType);
      return AppPermissionStatus.denied;
    }
  }

  AppPermissionStatus _fromWeb(String state) => switch (state) {
    'granted' => AppPermissionStatus.granted,
    'denied' => AppPermissionStatus.denied,
    _ => AppPermissionStatus.unknown,
  };
}
