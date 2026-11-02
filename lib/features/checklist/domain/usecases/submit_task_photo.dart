import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/submission_result.dart';
import 'package:rapsap_ops_app/features/checklist/domain/repositories/checklist_repository.dart';

@injectable
class SubmitTaskPhoto {
  const new(this._repository);

  final ChecklistRepository _repository;

  Future<Either<Failure, SubmissionResult>> call({
    required String taskId,
    required Uint8List photo,
    required String captureToken,
    required String remarks,
    required void Function(double progress) onProgress,
  }) => _repository.submitPhoto(
    taskId: taskId,
    photo: photo,
    captureToken: captureToken,
    remarks: remarks.trim(),
    onProgress: onProgress,
  );
}
