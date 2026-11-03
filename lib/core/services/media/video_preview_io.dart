import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart' show XFile;
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController createVideoPreviewController(XFile clip) =>
    VideoPlayerController.file(File(clip.path));

Directory get _savedVideos =>
    Directory('${Directory.systemTemp.path}/${AppConstants.savedVideosFolder}');

Future<String> createSavedVideoPath(Uint8List bytes, String fileName) async {
  final folder = await _savedVideos.create(recursive: true);
  final file = File('${folder.path}/$fileName');
  await file.writeAsBytes(bytes, flush: true);
  return file.path;
}

Future<void> removeSavedVideo(String path) async {
  final file = File(path);
  if (file.existsSync()) await file.delete();
}

Future<void> removeAllSavedVideos() async {
  final folder = _savedVideos;
  if (folder.existsSync()) await folder.delete(recursive: true);
}
