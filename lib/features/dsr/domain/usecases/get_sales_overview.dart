import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';
import 'package:rapsap_ops_app/features/dsr/domain/repositories/dsr_repository.dart';

@injectable
class GetSalesOverview {
  const new(this._repository);

  final DsrRepository _repository;

  Future<Either<Failure, SalesOverview>> call(TrendPeriod period) =>
      _repository.overview(period);
}
