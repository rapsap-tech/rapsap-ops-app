import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/manager_dashboard.dart';
import 'package:rapsap_ops_app/features/review/domain/repositories/review_repository.dart';

@injectable
class GetManagerDashboard {
  const new(this._repository);

  final ReviewRepository _repository;

  Future<Either<Failure, ManagerDashboard>> call() => _repository.dashboard();
}
