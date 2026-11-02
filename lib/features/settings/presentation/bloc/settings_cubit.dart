import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/features/settings/domain/entities/notification_prefs.dart';
import 'package:rapsap_ops_app/features/settings/domain/usecases/get_notification_prefs.dart';
import 'package:rapsap_ops_app/features/settings/domain/usecases/save_notification_prefs.dart';

/// Notification switches: flips at once, reverts if the save fails.
@injectable
class SettingsCubit extends LoadCubit<NotificationPrefs> {
  new(GetNotificationPrefs get, this._save) : super(get.call);

  final SaveNotificationPrefs _save;

  Future<void> update(NotificationPrefs prefs) async {
    final previous = state.data;
    if (previous == null || prefs == previous) return;
    replace(prefs);
    final result = await _save(prefs);
    if (isClosed) return;
    result.match(
      (failure) => emit(
        LoadState(status: LoadStatus.failure, data: previous, failure: failure),
      ),
      replace,
    );
  }
}
