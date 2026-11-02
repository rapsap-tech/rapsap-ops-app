import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/otp_ticket.dart';

part 'otp_ticket_model.freezed.dart';
part 'otp_ticket_model.g.dart';

@freezed
abstract class OtpTicketModel with _$OtpTicketModel {
  const factory({
    @Default(AppConstants.otpResendSeconds) int resendAfterSeconds,
    @Default(AppConstants.otpValidMinutes) int validMinutes,
  }) = _OtpTicketModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) => _$OtpTicketModelFromJson(json);

  OtpTicket toEntity() => OtpTicket(
    resendAfterSeconds: resendAfterSeconds,
    validMinutes: validMinutes,
  );
}
