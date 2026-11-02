import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class VerifyOtp {
  const new(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, User>> call(String phone, String otp) =>
      _repository.verifyOtp(phone, otp);
}
