import 'dart:typed_data';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/constants/storage_keys.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/services/media/video_preview.dart';
import 'package:rapsap_ops_app/core/services/storage/storage_persistence.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';

/// On-device data that must survive restarts and no internet: cached API
/// data and proof waiting to upload. IndexedDB on web, files on mobile.
/// Holds one user's data at a time. Large media goes in a lazy box so it is
/// read from disk only when needed, not kept in memory.
class LocalDb {
  new(this._box, this._blobs);

  final Box<Object> _box;
  final LazyBox<Uint8List> _blobs;

  static Future<LocalDb> open() async {
    await Hive.initFlutter();
    await requestPersistentStorage();
    return LocalDb(
      await Hive.openBox<Object>(AppConstants.localDbName),
      await Hive.openLazyBox<Uint8List>(AppConstants.localDbBlobsName),
    );
  }

  Object? read(String key) => _box.get(key);

  /// Values whose keys start with [prefix].
  List<Object> readAll(String prefix) => [
    for (final key in _box.keys)
      if (key is String && key.startsWith(prefix)) ?_box.get(key),
  ];

  /// Fires when a value whose key starts with [prefix] changes.
  Stream<void> changes(String prefix) => _box.watch().where(
    (event) => event.key is String && (event.key as String).startsWith(prefix),
  );

  Future<Uint8List?> readBlob(String key) async {
    try {
      return await _blobs.get(key);
    } on Object catch (error, stackTrace) {
      appLogger.e('Local db failed', error: error, stackTrace: stackTrace);
      throw const StorageException();
    }
  }

  Future<void> writeBlob(String key, Uint8List bytes) =>
      _guard(() => _blobs.put(key, bytes));

  Future<void> deleteBlob(String key) => _guard(() => _blobs.delete(key));

  Future<void> write(String key, Object value) =>
      _guard(() => _box.put(key, value));

  Future<void> delete(String key) => _guard(() => _box.delete(key));

  Future<void> clear() => _guard(() async {
    await _box.clear();
    await _blobs.clear();
    await clearSavedVideos();
  });

  /// Wipes another user's data before [userId] starts using the device.
  Future<void> claimFor(String userId) => _guard(() async {
    if (_box.get(StorageKeys.localDbOwner) == userId) return;
    await _box.clear();
    await _blobs.clear();
    await clearSavedVideos();
    await _box.put(StorageKeys.localDbOwner, userId);
  });

  Future<void> _guard(Future<void> Function() call) async {
    try {
      await call();
    } on Object catch (error, stackTrace) {
      appLogger.e('Local db failed', error: error, stackTrace: stackTrace);
      throw const StorageException();
    }
  }
}
