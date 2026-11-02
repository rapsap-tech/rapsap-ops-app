import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/domain/repositories/checklist_repository.dart';

@injectable
class StartCapture {
  const new(this._repository);

  final ChecklistRepository _repository;

  Future<Either<Failure, CaptureSession>> call(String taskId) =>
      _repository.startCapture(taskId);
}
