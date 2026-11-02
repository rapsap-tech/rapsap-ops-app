import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/notifications/domain/entities/app_notification.dart';

abstract class NotificationRepository {
  Future<Either<Failure, List<AppNotification>>> notifications();
  Future<Either<Failure, Unit>> markRead(String id);
  Future<Either<Failure, Unit>> markAllRead();
}
