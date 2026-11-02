import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/services/install/install_service.dart';

class InstallState extends Equatable {
  const new({required this.mode, this.prompting = false});

  final InstallMode mode;
  final bool prompting;

  @override
  List<Object?> get props => [mode, prompting];
}

@injectable
class InstallCubit extends Cubit<InstallState> {
  new(this._install) : super(InstallState(mode: _install.mode)) {
    _subscription = _install.modeChanges.listen(_onModeChanged);
  }

  final InstallService _install;
  late final StreamSubscription<InstallMode> _subscription;

  Future<void> install() async {
    if (state.prompting) return;
    emit(InstallState(mode: state.mode, prompting: true));
    await _install.prompt();
    if (isClosed) return;
    emit(InstallState(mode: _install.mode));
  }

  void _onModeChanged(InstallMode mode) =>
      emit(InstallState(mode: mode, prompting: state.prompting));

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }
}
