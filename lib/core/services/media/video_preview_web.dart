import 'package:camera/camera.dart' show XFile;
import 'package:video_player/video_player.dart';

VideoPlayerController createVideoPreviewController(XFile clip) =>
    VideoPlayerController.networkUrl(Uri.parse(clip.path));
