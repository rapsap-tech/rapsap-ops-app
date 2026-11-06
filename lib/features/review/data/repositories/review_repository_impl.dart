import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/features/review/data/datasources/review_remote_data_source.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/manager_dashboard.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_detail.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/review/domain/repositories/review_repository.dart';

@LazySingleton(as: ReviewRepository)
class ReviewRepositoryImpl implements ReviewRepository {
  const new(this._remote);

  final ReviewRemoteDataSource _remote;

  static const Map<EditReason, String> _reasons = {
    EditReason.photoUnclear: 'photo_unclear',
    EditReason.wrongPhoto: 'wrong_photo',
    EditReason.remarkMissing: 'remark_missing',
    EditReason.other: 'other',
  };

  Future<Either<Failure, Unit>> _run(Future<void> Function() call) =>
      guardFailure(() async {
        await call();
        return unit;
      });

  @override
  Future<Either<Failure, ManagerDashboard>> dashboard() =>
      guardFailure(() async => (await _remote.dashboard()).toEntity());

  @override
  Future<Either<Failure, List<ReviewItem>>> queue() => guardFailure(
    () async => [for (final i in await _remote.queue()) i.toEntity()],
  );

  @override
  Future<Either<Failure, ReviewDetail>> detail(String taskId) =>
      guardFailure(() async {
        final detail = await _remote.detail(taskId);
        return detail.toEntity(taskId, await _queued(taskId));
      });

  /// The queue row adds staff and time to the detail; without it the
  /// detail still opens.
  Future<ReviewItem?> _queued(String taskId) async {
    try {
      final queue = await _remote.queue();
      return queue.where((i) => i.taskId == taskId).firstOrNull?.toEntity();
    } on Object catch (error) {
      appLogger.w('Review queue unavailable', error: error.runtimeType);
      return null;
    }
  }

  @override
  Future<Either<Failure, Unit>> verify(String taskId) =>
      _run(() => _remote.verify(taskId));

  @override
  Future<Either<Failure, Unit>> sendBack(String taskId, String reason) =>
      _run(() => _remote.sendBack(taskId, reason));

  @override
  Future<Either<Failure, Unit>> editEntry({
    required String taskId,
    required MediaFile media,
    required String captureToken,
    required EditReason reason,
    required String remarks,
  }) => _run(
    () => _remote.edit(
      taskId: taskId,
      media: media,
      captureToken: captureToken,
      reason: _reasons[reason]!,
      remarks: remarks.trim(),
    ),
  );

  @override
  Future<Either<Failure, Unit>> unlock(String taskId) =>
      _run(() => _remote.unlock(taskId));

  @override
  Future<Either<Failure, Unit>> takeOver(String taskId) =>
      _run(() => _remote.takeOver(taskId));
}
