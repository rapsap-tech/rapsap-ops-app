import 'package:camera/camera.dart' show XFile;
import 'package:video_player/video_player.dart';

VideoPlayerController createVideoPreviewController(XFile clip) =>
    throw UnsupportedError('No video preview on this platform');
