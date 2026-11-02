import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const new(this._remote, this._storage);

  final AuthRemoteDataSource _remote;
  final SecureStorageService _storage;

  @override
  Future<Either<Failure, OtpTicket>> sendOtp(String phone) =>
      guardFailure(() async => (await _remote.sendOtp(phone)).toEntity());

  @override
  Future<Either<Failure, User>> verifyOtp(String phone, String otp) =>
      guardFailure(() async {
        final session = await _remote.verifyOtp(phone, otp);
        await _storage.saveTokens(
          accessToken: session.accessToken,
          refreshToken: session.refreshToken,
        );
        return session.user.toEntity();
      });

  @override
  Future<Either<Failure, User?>> currentUser() => guardFailure(() async {
    if (await _storage.accessToken == null) return null;
    return (await _remote.me()).toEntity();
  });

  @override
  Future<Either<Failure, Unit>> acceptConsent() => guardFailure(() async {
    await _remote.acceptConsent();
    return unit;
  });

  @override
  Future<Either<Failure, Unit>> logout({required bool allDevices}) =>
      guardFailure(() async {
        try {
          await _remote.logout(allDevices: allDevices);
        } on Object catch (error) {
          // Other devices stay signed in unless the server confirms.
          if (allDevices) rethrow;
          appLogger.w('Server logout failed', error: error.runtimeType);
        }
        await _storage.clear();
        return unit;
      });
}
