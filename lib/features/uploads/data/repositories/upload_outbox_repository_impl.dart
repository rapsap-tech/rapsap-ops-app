import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/core/services/media/video_preview.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/features/uploads/data/datasources/upload_outbox_local_data_source.dart';
import 'package:rapsap_ops_app/features/uploads/data/models/pending_upload_model.dart';
import 'package:rapsap_ops_app/features/uploads/domain/entities/pending_upload.dart';
import 'package:rapsap_ops_app/features/uploads/domain/repositories/upload_outbox_repository.dart';

@LazySingleton(as: UploadOutboxRepository)
class UploadOutboxRepositoryImpl implements UploadOutboxRepository {
  new(this._local);

  final UploadOutboxLocalDataSource _local;

  /// Playable copies made for restored clips, freed on remove.
  final Map<String, String> _videoPaths = {};

  @override
  Future<Either<Failure, Unit>> add(PendingUpload upload, MediaFile media) =>
      guardFailure(() async {
        await _local.add(PendingUploadModel.fromEntity(upload), media.bytes);
        return unit;
      });

  @override
  Either<Failure, List<PendingUpload>> pending() {
    try {
      return Right([for (final model in _local.all()) model.toEntity()]);
    } on Object catch (error, stackTrace) {
      appLogger.e('Outbox read failed', error: error, stackTrace: stackTrace);
      return const Left(StorageFailure());
    }
  }

  @override
  Stream<List<PendingUpload>> watch() async* {
    yield _pendingOrEmpty();
    await for (final _ in _local.changes()) {
      yield _pendingOrEmpty();
    }
  }

  // A read failure is already logged by [pending]; show nothing rather than
  // break the stream.
  List<PendingUpload> _pendingOrEmpty() => pending().getOrElse((_) => const []);

  @override
  Future<Either<Failure, MediaFile>> media(String id) => guardFailure(() async {
    final upload = _local.find(id);
    final bytes = await _local.media(id);
    if (upload == null || bytes == null) throw const NotFoundException();
    if (!upload.isVideo) return MediaFile.photo(bytes);
    final name = upload.videoName ?? AppConstants.videoFileName;
    final previous = _videoPaths[id];
    if (previous != null) await deleteSavedVideo(previous);
    final path = await savedVideoPath(bytes, '${upload.id}_$name');
    _videoPaths[id] = path;
    return MediaFile.video(bytes, name: name, path: path);
  });

  @override
  Future<Either<Failure, Unit>> setStatus(
    String id,
    UploadStatus status, {
    UploadRejection? rejection,
  }) => guardFailure(() async {
    final upload = _local.find(id);
    if (upload == null) throw const NotFoundException();
    await _local.save(upload.copyWith(status: status, rejection: rejection));
    return unit;
  });

  @override
  Future<Either<Failure, Unit>> remove(String id) => guardFailure(() async {
    await _local.remove(id);
    final path = _videoPaths.remove(id);
    if (path != null) await deleteSavedVideo(path);
    return unit;
  });
}
