import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/video_box.dart';

/// A just-captured photo or clip, rounded and cropped to the given size.
class MediaPreview extends StatelessWidget {
  const new({
    required this.media,
    required this.semanticLabel,
    this.height,
    this.width,
    super.key,
  });

  final MediaFile media;
  final String semanticLabel;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    final height = this.height ?? Dimens.photoPreviewHeight;
    final width = this.width ?? double.infinity;
    final path = media.path;
    return ClipRRect(
      borderRadius: BorderRadius.circular(Dimens.radius12),
      child: media.isVideo && path != null
          ? VideoBox.local(path, height: height, width: width)
          : Image.memory(
              media.bytes,
              height: height,
              width: width,
              fit: BoxFit.cover,
              semanticLabel: semanticLabel,
            ),
    );
  }
}
