import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/network/network_info.dart';

enum ConnectivityStatus { unknown, online, offline }

/// App-wide online/offline state, debounced so brief drops don't flicker the UI.
@injectable
class ConnectivityCubit extends Cubit<ConnectivityStatus> {
  new(this._networkInfo) : super(ConnectivityStatus.unknown) {
    _subscription = _networkInfo.onStatusChange.listen(_onChange);
    unawaited(_networkInfo.isConnected.then(_set));
  }

  final NetworkInfo _networkInfo;
  late final StreamSubscription<bool> _subscription;
  Timer? _debounce;

  void _onChange(bool connected) {
    _debounce?.cancel();
    _debounce = Timer(AppConstants.connectivityDebounce, () => _set(connected));
  }

  void _set(bool connected) {
    if (isClosed) return;
    emit(connected ? ConnectivityStatus.online : ConnectivityStatus.offline);
  }

  @override
  Future<void> close() async {
    _debounce?.cancel();
    await _subscription.cancel();
    await super.close();
  }
}
