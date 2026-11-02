import 'package:equatable/equatable.dart';

/// Result of sending an OTP: when it can be resent and how long it is valid.
class OtpTicket extends Equatable {
  const new({required this.resendAfterSeconds, required this.validMinutes});

  final int resendAfterSeconds;
  final int validMinutes;

  @override
  List<Object?> get props => [resendAfterSeconds, validMinutes];
}
