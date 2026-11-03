import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/review/domain/repositories/review_repository.dart';

/// SM replaces a staff photo or video; the original stays in history (SM-20).
@injectable
class EditEntry {
  const new(this._repository);

  final ReviewRepository _repository;

  Future<Either<Failure, Unit>> call({
    required String taskId,
    required MediaFile media,
    required String captureToken,
    required EditReason reason,
    required String remarks,
  }) => _repository.editEntry(
    taskId: taskId,
    media: media,
    captureToken: captureToken,
    reason: reason,
    remarks: remarks.trim(),
  );
}
