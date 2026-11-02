import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, OtpTicket>> sendOtp(String phone);
  Future<Either<Failure, User>> verifyOtp(String phone, String otp);

  /// Null when there is no stored session.
  Future<Either<Failure, User?>> currentUser();
  Future<Either<Failure, Unit>> acceptConsent();

  /// Single-device logout always clears the local session; all-devices
  /// logout only does so once the server confirms.
  Future<Either<Failure, Unit>> logout({required bool allDevices});
}
