import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';
import 'package:rapsap_ops_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rapsap_ops_app/features/auth/data/models/auth_session_model.dart';
import 'package:rapsap_ops_app/features/auth/data/models/user_model.dart';
import 'package:rapsap_ops_app/features/auth/data/repositories/auth_repository_impl.dart';

class _MockRemote extends Mock implements AuthRemoteDataSource;

class _MockStorage extends Mock implements SecureStorageService;

void main() {
  late _MockRemote remote;
  late _MockStorage storage;
  late AuthRepositoryImpl repository;
  const user = UserModel(
    id: 'u1',
    name: 'Priya',
    role: 'staff',
    storeName: 'S',
  );

  setUp(() {
    remote = _MockRemote();
    storage = _MockStorage();
    repository = AuthRepositoryImpl(remote, storage);
  });

  test('verify saves tokens and returns the user', () async {
    when(() => remote.verifyOtp('p', '123456')).thenAnswer(
      (_) async => const AuthSessionModel(
        accessToken: 'a',
        refreshToken: 'r',
        user: user,
      ),
    );
    when(() => storage.saveTokens(accessToken: 'a', refreshToken: 'r'))
        .thenAnswer((_) async {});
    final result = await repository.verifyOtp('p', '123456');
    expect(result, Right<Failure, dynamic>(user.toEntity()));
    verify(() => storage.saveTokens(accessToken: 'a', refreshToken: 'r'))
        .called(1);
  });

  test('wrong OTP maps to InvalidOtpFailure and saves nothing', () async {
    when(() => remote.verifyOtp('p', '000000'))
        .thenThrow(const InvalidOtpException(2));
    final result = await repository.verifyOtp('p', '000000');
    expect(result, const Left<Failure, dynamic>(InvalidOtpFailure(2)));
    verifyNever(
      () => storage.saveTokens(
        accessToken: any(named: 'accessToken'),
        refreshToken: any(named: 'refreshToken'),
      ),
    );
  });

  test('no stored token means no session, without a network call', () async {
    when(() => storage.accessToken).thenAnswer((_) async => null);
    expect(await repository.currentUser(), const Right<Failure, dynamic>(null));
    verifyNever(remote.me);
  });
}
