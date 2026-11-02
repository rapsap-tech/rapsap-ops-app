import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/section_report.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/repositories/section_report_repository.dart';

@injectable
class GetSectionReports {
  const new(this._repository);

  final SectionReportRepository _repository;

  Future<Either<Failure, List<SectionReport>>> call() => _repository.reports();
}
