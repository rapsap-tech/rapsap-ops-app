import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/settings/domain/entities/notification_prefs.dart';
import 'package:rapsap_ops_app/features/settings/domain/repositories/settings_repository.dart';

@injectable
class SaveNotificationPrefs {
  const new(this._repository);

  final SettingsRepository _repository;

  Future<Either<Failure, NotificationPrefs>> call(NotificationPrefs prefs) =>
      _repository.saveNotificationPrefs(prefs);
}
