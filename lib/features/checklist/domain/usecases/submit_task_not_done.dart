import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/submission_result.dart';
import 'package:rapsap_ops_app/features/checklist/domain/repositories/checklist_repository.dart';

@injectable
class SubmitTaskNotDone {
  const new(this._repository);

  final ChecklistRepository _repository;

  Future<Either<Failure, SubmissionResult>> call({
    required String taskId,
    required String reason,
  }) => _repository.submitNotDone(taskId: taskId, reason: reason.trim());
}
