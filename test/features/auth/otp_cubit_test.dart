import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/send_otp.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/verify_otp.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/otp_cubit.dart';

import '../../helpers/fixtures.dart';

class _MockVerify extends Mock implements VerifyOtp;

class _MockSend extends Mock implements SendOtp;

void main() {
  late _MockVerify verify;
  late _MockSend send;
  late OtpCubit cubit;
  const phone = '9876543210';

  setUp(() {
    verify = _MockVerify();
    send = _MockSend();
    cubit = OtpCubit(verify, send)..start(phone, 2);
  });

  tearDown(() => cubit.close());

  test('wrong code keeps the attempts left for the message', () async {
    when(() => verify(phone, '111111'))
        .thenAnswer((_) async => const Left(InvalidOtpFailure(3)));
    cubit.otpChanged('111111');
    await cubit.verify();
    expect(cubit.state.status, OtpStatus.failure);
    expect(cubit.state.failure, const InvalidOtpFailure(3));
    expect(cubit.state.canVerify, isTrue);
  });

  test('locked number blocks further tries', () async {
    when(() => verify(phone, '111111'))
        .thenAnswer((_) async => const Left(OtpLockedFailure(15)));
    cubit.otpChanged('111111');
    await cubit.verify();
    expect(cubit.state.status, OtpStatus.locked);
    expect(cubit.state.canVerify, isFalse);
  });

  test('success carries the user', () async {
    when(() => verify(phone, '123456'))
        .thenAnswer((_) async => const Right(testUser));
    cubit.otpChanged('123456');
    await cubit.verify();
    expect(cubit.state.user, testUser);
  });

  test('resend unlocks after the countdown', () async {
    expect(cubit.state.canResend, isFalse);
    await Future<void>.delayed(const Duration(milliseconds: 2100));
    expect(cubit.state.resendIn, 0);
    expect(cubit.state.canResend, isTrue);
  });
}
