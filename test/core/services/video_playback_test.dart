import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/services/media/video_playback.dart';
import 'package:video_player/video_player.dart';

class _MockPlayer extends Mock implements VideoPlayerController;

_MockPlayer _player() {
  final player = _MockPlayer();
  when(player.initialize).thenAnswer((_) async {});
  when(player.dispose).thenAnswer((_) async {});
  return player;
}

void main() {
  late VideoPlayback playback;

  setUp(() => playback = VideoPlayback());

  test('opening a second clip frees the first', () async {
    final first = _player();
    final second = _player();
    await playback.open(() => first);
    await playback.open(() => second);
    verify(first.dispose).called(1);
    verifyNever(second.dispose);
  });

  test('releasing a replaced clip leaves the newer one playing', () async {
    final first = _player();
    final second = _player();
    await playback.open(() => first);
    await playback.open(() => second);
    await playback.release(first);
    verifyNever(second.dispose);
  });

  test('releasing the current clip frees it once', () async {
    final player = _player();
    await playback.open(() => player);
    await playback.release(player);
    await playback.release(player);
    verify(player.dispose).called(1);
  });
}
