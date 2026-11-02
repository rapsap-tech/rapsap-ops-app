import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/profile/domain/entities/profile.dart';
import 'package:rapsap_ops_app/features/profile/domain/repositories/profile_repository.dart';

@injectable
class GetProfile {
  const new(this._repository);

  final ProfileRepository _repository;

  Future<Either<Failure, Profile>> call() => _repository.profile();
}
