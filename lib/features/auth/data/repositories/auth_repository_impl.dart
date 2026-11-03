import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/storage_keys.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/network/network_events.dart';
import 'package:rapsap_ops_app/core/services/storage/local_db.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rapsap_ops_app/features/auth/data/models/user_model.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/auth/domain/repositories/auth_repository.dart';

@LazySingleton(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  const new(this._remote, this._storage, this._localDb, this._events);

  final AuthRemoteDataSource _remote;
  final SecureStorageService _storage;
  final LocalDb _localDb;
  final NetworkEvents _events;

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
        return await _remember(session.user);
      });

  @override
  Future<Either<Failure, User?>> currentUser() => guardFailure(() async {
    final generation = _storage.generation;
    if (await _storage.accessToken == null) return null;
    try {
      final user = await _remote.me();
      // Signed out while the request was running.
      if (_storage.generation != generation) return null;
      return await _remember(user);
    } on Object catch (error) {
      final cached = _cachedUser();
      if (cached == null || !_isOffline(error)) rethrow;
      return cached;
    }
  });

  Future<User> _remember(UserModel user) async {
    await _localDb.claimFor(user.id);
    await _localDb.write(StorageKeys.cachedUser, user.toJson());
    return user.toEntity();
  }

  @override
  User? lastSignedInUser() {
    try {
      return _cachedUser();
    } on Object catch (error, stackTrace) {
      appLogger.e(
        'Cached user unreadable',
        error: error,
        stackTrace: stackTrace,
      );
      return null;
    }
  }

  User? _cachedUser() {
    final json = _localDb.read(StorageKeys.cachedUser);
    if (json is! Map) return null;
    return UserModel.fromJson(Map<String, dynamic>.from(json)).toEntity();
  }

  bool _isOffline(Object error) => switch (ErrorMapper.toException(error)) {
    NoInternetException() || RequestTimeoutException() => true,
    _ => false,
  };

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
        try {
          await _storage.clear();
        } finally {
          await _localDb.clear();
          _events.emit(NetworkEvent.signedOut);
        }
        return unit;
      });
}
