import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/log_out.dart';

enum LogoutStatus { idle, loading, failure }

class LogoutState extends Equatable {
  const new({
    this.status = LogoutStatus.idle,
    this.allDevices = false,
    this.failure,
  });

  final LogoutStatus status;

  /// Which button is busy, so only that one shows a spinner.
  final bool allDevices;
  final Failure? failure;

  @override
  List<Object?> get props => [status, allDevices, failure];
}

/// Logs out and drops the session (the repository decides when tokens go).
@injectable
class LogoutCubit extends Cubit<LogoutState> {
  new(this._logOut, this._session) : super(const LogoutState());

  final LogOut _logOut;
  final SessionCubit _session;

  Future<void> logOut({bool allDevices = false}) async {
    if (state.status == LogoutStatus.loading) return;
    emit(LogoutState(status: LogoutStatus.loading, allDevices: allDevices));
    final result = await _logOut(allDevices: allDevices);
    // Sign out even if the drawer (and this cubit) closed meanwhile.
    result.match((failure) {
      if (!isClosed) {
        emit(LogoutState(status: LogoutStatus.failure, failure: failure));
      }
    }, (_) => _session.signedOut());
  }
}
