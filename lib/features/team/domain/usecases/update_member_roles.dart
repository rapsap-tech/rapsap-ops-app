import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/team/domain/repositories/team_repository.dart';

@injectable
class UpdateMemberRoles {
  const new(this._repository);

  final TeamRepository _repository;

  Future<Either<Failure, Unit>> call(String id, Set<String> roleIds) =>
      _repository.updateRoles(id, roleIds);
}
