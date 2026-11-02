import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';

abstract class TeamRepository {
  Future<Either<Failure, List<TeamMember>>> team();
  Future<Either<Failure, TeamMember>> member(String id);
  Future<Either<Failure, RoleCatalog>> catalog();
  Future<Either<Failure, CreateLoginResult>> createLogin(NewLogin login);
  Future<Either<Failure, Unit>> resendInvite(String id);
  Future<Either<Failure, Unit>> updateRoles(String id, Set<String> roleIds);
  Future<Either<Failure, OtpTicket>> startNumberChange(String id, String phone);
  Future<Either<Failure, Unit>> confirmNumberChange(
    String id,
    String phone,
    String otp,
  );
  Future<Either<Failure, Unit>> setActive(String id, {required bool active});
}
