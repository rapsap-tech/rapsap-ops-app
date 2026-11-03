import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/uploads/domain/entities/pending_upload.dart';
import 'package:rapsap_ops_app/features/uploads/domain/repositories/upload_outbox_repository.dart';

typedef SavedProof = ({PendingUpload upload, MediaFile media});

/// Proof for a task that is saved on the device but not yet uploaded, or
/// null when there is none.
@injectable
class FindSavedProof {
  const new(this._repository);

  final UploadOutboxRepository _repository;

  Future<Either<Failure, SavedProof?>> call(String taskId) =>
      _repository.pending().match(
        (failure) async => Left(failure),
        (uploads) => _withMedia(
          uploads
              .where(
                (u) => u.kind == UploadKind.taskProof && u.targetId == taskId,
              )
              .lastOrNull,
        ),
      );

  Future<Either<Failure, SavedProof?>> _withMedia(PendingUpload? upload) async {
    if (upload == null) return const Right(null);
    final media = await _repository.media(upload.id);
    return media.map((m) => (upload: upload, media: m));
  }
}
