import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/network/network_events.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/get_current_user.dart';

enum SessionStatus { unknown, unauthenticated, authenticated }

class SessionState extends Equatable {
  const new({this.status = SessionStatus.unknown, this.user});

  final SessionStatus status;
  final User? user;

  @override
  List<Object?> get props => [status, user];
}

/// Who is signed in. Drives the router's redirects.
@lazySingleton
class SessionCubit extends Cubit<SessionState> {
  new(this._getCurrentUser, NetworkEvents events)
    : super(const SessionState()) {
    _subscription = events.stream
        .where((e) => e == NetworkEvent.sessionExpired)
        .listen((_) => signedOut());
  }

  final GetCurrentUser _getCurrentUser;
  late final StreamSubscription<NetworkEvent> _subscription;

  Future<void> restore() async {
    final result = await _getCurrentUser();
    if (isClosed) return;
    result.match(
      // Can't reach the server: send to login rather than hang on splash.
      (_) => signedOut(),
      (user) => user == null ? signedOut() : signedIn(user),
    );
  }

  void signedIn(User user) =>
      emit(SessionState(status: SessionStatus.authenticated, user: user));

  void signedOut() =>
      emit(const SessionState(status: SessionStatus.unauthenticated));

  @override
  Future<void> close() async {
    await _subscription.cancel();
    await super.close();
  }
}
