import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';

class MessagePhoto extends StatelessWidget {
  const new({required this.message, super.key});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final local = message.localPhoto;
    final url = message.photoUrl;
    final label = context.l10n.chatPhoto;
    final placeholder = Container(
      width: Dimens.chatPhotoWidth,
      height: Dimens.chatPhotoHeight,
      color: AppColors.photoPlaceholder,
    );
    return Padding(
      padding: EdgeInsets.only(bottom: Dimens.paddingExtraSmall),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Dimens.radius12),
        child: local != null
            ? Image.memory(
                local,
                width: Dimens.chatPhotoWidth,
                height: Dimens.chatPhotoHeight,
                fit: BoxFit.cover,
                semanticLabel: label,
              )
            : url == null
            ? placeholder
            : Image.network(
                url,
                width: Dimens.chatPhotoWidth,
                height: Dimens.chatPhotoHeight,
                fit: BoxFit.cover,
                semanticLabel: label,
                errorBuilder: (_, _, _) => placeholder,
              ),
      ),
    );
  }
}
