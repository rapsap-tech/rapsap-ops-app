import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hive_ce/hive_ce.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/core/services/storage/local_db.dart';
import 'package:rapsap_ops_app/features/uploads/data/datasources/upload_outbox_local_data_source.dart';
import 'package:rapsap_ops_app/features/uploads/data/repositories/upload_outbox_repository_impl.dart';
import 'package:rapsap_ops_app/features/uploads/domain/entities/pending_upload.dart';

import '../../helpers/test_local_db.dart';

PendingUpload _upload(String id, {int minute = 0, bool isVideo = false}) =>
    PendingUpload(
      id: id,
      kind: UploadKind.taskProof,
      targetId: 't22',
      taskNumber: 22,
      taskTitle: 'Chiller temperature',
      isVideo: isVideo,
      videoName: isVideo ? 'clip.mp4' : null,
      captureToken: 'token',
      remarks: 'ok',
      savedAt: DateTime(2026, 11, 3, 10, minute),
    );

UploadOutboxRepositoryImpl _repository(LocalDb db) =>
    UploadOutboxRepositoryImpl(UploadOutboxLocalDataSource(db));

void main() {
  late Directory dir;
  late UploadOutboxRepositoryImpl repository;
  final photo = MediaFile.photo(Uint8List.fromList([1, 2, 3]));

  setUp(() async {
    dir = await Directory.systemTemp.createTemp('outbox_test');
    repository = _repository(await openTestLocalDb(dir: dir));
  });

  tearDown(Hive.close);

  test('a saved proof comes back with its media', () async {
    await repository.add(_upload('a'), photo);

    expect(repository.pending().getOrElse((_) => []), [_upload('a')]);
    expect(await repository.media('a'), Right<Failure, MediaFile>(photo));
  });

  test('lists oldest first', () async {
    await repository.add(_upload('late', minute: 5), photo);
    await repository.add(_upload('early', minute: 1), photo);

    final ids = repository.pending().getOrElse((_) => []).map((u) => u.id);
    expect(ids, ['early', 'late']);
  });

  test('a restored clip keeps its name and gets a playable path', () async {
    final clip = MediaFile.video(
      Uint8List.fromList([9]),
      name: 'clip.mp4',
      path: 'blob:old',
    );
    await repository.add(_upload('v', isVideo: true), clip);

    final media = (await repository.media('v')).getOrElse((_) => photo);
    expect(media.isVideo, isTrue);
    expect(media.name, 'clip.mp4');
    expect(media.path, endsWith('v_clip.mp4'));
  });

  test('status and rejection are saved', () async {
    await repository.add(_upload('a'), photo);
    await repository.setStatus(
      'a',
      UploadStatus.failed,
      rejection: UploadRejection.remarksBlocked,
    );

    final saved = repository.pending().getOrElse((_) => []).single;
    expect(saved.status, UploadStatus.failed);
    expect(saved.rejection, UploadRejection.remarksBlocked);
  });

  test('remove deletes the record and its media', () async {
    await repository.add(_upload('a'), photo);
    await repository.remove('a');

    expect(repository.pending().getOrElse((_) => [_upload('x')]), isEmpty);
    expect(
      await repository.media('a'),
      const Left<Failure, MediaFile>(NotFoundFailure()),
    );
  });

  test('a 20 MB clip (about 45 s of video) is saved whole', () async {
    final clip = MediaFile.video(
      Uint8List(20 * 1024 * 1024),
      name: 'clip.mp4',
      path: null,
    );
    await repository.add(_upload('big', isVideo: true), clip);

    final media = (await repository.media('big')).getOrElse((_) => photo);
    expect(media.bytes.length, 20 * 1024 * 1024);
  });

  test('proof survives an app restart', () async {
    await repository.add(_upload('a'), photo);
    await Hive.close();

    final reopened = _repository(await openTestLocalDb(dir: dir));

    expect(reopened.pending().getOrElse((_) => []), [_upload('a')]);
    expect(await reopened.media('a'), Right<Failure, MediaFile>(photo));
  });

  test('watch emits the current list and every change', () async {
    final lists = repository.watch().map((list) => list.length);
    final expectation = expectLater(lists, emitsInOrder([0, 1, 0]));

    await Future<void>.delayed(Duration.zero);
    await repository.add(_upload('a'), photo);
    await repository.remove('a');

    await expectation;
  });
}
