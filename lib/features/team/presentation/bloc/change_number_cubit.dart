import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/utils/countdown.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/confirm_number_change.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/start_number_change.dart';

enum NumberStep { enter, verify, done }

class ChangeNumberState extends Equatable {
  const new({
    this.step = NumberStep.enter,
    this.phone = '',
    this.otp = '',
    this.busy = false,
    this.resendIn = 0,
    this.failure,
  });

  final NumberStep step;
  final String phone;
  final String otp;
  final bool busy;
  final int resendIn;
  final Failure? failure;

  bool get canSend => Validators.isValidPhone(phone) && !busy;
  bool get canVerify => Validators.isCompleteOtp(otp) && !busy;

  ChangeNumberState copyWith({
    NumberStep? step,
    String? phone,
    String? otp,
    bool? busy,
    int? resendIn,
    Failure? failure,
  }) => ChangeNumberState(
    step: step ?? this.step,
    phone: phone ?? this.phone,
    otp: otp ?? this.otp,
    busy: busy ?? this.busy,
    resendIn: resendIn ?? this.resendIn,
    failure: failure,
  );

  @override
  List<Object?> get props => [step, phone, otp, busy, resendIn, failure];
}

/// C12 new number → C13 OTP read out by the staff member.
@injectable
class ChangeNumberCubit extends Cubit<ChangeNumberState> {
  new(this._start, this._confirm) : super(const ChangeNumberState());

  final StartNumberChange _start;
  final ConfirmNumberChange _confirm;
  final Countdown _countdown = Countdown();

  void phoneChanged(String v) => emit(state.copyWith(phone: v));

  void otpChanged(String v) => emit(state.copyWith(otp: v));

  Future<void> sendOtp(String memberId) async {
    if (!state.canSend) return;
    emit(state.copyWith(busy: true));
    final result = await _start(memberId, state.phone);
    if (isClosed) return;
    result.match((f) => emit(state.copyWith(busy: false, failure: f)), (
      ticket,
    ) {
      emit(state.copyWith(busy: false, step: NumberStep.verify, otp: ''));
      _countdown.start(
        ticket.resendAfterSeconds,
        (left) => emit(state.copyWith(resendIn: left, failure: state.failure)),
      );
    });
  }

  Future<void> verify(String memberId) async {
    if (!state.canVerify) return;
    emit(state.copyWith(busy: true));
    final result = await _confirm(memberId, state.phone, state.otp);
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(busy: false, failure: f),
        (_) => state.copyWith(busy: false, step: NumberStep.done),
      ),
    );
  }

  @override
  Future<void> close() async {
    _countdown.cancel();
    await super.close();
  }
}
