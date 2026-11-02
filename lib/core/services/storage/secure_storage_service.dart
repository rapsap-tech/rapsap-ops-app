import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/storage_keys.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';

/// Token store. On web this is browser storage, so keep access tokens
/// short-lived.
@lazySingleton
class SecureStorageService {
  new(this._storage);

  final FlutterSecureStorage _storage;

  Future<String?> get accessToken => _read(StorageKeys.accessToken);
  Future<String?> get refreshToken => _read(StorageKeys.refreshToken);

  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) => _guard(() async {
    await _storage.write(key: StorageKeys.accessToken, value: accessToken);
    await _storage.write(key: StorageKeys.refreshToken, value: refreshToken);
  });

  Future<void> clear() => _guard(() async {
    await _storage.delete(key: StorageKeys.accessToken);
    await _storage.delete(key: StorageKeys.refreshToken);
  });

  Future<String?> _read(String key) => _guard(() => _storage.read(key: key));

  Future<T> _guard<T>(Future<T> Function() call) async {
    try {
      return await call();
    } on Object catch (error, stackTrace) {
      appLogger.e(
        'Secure storage failed',
        error: error,
        stackTrace: stackTrace,
      );
      throw const StorageException();
    }
  }
}
