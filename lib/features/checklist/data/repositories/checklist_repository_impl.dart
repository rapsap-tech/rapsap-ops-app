import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/submission_result.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';
import 'package:rapsap_ops_app/features/checklist/domain/repositories/checklist_repository.dart';

@LazySingleton(as: ChecklistRepository)
class ChecklistRepositoryImpl implements ChecklistRepository {
  const new(this._remote);

  final ChecklistRemoteDataSource _remote;

  @override
  Future<Either<Failure, TodayChecklist>> today() =>
      guardFailure(() async => (await _remote.today()).toEntity());

  @override
  Future<Either<Failure, TaskDetail>> taskDetail(String taskId) =>
      guardFailure(() async => (await _remote.taskDetail(taskId)).toEntity());

  @override
  Future<Either<Failure, CaptureSession>> startCapture(String taskId) =>
      guardFailure(() async => (await _remote.startCapture(taskId)).toEntity());

  @override
  Future<Either<Failure, SubmissionResult>> submitPhoto({
    required String taskId,
    required String clientId,
    required MediaFile media,
    required String captureToken,
    required String remarks,
    required void Function(double progress) onProgress,
  }) => guardFailure(() async {
    final result = await _remote.submitPhoto(
      taskId: taskId,
      clientId: clientId,
      media: media,
      captureToken: captureToken,
      remarks: remarks,
      onProgress: (sent, total) {
        if (total > 0) onProgress(sent / total);
      },
    );
    return result.toEntity();
  });

  @override
  Future<Either<Failure, SubmissionResult>> submitNotDone({
    required String taskId,
    required String reason,
  }) => guardFailure(
    () async => (await _remote.submitNotDone(
      taskId: taskId,
      reason: reason,
    )).toEntity(),
  );
}
