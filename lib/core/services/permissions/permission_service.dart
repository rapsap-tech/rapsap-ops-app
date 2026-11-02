import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/services/permissions/permission_service_stub.dart'
    if (dart.library.js_interop) 'package:rapsap_ops_app/core/services/permissions/permission_service_web.dart'
    if (dart.library.io) 'package:rapsap_ops_app/core/services/permissions/permission_service_mobile.dart';

enum AppPermissionStatus { unknown, granted, denied }

/// Camera and notification permissions, with web and mobile implementations.
@lazySingleton
abstract class PermissionService {
  @factoryMethod
  static PermissionService create() => createPermissionService();

  Future<AppPermissionStatus> cameraStatus();
  Future<AppPermissionStatus> requestCamera();
  Future<AppPermissionStatus> notificationStatus();
  Future<AppPermissionStatus> requestNotifications();
}
