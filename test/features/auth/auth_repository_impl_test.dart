import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/constants/storage_keys.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/network/network_events.dart';
import 'package:rapsap_ops_app/core/services/storage/local_db.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';
import 'package:rapsap_ops_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rapsap_ops_app/features/auth/data/models/auth_session_model.dart';
import 'package:rapsap_ops_app/features/auth/data/models/user_model.dart';
import 'package:rapsap_ops_app/features/auth/data/repositories/auth_repository_impl.dart';

import '../../helpers/test_local_db.dart';

class _MockRemote extends Mock implements AuthRemoteDataSource;

class _MockStorage extends Mock implements SecureStorageService;

void main() {
  late _MockRemote remote;
  late _MockStorage storage;
  late LocalDb localDb;
  late AuthRepositoryImpl repository;
  const user = UserModel(
    id: 'u1',
    name: 'Priya',
    role: 'staff',
    storeName: 'S',
  );

  setUp(() async {
    remote = _MockRemote();
    storage = _MockStorage();
    localDb = await openTestLocalDb();
    when(() => storage.generation).thenReturn(0);
    repository = AuthRepositoryImpl(remote, storage, localDb, NetworkEvents());
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
        .thenAnswer((_) async => true);
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

  group('offline restore', () {
    setUp(() {
      when(() => storage.accessToken).thenAnswer((_) async => 'a');
    });

    test('returns the last signed-in user when offline', () async {
      when(remote.me).thenAnswer((_) async => user);
      await repository.currentUser();
      when(remote.me).thenThrow(const NoInternetException());

      final result = await repository.currentUser();

      expect(result, Right<Failure, dynamic>(user.toEntity()));
    });

    test('fails offline when no user was saved', () async {
      when(remote.me).thenThrow(const NoInternetException());
      expect(
        await repository.currentUser(),
        const Left<Failure, dynamic>(NoInternetFailure()),
      );
    });

    test('a server rejection is not hidden by the saved user', () async {
      when(remote.me).thenAnswer((_) async => user);
      await repository.currentUser();
      when(remote.me).thenThrow(const UnauthorizedException());

      expect((await repository.currentUser()).isLeft(), isTrue);
    });
  });

  test('a sign-in check that finishes after logout keeps nothing', () async {
    var generation = 0;
    when(() => storage.generation).thenAnswer((_) => generation);
    when(() => storage.accessToken).thenAnswer((_) async => 'a');
    when(remote.me).thenAnswer((_) async {
      generation++;
      return user;
    });

    expect(await repository.currentUser(), const Right<Failure, dynamic>(null));
    expect(localDb.read(StorageKeys.cachedUser), isNull);
  });

  test('a different user signing in wipes the previous data', () async {
    await localDb.claimFor('someone-else');
    await localDb.write('proof', 'old');
    when(() => remote.verifyOtp('p', '123456')).thenAnswer(
      (_) async => const AuthSessionModel(
        accessToken: 'a',
        refreshToken: 'r',
        user: user,
      ),
    );
    when(() => storage.saveTokens(accessToken: 'a', refreshToken: 'r'))
        .thenAnswer((_) async => true);

    await repository.verifyOtp('p', '123456');

    expect(localDb.read('proof'), isNull);
    expect(localDb.read(StorageKeys.cachedUser), isNotNull);
  });

  test('logout clears saved data', () async {
    await localDb.write('proof', 'old');
    when(() => remote.logout(allDevices: false)).thenAnswer((_) async {});
    when(storage.clear).thenAnswer((_) async {});

    await repository.logout(allDevices: false);

    expect(localDb.read('proof'), isNull);
  });
}
