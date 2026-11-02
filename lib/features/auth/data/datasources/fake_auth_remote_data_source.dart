import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';
import 'package:rapsap_ops_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rapsap_ops_app/features/auth/data/models/auth_session_model.dart';
import 'package:rapsap_ops_app/features/auth/data/models/otp_ticket_model.dart';
import 'package:rapsap_ops_app/features/auth/data/models/user_model.dart';

/// Stand-in until the auth API exists (docs/api_pending.md lists the rules):
/// numbers starting with 91 have no login, 99 signs in as the store manager;
/// OTP 000000 is always wrong.
@fakeApi
@LazySingleton(as: AuthRemoteDataSource)
class FakeAuthRemoteDataSource implements AuthRemoteDataSource {
  new(this._storage);

  /// The fake token remembers the role, so a reload keeps the same user.
  final SecureStorageService _storage;
  static const String _managerToken = 'fake-access-sm';
  static const String _staffToken = 'fake-access-staff';

  static const Duration _latency = Duration(milliseconds: 600);
  static const String _noLoginPrefix = '91';
  static const String _managerPrefix = '99';
  static const String _wrongOtp = '000000';

  int _wrongTries = 0;
  bool _consentAccepted = false;
  bool _manager = false;

  UserModel get _user => _manager
      ? UserModel(
          id: 'u-2001',
          name: 'Rahul Shinde',
          role: 'store_manager',
          storeName: 'Walk Hiranandani',
          jobRoles: const ['Store Manager'],
          consentAccepted: _consentAccepted,
        )
      : UserModel(
          id: 'u-1024',
          name: 'Priya',
          role: 'staff',
          storeName: 'Walk Hiranandani',
          jobRoles: const ['Housekeeping'],
          consentAccepted: _consentAccepted,
        );

  @override
  Future<OtpTicketModel> sendOtp(String phone) async {
    await Future<void>.delayed(_latency);
    if (phone.startsWith(_noLoginPrefix)) throw const NotFoundException();
    _manager = phone.startsWith(_managerPrefix);
    return const OtpTicketModel();
  }

  @override
  Future<AuthSessionModel> verifyOtp(String phone, String otp) async {
    await Future<void>.delayed(_latency);
    if (_wrongTries >= AppConstants.otpMaxWrongTries) {
      throw const OtpLockedException(AppConstants.otpLockMinutes);
    }
    if (otp == _wrongOtp) {
      _wrongTries++;
      final left = AppConstants.otpMaxWrongTries - _wrongTries;
      if (left == 0) {
        throw const OtpLockedException(AppConstants.otpLockMinutes);
      }
      throw InvalidOtpException(left);
    }
    _wrongTries = 0;
    return AuthSessionModel(
      accessToken: _manager ? _managerToken : _staffToken,
      refreshToken: 'fake-refresh',
      user: _user,
    );
  }

  @override
  Future<UserModel> me() async {
    await Future<void>.delayed(_latency);
    final token = await _storage.accessToken;
    _manager = token == _managerToken;
    // A stored token means first sign-in was finished earlier.
    _consentAccepted = _consentAccepted || token != null;
    return _user;
  }

  @override
  Future<void> acceptConsent() async {
    await Future<void>.delayed(_latency);
    _consentAccepted = true;
  }

  @override
  Future<void> logout({required bool allDevices}) async {
    await Future<void>.delayed(_latency);
    _consentAccepted = false;
  }
}
