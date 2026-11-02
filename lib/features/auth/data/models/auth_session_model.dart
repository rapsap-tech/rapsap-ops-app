import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/auth/data/models/user_model.dart';

part 'auth_session_model.freezed.dart';
part 'auth_session_model.g.dart';

/// verify-OTP response: tokens plus the signed-in user.
@freezed
abstract class AuthSessionModel with _$AuthSessionModel {
  const factory({
    required String accessToken,
    required String refreshToken,
    required UserModel user,
  }) = _AuthSessionModel;

  factory fromJson(Map<String, dynamic> json) =>
      _$AuthSessionModelFromJson(json);
}
