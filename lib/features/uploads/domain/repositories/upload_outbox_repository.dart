import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/uploads/domain/entities/pending_upload.dart';

/// Proof waiting to upload, kept on the device across restarts.
abstract class UploadOutboxRepository {
  /// Upserts by [PendingUpload.id], so saving again updates the record.
  Future<Either<Failure, Unit>> add(PendingUpload upload, MediaFile media);

  /// Oldest first.
  Either<Failure, List<PendingUpload>> pending();

  /// Emits [pending] now and after every change.
  Stream<List<PendingUpload>> watch();

  /// The saved photo or clip; a clip gets a fresh playable [MediaFile.path].
  Future<Either<Failure, MediaFile>> media(String id);

  Future<Either<Failure, Unit>> setStatus(
    String id,
    UploadStatus status, {
    UploadRejection? rejection,
  });

  Future<Either<Failure, Unit>> remove(String id);
}
