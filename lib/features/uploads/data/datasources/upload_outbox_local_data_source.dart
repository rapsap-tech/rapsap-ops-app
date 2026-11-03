import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/storage_keys.dart';
import 'package:rapsap_ops_app/core/services/storage/local_db.dart';
import 'package:rapsap_ops_app/features/uploads/data/models/pending_upload_model.dart';

@lazySingleton
class UploadOutboxLocalDataSource {
  new(this._db);

  final LocalDb _db;

  static String _key(String id) => '${StorageKeys.uploadPrefix}$id';

  /// Oldest first.
  List<PendingUploadModel> all() =>
      _db
          .readAll(StorageKeys.uploadPrefix)
          .whereType<Map<dynamic, dynamic>>()
          .map((json) => PendingUploadModel.fromJson(_stringKeys(json)))
          .toList()
        ..sort((a, b) => a.savedAt.compareTo(b.savedAt));

  PendingUploadModel? find(String id) {
    final json = _db.read(_key(id));
    if (json is! Map) return null;
    return PendingUploadModel.fromJson(_stringKeys(json));
  }

  Stream<void> changes() => _db.changes(StorageKeys.uploadPrefix);

  /// Media first, so a saved record always has its media.
  Future<void> add(PendingUploadModel upload, Uint8List media) async {
    await _db.writeBlob(_key(upload.id), media);
    await save(upload);
  }

  Future<void> save(PendingUploadModel upload) =>
      _db.write(_key(upload.id), upload.toJson());

  Future<Uint8List?> media(String id) => _db.readBlob(_key(id));

  Future<void> remove(String id) async {
    await _db.delete(_key(id));
    await _db.deleteBlob(_key(id));
  }

  static Map<String, dynamic> _stringKeys(Map<dynamic, dynamic> json) =>
      Map<String, dynamic>.from(json);
}
