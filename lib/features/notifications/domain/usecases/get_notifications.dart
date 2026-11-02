import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/notifications/domain/entities/app_notification.dart';
import 'package:rapsap_ops_app/features/notifications/domain/repositories/notification_repository.dart';

@injectable
class GetNotifications {
  const new(this._repository);

  final NotificationRepository _repository;

  Future<Either<Failure, List<AppNotification>>> call() =>
      _repository.notifications();
}
