import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/media_preview.dart';
import 'package:rapsap_ops_app/core/widgets/video_box.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';

/// The photo or clip in a message: the local copy while sending, else the
/// server copy.
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
    final placeholder = Container(
      width: width,
      height: height,
      color: AppColors.photoPlaceholder,
    );
    final Widget content;
    if (local != null) {
      content = MediaPreview(
        media: local,
        semanticLabel: label,
        width: width,
        height: height,
      );
    } else if (videoUrl != null) {
      content = VideoBox.network(videoUrl, width: width, height: height);
    } else if (photoUrl != null) {
      content = Image.network(
        photoUrl,
        width: width,
        height: height,
        fit: BoxFit.cover,
        semanticLabel: label,
        errorBuilder: (_, _, _) => placeholder,
      );
    } else {
      content = placeholder;
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
