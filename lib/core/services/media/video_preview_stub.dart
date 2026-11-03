import 'dart:typed_data';

import 'package:camera/camera.dart' show XFile;
import 'package:video_player/video_player.dart';

VideoPlayerController createVideoPreviewController(XFile clip) =>
    throw UnsupportedError('No video preview on this platform');

Future<String> createSavedVideoPath(Uint8List bytes, String fileName) =>
    throw UnsupportedError('No video preview on this platform');

Future<void> removeSavedVideo(String path) async {}

Future<void> removeAllSavedVideos() async {}
