import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/closing_form.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/daily_summary.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/report_snapshot.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/section_report.dart';

abstract class SectionReportRepository {
  Future<Either<Failure, List<SectionReport>>> reports();
  Future<Either<Failure, Unit>> submit(String reportId, {required String note});
  Future<Either<Failure, DailySummaryForm>> dailySummaryForm();
  Future<Either<Failure, Unit>> submitDailySummary(DailySummaryInput input);
  Future<Either<Failure, ReportSnapshot>> snapshot(String reportId);
  Future<Either<Failure, Unit>> postSnapshot(
    String reportId, {
    required Uint8List image,
    required List<String> conversationIds,
  });
  Future<Either<Failure, ClosingForm>> closingForm();
  Future<Either<Failure, Unit>> submitClosing({
    required String taskId,
    required List<String> closedBy,
    required Uint8List photo,
    required String captureToken,
  });

  /// #46 store walkthrough (CK-30).
  Future<Either<Failure, Unit>> submitWalkthrough({
    required String taskId,
    required Uint8List video,
    required String fileName,
    required void Function(double progress) onProgress,
  });
}
