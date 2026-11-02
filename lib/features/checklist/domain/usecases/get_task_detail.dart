import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/domain/repositories/checklist_repository.dart';

@injectable
class GetTaskDetail {
  const new(this._repository);

  final ChecklistRepository _repository;

  Future<Either<Failure, TaskDetail>> call(String taskId) =>
      _repository.taskDetail(taskId);
}
