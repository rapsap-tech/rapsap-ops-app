import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/notifications/domain/repositories/notification_repository.dart';

@injectable
class MarkNotificationRead {
  const new(this._repository);

  final NotificationRepository _repository;

  Future<Either<Failure, Unit>> call(String id) => _repository.markRead(id);
}
