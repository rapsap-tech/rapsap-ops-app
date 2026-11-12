import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_network_image.dart';
import 'package:rapsap_ops_app/core/widgets/media_preview.dart';
import 'package:rapsap_ops_app/core/widgets/photo_viewer.dart';
import 'package:rapsap_ops_app/core/widgets/tap_layer.dart';
import 'package:rapsap_ops_app/core/widgets/video_box.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';

/// The photo or clip in a message: the local copy while sending, else the
/// server copy. A photo opens full screen; a clip plays full screen.
class MessagePhoto extends StatelessWidget {
  const new({required this.message, super.key});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final local = message.localMedia;
    final photoUrl = message.photoUrl;
    final videoUrl = message.videoUrl;
    final label = context.l10n.chatPhoto;
    final width = Dimens.chatPhotoWidth;
    final height = Dimens.chatPhotoHeight;
    final Widget content;
    if (local != null) {
      content = _OpensFullScreen(
        viewer: local.isVideo
            ? null
            : PhotoViewer.memory(local.bytes, semanticLabel: label),
        child: MediaPreview(
          media: local,
          semanticLabel: label,
          width: width,
          height: height,
        ),
      );
    } else if (videoUrl != null) {
      content = VideoBox.network(videoUrl, width: width, height: height);
    } else if (photoUrl != null) {
      content = _OpensFullScreen(
        viewer: PhotoViewer.network(photoUrl, semanticLabel: label),
        child: AppNetworkImage(
          photoUrl,
          semanticLabel: label,
          width: width,
          height: height,
        ),
      );
    } else {
      content = Container(
        width: width,
        height: height,
        color: AppColors.photoPlaceholder,
      );
    }
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.paddingExtraSmall),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.radius12),
        child: content,
      ),
    );
  }
}

/// Opens [viewer] on tap; without one (a clip) [child] handles taps itself.
class _OpensFullScreen extends StatelessWidget {
  const new({required this.viewer, required this.child});

  final PhotoViewer? viewer;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final viewer = this.viewer;
    if (viewer == null) return child;
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: () => viewer.open(context),
        child: Stack(
          children: [
            child,
            const Positioned.fill(child: TapLayer()),
          ],
        ),
      ),
    );
  }
}
