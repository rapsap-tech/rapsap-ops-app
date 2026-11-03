import 'dart:io';
import 'dart:typed_data';

import 'package:hive_ce/hive_ce.dart';
import 'package:rapsap_ops_app/core/services/storage/local_db.dart';

/// A real [LocalDb] in a temp folder. Without [dir] each call starts empty;
/// passing the same [dir] after `Hive.close()` reopens it like an app restart.
Future<LocalDb> openTestLocalDb({Directory? dir}) async {
  final folder = dir ?? await Directory.systemTemp.createTemp('local_db_test');
  Hive.init(folder.path);
  final name = 'test_${folder.path.hashCode}';
  return LocalDb(
    await Hive.openBox<Object>(name),
    await Hive.openLazyBox<Uint8List>('${name}_blobs'),
  );
}
