import 'dart:typed_data';

import 'package:camera/camera.dart' show XFile;
import 'package:rapsap_ops_app/core/services/media/video_preview_stub.dart'
    if (dart.library.js_interop) 'package:rapsap_ops_app/core/services/media/video_preview_web.dart'
    if (dart.library.io) 'package:rapsap_ops_app/core/services/media/video_preview_io.dart';
import 'package:video_player/video_player.dart';

/// Player for a just-recorded clip (blob URL on web, file on mobile).
VideoPlayerController videoPreviewController(XFile clip) =>
    createVideoPreviewController(clip);

/// A playable local path (blob URL on web, temp file on mobile) for a clip
/// loaded back from device storage. [fileName] must be unique per clip.
Future<String> savedVideoPath(Uint8List bytes, String fileName) =>
    createSavedVideoPath(bytes, fileName);

/// Frees a path from [savedVideoPath] once the clip is sent or removed.
Future<void> deleteSavedVideo(String path) => removeSavedVideo(path);

/// Deletes every path from [savedVideoPath], e.g. on logout.
Future<void> clearSavedVideos() => removeAllSavedVideos();
