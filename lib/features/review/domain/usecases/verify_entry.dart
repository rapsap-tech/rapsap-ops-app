import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/review/domain/repositories/review_repository.dart';

@injectable
class VerifyEntry {
  const new(this._repository);

  final ReviewRepository _repository;

  Future<Either<Failure, Unit>> call(String taskId) =>
      _repository.verify(taskId);
}
