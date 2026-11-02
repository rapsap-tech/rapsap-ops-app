import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/team/domain/repositories/team_repository.dart';

/// Deactivate signs the person out everywhere; history stays (C14, X8).
@injectable
class SetMemberActive {
  const new(this._repository);

  final TeamRepository _repository;

  Future<Either<Failure, Unit>> call(String id, {required bool active}) =>
      _repository.setActive(id, active: active);
}
