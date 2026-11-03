import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/submission_result.dart';
import 'package:rapsap_ops_app/features/checklist/domain/repositories/checklist_repository.dart';

@injectable
class SubmitTaskPhoto {
  const new(this._repository);

  final ChecklistRepository _repository;

  Future<Either<Failure, SubmissionResult>> call({
    required String taskId,
    required String clientId,
    required MediaFile media,
    required String captureToken,
    required String remarks,
    required void Function(double progress) onProgress,
  }) => _repository.submitPhoto(
    taskId: taskId,
    clientId: clientId,
    media: media,
    captureToken: captureToken,
    remarks: remarks.trim(),
    onProgress: onProgress,
  );
}
