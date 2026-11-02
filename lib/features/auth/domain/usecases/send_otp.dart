import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';
import 'package:rapsap_ops_app/features/auth/domain/repositories/auth_repository.dart';

@injectable
class SendOtp {
  const new(this._repository);

  final AuthRepository _repository;

  Future<Either<Failure, OtpTicket>> call(String phone) =>
      _repository.sendOtp(phone);
}
