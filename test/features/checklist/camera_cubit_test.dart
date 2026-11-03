import 'dart:typed_data';

import 'package:camera/camera.dart' show XFile;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/services/media/camera_service.dart';
import 'package:rapsap_ops_app/core/services/media/photo_processor.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/camera_cubit.dart';

class _MockCamera extends Mock implements CameraService;

void main() {
  late _MockCamera camera;
  final clipBytes = Uint8List.fromList([7, 8, 9]);

  setUp(() {
    camera = _MockCamera();
    when(() => camera.start(withAudio: any(named: 'withAudio')))
        .thenAnswer((_) async => CameraStartResult.ready);
    when(() => camera.dispose()).thenAnswer((_) async {});
    when(() => camera.startVideo()).thenAnswer((_) async {});
    when(() => camera.stopVideo()).thenAnswer(
      (_) async =>
          XFile.fromData(clipBytes, name: 'clip.mp4', path: '/tmp/clip.mp4'),
    );
  });

  test(
    'video mode restarts with audio and returns the recorded clip',
    () async {
      final c = CameraCubit(camera, PhotoProcessor());
      await c.start();
      verify(() => camera.start()).called(1);

      await c.setMode(CameraMode.video);
      verify(() => camera.start(withAudio: true)).called(1);
      expect(c.state.status, CameraStatus.ready);

      await c.record();
      expect(c.state.status, CameraStatus.recording);
      await c.stop();

      final media = c.state.media;
      expect(c.state.status, CameraStatus.captured);
      expect(media?.isVideo, isTrue);
      expect(media?.bytes, clipBytes);
      expect(media?.name, 'clip.mp4');
      await c.close();
    },
  );

  test('mode cannot change while recording', () async {
    final c = CameraCubit(camera, PhotoProcessor());
    await c.start();
    await c.setMode(CameraMode.video);
    await c.record();
    await c.setMode(CameraMode.photo);
    expect(c.state.mode, CameraMode.video);
    expect(c.state.status, CameraStatus.recording);
    await c.close();
  });
}
