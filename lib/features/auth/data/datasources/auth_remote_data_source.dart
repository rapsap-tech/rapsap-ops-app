import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/features/auth/data/models/auth_session_model.dart';
import 'package:rapsap_ops_app/features/auth/data/models/otp_ticket_model.dart';
import 'package:rapsap_ops_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<OtpTicketModel> sendOtp(String phone);
  Future<AuthSessionModel> verifyOtp(String phone, String otp);
  Future<UserModel> me();
  Future<void> acceptConsent();
  Future<void> logout({required bool allDevices});
}

Map<String, dynamic> _json(Object? data) => data! as Map<String, dynamic>;

@realApi
@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  const new(this._client);

  final DioClient _client;

  @override
  Future<OtpTicketModel> sendOtp(String phone) => _client.post(
    ApiConstants.auth.sendOtp,
    data: {'phone': phone},
    fromData: (data) => OtpTicketModel.fromJson(_json(data)),
  );

  @override
  Future<AuthSessionModel> verifyOtp(String phone, String otp) => _client.post(
    ApiConstants.auth.verifyOtp,
    data: {'phone': phone, 'otp': otp},
    fromData: (data) => AuthSessionModel.fromJson(_json(data)),
  );

  @override
  Future<UserModel> me() => _client.get(
    ApiConstants.auth.me,
    fromData: (data) => UserModel.fromJson(_json(data)),
  );

  @override
  Future<void> acceptConsent() =>
      _client.post(ApiConstants.auth.consent, fromData: (_) {});

  @override
  Future<void> logout({required bool allDevices}) => _client.post(
    ApiConstants.auth.logout,
    data: {'all_devices': allDevices},
    fromData: (_) {},
  );
}
