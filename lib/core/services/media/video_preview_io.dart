import 'dart:io';

import 'package:camera/camera.dart' show XFile;
import 'package:video_player/video_player.dart';

VideoPlayerController createVideoPreviewController(XFile clip) =>
    VideoPlayerController.file(File(clip.path));
