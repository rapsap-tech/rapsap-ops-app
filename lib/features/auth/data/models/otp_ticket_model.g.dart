// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_ticket_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OtpTicketModel _$OtpTicketModelFromJson(Map<String, dynamic> json) =>
    _OtpTicketModel(
      resendAfterSeconds:
          (json['resend_after_seconds'] as num?)?.toInt() ??
          AppConstants.otpResendSeconds,
      validMinutes:
          (json['valid_minutes'] as num?)?.toInt() ??
          AppConstants.otpValidMinutes,
    );

Map<String, dynamic> _$OtpTicketModelToJson(_OtpTicketModel instance) =>
    <String, dynamic>{
      'resend_after_seconds': instance.resendAfterSeconds,
      'valid_minutes': instance.validMinutes,
    };
