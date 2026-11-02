import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';
import 'package:rapsap_ops_app/features/team/domain/repositories/team_repository.dart';

@injectable
class CreateLogin {
  const new(this._repository);

  final TeamRepository _repository;

  Future<Either<Failure, CreateLoginResult>> call(NewLogin login) =>
      _repository.createLogin(login);
}
