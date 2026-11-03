import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/repositories/section_report_repository.dart';

@injectable
class SubmitClosingReport {
  const new(this._repository);

  final SectionReportRepository _repository;

  Future<Either<Failure, Unit>> call({
    required String taskId,
    required List<String> closedBy,
    required MediaFile media,
    required String captureToken,
  }) => _repository.submitClosing(
    taskId: taskId,
    closedBy: closedBy,
    media: media,
    captureToken: captureToken,
  );
}
