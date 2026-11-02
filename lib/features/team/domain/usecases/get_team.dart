import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';
import 'package:rapsap_ops_app/features/team/domain/repositories/team_repository.dart';

@injectable
class GetTeam {
  const new(this._repository);

  final TeamRepository _repository;

  Future<Either<Failure, List<TeamMember>>> call() => _repository.team();
}
