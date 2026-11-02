import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';
import 'package:rapsap_ops_app/features/checklist/domain/repositories/checklist_repository.dart';

@injectable
class GetTodayChecklist {
  const new(this._repository);

  final ChecklistRepository _repository;

  Future<Either<Failure, TodayChecklist>> call() => _repository.today();
}
