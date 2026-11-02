import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:rapsap_ops_app/features/settings/data/models/notification_prefs_model.dart';
import 'package:rapsap_ops_app/features/settings/domain/entities/notification_prefs.dart';
import 'package:rapsap_ops_app/features/settings/domain/repositories/settings_repository.dart';

@LazySingleton(as: SettingsRepository)
class SettingsRepositoryImpl implements SettingsRepository {
  const new(this._remote);

  final SettingsRemoteDataSource _remote;

  @override
  Future<Either<Failure, NotificationPrefs>> notificationPrefs() =>
      guardFailure(() async => (await _remote.notificationPrefs()).toEntity());

  @override
  Future<Either<Failure, NotificationPrefs>> saveNotificationPrefs(
    NotificationPrefs prefs,
  ) => guardFailure(
    () async =>
        (await _remote.save(NotificationPrefsModel.fromEntity(prefs)))
            .toEntity(),
  );
}
