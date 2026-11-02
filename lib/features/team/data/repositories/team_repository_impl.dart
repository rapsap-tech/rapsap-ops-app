import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';
import 'package:rapsap_ops_app/features/team/data/datasources/team_remote_data_source.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';
import 'package:rapsap_ops_app/features/team/domain/repositories/team_repository.dart';

@LazySingleton(as: TeamRepository)
class TeamRepositoryImpl implements TeamRepository {
  const new(this._remote);

  final TeamRemoteDataSource _remote;

  Future<Either<Failure, Unit>> _run(Future<void> Function() call) =>
      guardFailure(() async {
        await call();
        return unit;
      });

  @override
  Future<Either<Failure, List<TeamMember>>> team() => guardFailure(
    () async => [for (final m in await _remote.team()) m.toEntity()],
  );

  @override
  Future<Either<Failure, TeamMember>> member(String id) =>
      guardFailure(() async => (await _remote.member(id)).toEntity());

  @override
  Future<Either<Failure, RoleCatalog>> catalog() =>
      guardFailure(() async => (await _remote.catalog()).toEntity());

  @override
  Future<Either<Failure, CreateLoginResult>> createLogin(NewLogin login) =>
      guardFailure(() async {
        final r = await _remote.create(
          phone: login.phone,
          name: login.name.trim(),
          roleIds: login.roleIds.toList(),
          extraTaskIds: login.extraTaskIds.toList(),
        );
        return CreateLoginResult(memberId: r.id, smsSent: r.smsSent);
      });

  @override
  Future<Either<Failure, Unit>> resendInvite(String id) =>
      _run(() => _remote.resendInvite(id));

  @override
  Future<Either<Failure, Unit>> updateRoles(String id, Set<String> roleIds) =>
      _run(() => _remote.updateRoles(id, roleIds.toList()));

  @override
  Future<Either<Failure, OtpTicket>> startNumberChange(
    String id,
    String phone,
  ) => guardFailure(
    () async => (await _remote.startNumberChange(id, phone)).toEntity(),
  );

  @override
  Future<Either<Failure, Unit>> confirmNumberChange(
    String id,
    String phone,
    String otp,
  ) => _run(() => _remote.confirmNumberChange(id, phone, otp));

  @override
  Future<Either<Failure, Unit>> setActive(String id, {required bool active}) =>
      _run(() => _remote.setActive(id, active: active));
}
