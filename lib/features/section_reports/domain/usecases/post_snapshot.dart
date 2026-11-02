import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/repositories/section_report_repository.dart';

@injectable
class PostSnapshot {
  const new(this._repository);

  final SectionReportRepository _repository;

  Future<Either<Failure, Unit>> call(
    String reportId, {
    required Uint8List image,
    required List<String> conversationIds,
  }) => _repository.postSnapshot(
    reportId,
    image: image,
    conversationIds: conversationIds,
  );
}
