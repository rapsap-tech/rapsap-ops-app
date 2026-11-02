import 'package:camera/camera.dart' show XFile;
import 'package:rapsap_ops_app/core/services/media/video_preview_stub.dart'
    if (dart.library.js_interop) 'package:rapsap_ops_app/core/services/media/video_preview_web.dart'
    if (dart.library.io) 'package:rapsap_ops_app/core/services/media/video_preview_io.dart';
import 'package:video_player/video_player.dart';

/// Player for a just-recorded clip (blob URL on web, file on mobile).
VideoPlayerController videoPreviewController(XFile clip) =>
    createVideoPreviewController(clip);
