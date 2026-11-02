import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/get_team.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/resend_invite.dart';

/// C7 · My team.
@injectable
class TeamCubit extends LoadCubit<List<TeamMember>> {
  new(GetTeam get) : super(get.call);
}

/// Status filter on My team (null = all).
@injectable
class TeamFilterCubit extends Cubit<MemberStatus?> {
  new() : super(null);

  void select(MemberStatus? status) => emit(status);
}

enum InviteStatus { idle, sending, sent, failure }

class InviteState extends Equatable {
  const new({this.status = InviteStatus.idle, this.failure});

  final InviteStatus status;
  final Failure? failure;

  @override
  List<Object?> get props => [status, failure];
}

/// "Resend SMS" on one invited member.
@injectable
class InviteCubit extends Cubit<InviteState> {
  new(this._resend) : super(const InviteState());

  final ResendInvite _resend;

  Future<void> resend(String memberId) async {
    if (state.status == InviteStatus.sending) return;
    emit(const InviteState(status: InviteStatus.sending));
    final result = await _resend(memberId);
    if (isClosed) return;
    emit(
      result.match(
        (f) => InviteState(status: InviteStatus.failure, failure: f),
        (_) => const InviteState(status: InviteStatus.sent),
      ),
    );
  }
}
