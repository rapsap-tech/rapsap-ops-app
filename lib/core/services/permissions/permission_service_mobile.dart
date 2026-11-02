import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rapsap_ops_app/core/services/permissions/permission_service.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';

PermissionService createPermissionService() => _MobilePermissionService();

class _MobilePermissionService implements PermissionService {
  final FlutterLocalNotificationsPlugin _notifications =
      FlutterLocalNotificationsPlugin();

  /// Mobile has no camera status query without an extra package; ask on tap.
  @override
  Future<AppPermissionStatus> cameraStatus() async =>
      AppPermissionStatus.unknown;

  @override
  Future<AppPermissionStatus> requestCamera() async {
    CameraController? controller;
    try {
      final cameras = await availableCameras();
      if (cameras.isEmpty) return AppPermissionStatus.denied;
      controller = CameraController(
        cameras.first,
        ResolutionPreset.low,
        enableAudio: false,
      );
      await controller.initialize();
      return AppPermissionStatus.granted;
    } on CameraException catch (error) {
      appLogger.w('Camera permission refused', error: error.code);
      return AppPermissionStatus.denied;
    } finally {
      await controller?.dispose();
    }
  }

  @override
  Future<AppPermissionStatus> notificationStatus() async {
    final enabled = switch (defaultTargetPlatform) {
      TargetPlatform.android => await _android?.areNotificationsEnabled(),
      TargetPlatform.iOS => (await _ios?.checkPermissions())?.isEnabled,
      _ => null,
    };
    return _fromBool(enabled);
  }

  @override
  Future<AppPermissionStatus> requestNotifications() async {
    final granted = switch (defaultTargetPlatform) {
      TargetPlatform.android =>
        await _android?.requestNotificationsPermission(),
      TargetPlatform.iOS => await _ios?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      ),
      _ => null,
    };
    return granted ?? false
        ? AppPermissionStatus.granted
        : AppPermissionStatus.denied;
  }

  AndroidFlutterLocalNotificationsPlugin? get _android => _notifications
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();

  IOSFlutterLocalNotificationsPlugin? get _ios => _notifications
      .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin
      >();

  AppPermissionStatus _fromBool(bool? enabled) => switch (enabled) {
    true => AppPermissionStatus.granted,
    false => AppPermissionStatus.denied,
    null => AppPermissionStatus.unknown,
  };
}
