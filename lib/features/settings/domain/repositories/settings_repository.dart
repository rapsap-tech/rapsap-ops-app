import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/settings/domain/entities/notification_prefs.dart';

abstract class SettingsRepository {
  Future<Either<Failure, NotificationPrefs>> notificationPrefs();
  Future<Either<Failure, NotificationPrefs>> saveNotificationPrefs(
    NotificationPrefs prefs,
  );
}
