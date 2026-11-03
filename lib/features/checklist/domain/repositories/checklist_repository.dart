import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/submission_result.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';

abstract class ChecklistRepository {
  Future<Either<Failure, TodayChecklist>> today();
  Future<Either<Failure, TaskDetail>> taskDetail(String taskId);
  Future<Either<Failure, CaptureSession>> startCapture(String taskId);

  /// [onProgress] receives 0–1 while the photo uploads. [clientId] lets the
  /// server ignore a repeat of the same proof.
  Future<Either<Failure, SubmissionResult>> submitPhoto({
    required String taskId,
    required String clientId,
    required MediaFile media,
    required String captureToken,
    required String remarks,
    required void Function(double progress) onProgress,
  });

  Future<Either<Failure, SubmissionResult>> submitNotDone({
    required String taskId,
    required String reason,
  });
}
