import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/uploads/domain/entities/pending_upload.dart';
import 'package:rapsap_ops_app/features/uploads/domain/repositories/upload_outbox_repository.dart';

/// Keeps proof on the device before it is sent, so a dropped connection or
/// a closed app doesn't lose it.
@injectable
class SaveUpload {
  const new(this._repository);

  final UploadOutboxRepository _repository;

  Future<Either<Failure, Unit>> call(PendingUpload upload, MediaFile media) =>
      _repository.add(upload, media);
}
