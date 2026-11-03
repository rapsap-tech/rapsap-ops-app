import 'dart:typed_data';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/get_unsent_proof_owner.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/send_otp.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/login_cubit.dart';
import 'package:rapsap_ops_app/features/uploads/domain/entities/pending_upload.dart';
import 'package:rapsap_ops_app/features/uploads/domain/repositories/upload_outbox_repository.dart';

import '../../helpers/fixtures.dart';
import '../../helpers/test_outbox.dart';

class _MockSendOtp extends Mock implements SendOtp;

class _MockAuth extends Mock implements AuthRepository;

class _MockUnsent extends Mock implements GetUnsentProofOwner;

void main() {
  late _MockSendOtp sendOtp;
  late _MockUnsent noUnsent;
  const phone = '9876543210';

  setUp(() {
    sendOtp = _MockSendOtp();
    noUnsent = _MockUnsent();
    when(noUnsent.call).thenReturn(null);
  });

  test('cannot submit an invalid number', () {
    final cubit = LoginCubit(sendOtp, noUnsent)..phoneChanged('5876543210');
    expect(cubit.state.canSubmit, isFalse);
  });

  blocTest<LoginCubit, LoginState>(
    'loading then success with the ticket',
    setUp: () =>
        when(() => sendOtp(phone))
            .thenAnswer((_) async => const Right(testTicket)),
    build: () => LoginCubit(sendOtp, noUnsent),
    act: (c) {
      c.phoneChanged(phone);
      return c.submit();
    },
    skip: 1,
    expect: () => [
      const LoginState(phone: phone, status: LoginStatus.loading),
      const LoginState(
        phone: phone,
        status: LoginStatus.success,
        ticket: testTicket,
      ),
    ],
  );

  blocTest<LoginCubit, LoginState>(
    'no login → failure (A3), button re-enables',
    setUp: () =>
        when(() => sendOtp(phone))
            .thenAnswer((_) async => const Left(NotFoundFailure())),
    build: () => LoginCubit(sendOtp, noUnsent),
    act: (c) {
      c.phoneChanged(phone);
      return c.submit();
    },
    skip: 2,
    expect: () => [
      const LoginState(
        phone: phone,
        status: LoginStatus.failure,
        failure: NotFoundFailure(),
      ),
    ],
    verify: (c) => expect(c.state.canSubmit, isTrue),
  );

  group('unsent proof from the last user', () {
    const priya = User(
      id: 'u1',
      name: 'Priya',
      role: UserRole.staff,
      jobRoles: [],
      storeName: 'S',
      consentAccepted: true,
    );
    late _MockAuth auth;
    late UploadOutboxRepository outbox;

    setUp(() async {
      auth = _MockAuth();
      outbox = await openTestOutbox();
    });

    test('names the owner and the count', () async {
      when(auth.lastSignedInUser).thenReturn(priya);
      final media = MediaFile.photo(Uint8List.fromList([1]));
      for (final id in ['a', 'b']) {
        await outbox.add(
          PendingUpload(
            id: id,
            kind: UploadKind.taskProof,
            targetId: 't1',
            taskNumber: 1,
            taskTitle: 'T',
            isVideo: false,
            captureToken: 'c',
            remarks: '',
            savedAt: DateTime(2026),
          ),
          media,
        );
      }

      final cubit = LoginCubit(sendOtp, GetUnsentProofOwner(auth, outbox));

      expect(cubit.unsentProof, (name: 'Priya', count: 2));
    });

    test('says nothing when no proof is waiting', () {
      when(auth.lastSignedInUser).thenReturn(priya);
      final cubit = LoginCubit(sendOtp, GetUnsentProofOwner(auth, outbox));
      expect(cubit.unsentProof, isNull);
    });
  });
}
