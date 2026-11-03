import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/section_reports/data/datasources/report_remote_data_source.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/closing_form.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/daily_summary.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/report_snapshot.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/section_report.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/repositories/section_report_repository.dart';

@LazySingleton(as: SectionReportRepository)
class SectionReportRepositoryImpl implements SectionReportRepository {
  const new(this._remote);

  final ReportRemoteDataSource _remote;

  Future<Either<Failure, Unit>> _run(Future<void> Function() call) =>
      guardFailure(() async {
        await call();
        return unit;
      });

  @override
  Future<Either<Failure, List<SectionReport>>> reports() => guardFailure(
    () async => [for (final r in await _remote.reports()) r.toEntity()],
  );

  @override
  Future<Either<Failure, Unit>> submit(
    String reportId, {
    required String note,
  }) => _run(() => _remote.submit(reportId, note));

  @override
  Future<Either<Failure, DailySummaryForm>> dailySummaryForm() =>
      guardFailure(() async => (await _remote.dailySummaryForm()).toEntity());

  @override
  Future<Either<Failure, Unit>> submitDailySummary(DailySummaryInput input) =>
      _run(
        () => _remote.submitDailySummary({
          'margin_percent': input.marginPercent,
          'complaints': input.complaints,
          'damages': input.damages,
          'shrinkage': input.shrinkage,
          'manpower_present': input.manpowerPresent,
          'key_issues': input.keyIssues,
        }),
      );

  @override
  Future<Either<Failure, ReportSnapshot>> snapshot(String reportId) =>
      guardFailure(() async => (await _remote.snapshot(reportId)).toEntity());

  @override
  Future<Either<Failure, Unit>> postSnapshot(
    String reportId, {
    required Uint8List image,
    required List<String> conversationIds,
  }) => _run(() => _remote.post(reportId, image, conversationIds));

  @override
  Future<Either<Failure, ClosingForm>> closingForm() =>
      guardFailure(() async => (await _remote.closingForm()).toEntity());

  @override
  Future<Either<Failure, Unit>> submitClosing({
    required String taskId,
    required List<String> closedBy,
    required MediaFile media,
    required String captureToken,
  }) => _run(
    () => _remote.submitClosing(
      taskId: taskId,
      closedBy: closedBy,
      media: media,
      captureToken: captureToken,
    ),
  );

  @override
  Future<Either<Failure, Unit>> submitWalkthrough({
    required String taskId,
    required Uint8List video,
    required String fileName,
    required String captureToken,
    required void Function(double progress) onProgress,
  }) => _run(
    () => _remote.submitWalkthrough(
      taskId: taskId,
      video: video,
      fileName: fileName,
      captureToken: captureToken,
      onProgress: (sent, total) {
        if (total > 0) onProgress(sent / total);
      },
    ),
  );
}
