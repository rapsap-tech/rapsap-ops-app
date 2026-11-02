import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/fake_checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/data/repositories/checklist_repository_impl.dart';
import 'package:rapsap_ops_app/features/checklist/domain/repositories/checklist_repository.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/get_task_detail.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/start_capture.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_not_done.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_photo.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/task_cubit.dart';

class _MockSubmit extends Mock implements SubmitTaskPhoto;

void main() {
  late ChecklistRepository repository;
  late String openTaskId;
  final photo = Uint8List.fromList([1, 2, 3]);

  TaskCubit cubit({SubmitTaskPhoto? submit}) => TaskCubit(
    GetTaskDetail(repository),
    StartCapture(repository),
    submit ?? SubmitTaskPhoto(repository),
    SubmitTaskNotDone(repository),
  );

  setUpAll(() {
    registerFallbackValue(Uint8List(0));
    registerFallbackValue((double _) {});
  });

  setUp(() async {
    final fake = FakeChecklistRemoteDataSource();
    repository = ChecklistRepositoryImpl(fake);
    final today = (await fake.today()).toEntity();
    openTaskId = today.nextTask(DateTime.now())!.id;
  });

  test('photo submit reports progress and ends submitted', () async {
    final c = cubit();
    await c.load(openTaskId);
    await c.openCamera();
    expect(c.state.action, TaskAction.cameraReady);
    c.photoTaken(photo);
    final progress = <double>[];
    final sub = c.stream.listen((s) => progress.add(s.progress));
    await c.submit();
    await Future<void>.delayed(Duration.zero);
    await sub.cancel();
    expect(c.state.action, TaskAction.submitted);
    expect(progress.last, 1);
    await c.close();
  });

  test('dropped connection keeps the photo for retry (X4)', () async {
    final submit = _MockSubmit();
    when(
      () => submit(
        taskId: any(named: 'taskId'),
        photo: any(named: 'photo'),
        captureToken: any(named: 'captureToken'),
        remarks: any(named: 'remarks'),
        onProgress: any(named: 'onProgress'),
      ),
    ).thenAnswer((_) async => const Left(NoInternetFailure()));
    final c = cubit(submit: submit);
    await c.load(openTaskId);
    await c.openCamera();
    c.photoTaken(photo);
    await c.submit();
    expect(c.state.action, TaskAction.interrupted);
    expect(c.state.photo, photo);
    await c.close();
  });

  test('closing the camera without a photo keeps the earlier one', () async {
    final c = cubit();
    await c.load(openTaskId);
    await c.openCamera();
    c
      ..photoTaken(photo)
      ..photoTaken(null);
    expect(c.state.photo, photo);
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
