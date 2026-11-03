import 'dart:js_interop';
import 'dart:typed_data';

import 'package:camera/camera.dart' show XFile;
import 'package:video_player/video_player.dart';
import 'package:web/web.dart' as web;

VideoPlayerController createVideoPreviewController(XFile clip) =>
    VideoPlayerController.networkUrl(Uri.parse(clip.path));

Future<String> createSavedVideoPath(Uint8List bytes, String fileName) async =>
    web.URL.createObjectURL(web.Blob([bytes.toJS].toJS));

Future<void> removeSavedVideo(String path) async =>
    web.URL.revokeObjectURL(path);

/// Blob URLs end with the page, so there is nothing left on disk.
Future<void> removeAllSavedVideos() async {}
