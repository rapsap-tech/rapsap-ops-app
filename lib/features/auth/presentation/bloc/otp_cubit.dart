import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/utils/countdown.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/send_otp.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/verify_otp.dart';

enum OtpStatus { idle, verifying, resending, success, failure, locked }

class OtpState extends Equatable {
  const new({
    this.otp = '',
    this.status = OtpStatus.idle,
    this.resendIn = 0,
    this.failure,
    this.user,
  });

  final String otp;
  final OtpStatus status;
  final int resendIn;
  final Failure? failure;
  final User? user;

  bool get isBusy =>
      status == OtpStatus.verifying || status == OtpStatus.resending;
  bool get canVerify =>
      Validators.isCompleteOtp(otp) && !isBusy && status != OtpStatus.locked;
  bool get canResend => resendIn == 0 && !isBusy && status != OtpStatus.locked;

  OtpState copyWith({
    String? otp,
    OtpStatus? status,
    int? resendIn,
    Failure? failure,
    User? user,
  }) => OtpState(
    otp: otp ?? this.otp,
    status: status ?? this.status,
    resendIn: resendIn ?? this.resendIn,
    failure: failure,
    user: user,
  );

  @override
  List<Object?> get props => [otp, status, resendIn, failure, user];
}

@injectable
class OtpCubit extends Cubit<OtpState> {
  new(this._verifyOtp, this._sendOtp) : super(const OtpState());

  final VerifyOtp _verifyOtp;
  final SendOtp _sendOtp;
  late String _phone;
  final Countdown _countdown = Countdown();

  void start(String phone, int resendAfterSeconds) {
    _phone = phone;
    _startCountdown(resendAfterSeconds);
  }

  void otpChanged(String otp) {
    if (state.status == OtpStatus.locked) return;
    emit(state.copyWith(otp: otp, status: OtpStatus.idle));
  }

  Future<void> verify() async {
    if (!state.canVerify) return;
    emit(state.copyWith(status: OtpStatus.verifying));
    final result = await _verifyOtp(_phone, state.otp);
    if (isClosed) return;
    result.match(
      (failure) => emit(
        state.copyWith(
          status: failure is OtpLockedFailure
              ? OtpStatus.locked
              : OtpStatus.failure,
          failure: failure,
        ),
      ),
      (user) => emit(state.copyWith(status: OtpStatus.success, user: user)),
    );
  }

  Future<void> resend() async {
    if (!state.canResend) return;
    emit(state.copyWith(status: OtpStatus.resending, otp: ''));
    final result = await _sendOtp(_phone);
    if (isClosed) return;
    result.match(
      (failure) =>
          emit(state.copyWith(status: OtpStatus.failure, failure: failure)),
      (ticket) {
        emit(state.copyWith(status: OtpStatus.idle));
        _startCountdown(ticket.resendAfterSeconds);
      },
    );
  }

  void _startCountdown(int seconds) => _countdown.start(
    seconds,
    (left) => emit(
      state.copyWith(resendIn: left, failure: state.failure, user: state.user),
    ),
  );

  @override
  Future<void> close() async {
    _countdown.cancel();
    await super.close();
  }
}
