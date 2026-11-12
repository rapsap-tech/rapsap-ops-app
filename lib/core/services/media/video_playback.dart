import 'package:injectable/injectable.dart';
import 'package:video_player/video_player.dart';

/// The one player for full-screen video. Opening a clip frees the one
/// before it, so two videos never play or hold a decoder at once.
@lazySingleton
class VideoPlayback {
  VideoPlayerController? _current;

  Future<VideoPlayerController> open(
    VideoPlayerController Function() create,
  ) async {
    await _dispose(_current);
    final player = create();
    _current = player;
    await player.initialize();
    return player;
  }

  /// Frees [player] unless a newer clip has already replaced it.
  Future<void> release(VideoPlayerController player) async {
    if (!identical(_current, player)) return;
    await _dispose(player);
  }

  Future<void> _dispose(VideoPlayerController? player) async {
    if (player == null) return;
    if (identical(_current, player)) _current = null;
    await player.dispose();
  }
}
