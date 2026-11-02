import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class LogOut {
  const new(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, Unit>> call({bool allDevices = false}) =>
      _repository.logout(allDevices: allDevices);
}
