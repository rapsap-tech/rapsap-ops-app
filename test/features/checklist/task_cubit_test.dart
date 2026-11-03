import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/network/network_info.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/fake_checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/data/repositories/checklist_repository_impl.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/submission_result.dart';
import 'package:rapsap_ops_app/features/checklist/domain/repositories/checklist_repository.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/get_task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/start_capture.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_not_done.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_photo.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/task_cubit.dart';
import 'package:rapsap_ops_app/features/uploads/domain/repositories/upload_outbox_repository.dart';
import 'package:rapsap_ops_app/features/uploads/domain/usecases/find_saved_proof.dart';
import 'package:rapsap_ops_app/features/uploads/domain/usecases/remove_upload.dart';
import 'package:rapsap_ops_app/features/uploads/domain/usecases/save_upload.dart';

import '../../helpers/always_online.dart';
import '../../helpers/test_outbox.dart';

class _MockSubmit extends Mock implements SubmitTaskPhoto;

class _Offline implements NetworkInfo {
  const new();

  @override
  Future<bool> get isConnected async => false;

  @override
  Stream<bool> get onStatusChange => const Stream.empty();
}

void main() {
  late ChecklistRepository repository;
  late UploadOutboxRepository outbox;
  late String openTaskId;
  final photo = MediaFile.photo(Uint8List.fromList([1, 2, 3]));
  final retake = MediaFile.photo(Uint8List.fromList([4, 5, 6]));

  TaskCubit cubit({SubmitTaskPhoto? submit}) => TaskCubit(
    GetTaskDetail(repository),
    StartCapture(repository),
    submit ?? SubmitTaskPhoto(repository),
    SubmitTaskNotDone(repository),
    FindSavedProof(outbox),
    SaveUpload(outbox),
    RemoveUpload(outbox),
  );

  List<String> savedIds() =>
      outbox.pending().getOrElse((_) => []).map((u) => u.id).toList();

  /// Submit that answers with [result] and records each `client_id` it got.
  _MockSubmit submitAnswering(
    Either<Failure, SubmissionResult> result,
    List<String> clientIds,
  ) {
    final submit = _MockSubmit();
    when(
      () => submit(
        taskId: any(named: 'taskId'),
        clientId: any(named: 'clientId'),
        media: any(named: 'media'),
        captureToken: any(named: 'captureToken'),
        remarks: any(named: 'remarks'),
        onProgress: any(named: 'onProgress'),
      ),
    ).thenAnswer((invocation) async {
      clientIds.add(invocation.namedArguments[#clientId] as String);
      return result;
    });
    return submit;
  }

  Future<TaskCubit> interruptedCubit(List<String> clientIds) async {
    final c = cubit(
      submit: submitAnswering(const Left(NoInternetFailure()), clientIds),
    );
    await c.load(openTaskId);
    await c.openCamera();
    c
      ..mediaTaken(photo)
      ..remarksChanged('Temp 3°C');
    await c.submit();
    return c;
  }

  setUpAll(() {
    registerFallbackValue(MediaFile.photo(Uint8List(0)));
    registerFallbackValue((double _) {});
  });

  setUp(() async {
    final fake = FakeChecklistRemoteDataSource(const AlwaysOnline());
    repository = ChecklistRepositoryImpl(fake);
    outbox = await openTestOutbox();
    final today = (await fake.today()).toEntity();
    openTaskId = today.nextTask(DateTime.now())!.id;
  });

  test('photo submit reports progress, ends submitted, keeps nothing '
      'on the device', () async {
    final c = cubit();
    await c.load(openTaskId);
    await c.openCamera();
    expect(c.state.action, TaskAction.cameraReady);
    c.mediaTaken(photo);
    final progress = <double>[];
    final sub = c.stream.listen((s) => progress.add(s.progress));
    await c.submit();
    await Future<void>.delayed(Duration.zero);
    await sub.cancel();
    expect(c.state.action, TaskAction.submitted);
    expect(progress.last, 1);
    expect(savedIds(), isEmpty);
    await c.close();
  });

  test('dropped connection keeps the proof on the device (X4)', () async {
    final clientIds = <String>[];
    final c = await interruptedCubit(clientIds);

    expect(c.state.action, TaskAction.interrupted);
    expect(c.state.media, photo);
    expect(savedIds(), clientIds);
    final saved = outbox.pending().getOrElse((_) => []).single;
    expect(saved.remarks, 'Temp 3°C');
    expect(await outbox.media(saved.id), Right<Failure, MediaFile>(photo));
    await c.close();
  });

  test('the fake API fails the upload when the device is offline', () async {
    repository = ChecklistRepositoryImpl(
      FakeChecklistRemoteDataSource(const _Offline()),
    );
    final c = cubit();
    await c.load(openTaskId);
    await c.openCamera();
    c.mediaTaken(photo);
    await c.submit();

    expect(c.state.action, TaskAction.interrupted);
    expect(savedIds(), hasLength(1));
    await c.close();
  });

  test('reopening the task restores saved proof, and a retry reuses its '
      'client_id', () async {
    final clientIds = <String>[];
    await (await interruptedCubit(clientIds)).close();

    final reopened = cubit(
      submit: submitAnswering(
        Right(SubmissionResult(submittedAt: DateTime(2026), onTime: true)),
        clientIds,
      ),
    );
    await reopened.load(openTaskId);
    expect(reopened.state.action, TaskAction.interrupted);
    expect(reopened.state.media, photo);
    expect(reopened.state.remarks, 'Temp 3°C');

    await reopened.submit();

    expect(reopened.state.action, TaskAction.submitted);
    expect(clientIds, hasLength(2));
    expect(clientIds.toSet(), hasLength(1));
    expect(savedIds(), isEmpty);
    await reopened.close();
  });

  test('retaking after a drop replaces the saved proof', () async {
    final clientIds = <String>[];
    final c = await interruptedCubit(clientIds);
    final first = savedIds().single;

    c.backToTask();
    await c.openCamera();
    c.mediaTaken(retake);
    await c.submit();

    expect(savedIds(), hasLength(1));
    expect(savedIds().single, isNot(first));
    final saved = savedIds().single;
    expect(await outbox.media(saved), Right<Failure, MediaFile>(retake));
    await c.close();
  });

  test('a server refusal clears the saved copy but keeps the photo on '
      'screen', () async {
    final c = cubit(
      submit: submitAnswering(
        const Left(MessageBlockedFailure(BlockReason.abuse)),
        [],
      ),
    );
    await c.load(openTaskId);
    await c.openCamera();
    c.mediaTaken(photo);
    await c.submit();

    expect(c.state.action, TaskAction.failure);
    expect(c.state.media, photo);
    expect(savedIds(), isEmpty);
    await c.close();
  });

  test('an unknown or cancelled failure keeps the saved copy', () async {
    for (final failure in const [UnknownFailure(), CancelledFailure()]) {
      final c = cubit(submit: submitAnswering(Left(failure), []));
      await c.load(openTaskId);
      await c.openCamera();
      c.mediaTaken(photo);
      await c.submit();

      expect(savedIds(), hasLength(1));
      await outbox.remove(savedIds().single);
      await c.close();
    }
  });

  test('closing the camera without a photo keeps the earlier one', () async {
    final c = cubit();
    await c.load(openTaskId);
    await c.openCamera();
    c
      ..mediaTaken(photo)
      ..mediaTaken(null);
    expect(c.state.media, photo);
    await c.close();
  });

  test('not-done reason submits without a photo', () async {
    final c = cubit();
    await c.load(openTaskId);
    c
      ..setNotDoneMode(enabled: true)
      ..reasonChanged('Chiller display is broken');
    await c.submitNotDone();
    expect(c.state.action, TaskAction.submitted);
    await c.close();
  });
}
