import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/daily_summary.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/repositories/section_report_repository.dart';

@injectable
class GetDailySummaryForm {
  const new(this._repository);

  final SectionReportRepository _repository;

  Future<Either<Failure, DailySummaryForm>> call() =>
      _repository.dailySummaryForm();
}
