import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/send_otp.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/login_cubit.dart';

import '../../helpers/fixtures.dart';

class _MockSendOtp extends Mock implements SendOtp;

void main() {
  late _MockSendOtp sendOtp;
  const phone = '9876543210';

  setUp(() => sendOtp = _MockSendOtp());

  test('cannot submit an invalid number', () {
    final cubit = LoginCubit(sendOtp)..phoneChanged('5876543210');
    expect(cubit.state.canSubmit, isFalse);
  });

  blocTest<LoginCubit, LoginState>(
    'loading then success with the ticket',
    setUp: () =>
        when(() => sendOtp(phone))
            .thenAnswer((_) async => const Right(testTicket)),
    build: () => LoginCubit(sendOtp),
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
    build: () => LoginCubit(sendOtp),
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
}
