import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/notifications/data/datasources/notification_remote_data_source.dart';
import 'package:rapsap_ops_app/features/notifications/domain/entities/app_notification.dart';
import 'package:rapsap_ops_app/features/notifications/domain/repositories/notification_repository.dart';

@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  const new(this._remote);

  final NotificationRemoteDataSource _remote;

  @override
  Future<Either<Failure, List<AppNotification>>> notifications() =>
      guardFailure(
        () async => [
          for (final n in await _remote.notifications()) n.toEntity(),
        ],
      );

  @override
  Future<Either<Failure, Unit>> markRead(String id) => guardFailure(() async {
    await _remote.markRead(id);
    return unit;
  });

  @override
  Future<Either<Failure, Unit>> markAllRead() => guardFailure(() async {
    await _remote.markAllRead();
    return unit;
  });
}
