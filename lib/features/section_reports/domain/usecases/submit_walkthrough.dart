import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/repositories/section_report_repository.dart';

@injectable
class SubmitWalkthrough {
  const new(this._repository);

  final SectionReportRepository _repository;

  Future<Either<Failure, Unit>> call({
    required String taskId,
    required Uint8List video,
    required String fileName,
    required void Function(double progress) onProgress,
  }) => _repository.submitWalkthrough(
    taskId: taskId,
    video: video,
    fileName: fileName,
    onProgress: onProgress,
  );
}
