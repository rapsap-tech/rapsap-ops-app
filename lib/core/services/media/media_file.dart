import 'dart:typed_data';

import 'package:equatable/equatable.dart';

/// What the in-app camera returns: a stamped photo or a recorded clip.
class MediaFile extends Equatable {
  const new photo(this.bytes) : isVideo = false, name = null, path = null;

  const new video(this.bytes, {required this.name, required this.path})
    : isVideo = true;

  final Uint8List bytes;
  final bool isVideo;

  /// Recorded file name and local path (blob URL on web), videos only.
  final String? name;
  final String? path;

  @override
  List<Object?> get props => [bytes, isVideo, name, path];
}
