import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/utils/validators.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/send_otp.dart';

enum LoginStatus { idle, loading, success, failure }

class LoginState extends Equatable {
  const new({
    this.phone = '',
    this.status = LoginStatus.idle,
    this.failure,
    this.ticket,
  });

  final String phone;
  final LoginStatus status;
  final Failure? failure;
  final OtpTicket? ticket;

  bool get canSubmit =>
      Validators.isValidPhone(phone) && status != LoginStatus.loading;

  @override
  List<Object?> get props => [phone, status, failure, ticket];
}

@injectable
class LoginCubit extends Cubit<LoginState> {
  new(this._sendOtp) : super(const LoginState());

  final SendOtp _sendOtp;

  void phoneChanged(String phone) => emit(LoginState(phone: phone));

  Future<void> submit() async {
    if (!state.canSubmit) return;
    final phone = state.phone;
    emit(LoginState(phone: phone, status: LoginStatus.loading));
    final result = await _sendOtp(phone);
    if (isClosed) return;
    emit(
      result.match(
        (failure) => LoginState(
          phone: phone,
          status: LoginStatus.failure,
          failure: failure,
        ),
        (ticket) => LoginState(
          phone: phone,
          status: LoginStatus.success,
          ticket: ticket,
        ),
      ),
    );
  }
}
