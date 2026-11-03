import 'package:rapsap_ops_app/features/uploads/data/datasources/upload_outbox_local_data_source.dart';
import 'package:rapsap_ops_app/features/uploads/data/repositories/upload_outbox_repository_impl.dart';
import 'package:rapsap_ops_app/features/uploads/domain/repositories/upload_outbox_repository.dart';

import 'test_local_db.dart';

/// An empty outbox backed by a real on-device store in a temp folder.
Future<UploadOutboxRepository> openTestOutbox() async =>
    UploadOutboxRepositoryImpl(
      UploadOutboxLocalDataSource(await openTestLocalDb()),
    );
