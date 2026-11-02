import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/conversation_bloc.dart';
import 'package:rapsap_ops_app/features/chat/presentation/widgets/message_meta.dart';
import 'package:rapsap_ops_app/features/chat/presentation/widgets/message_photo.dart';

class MessageBubble extends StatelessWidget {
  const new({required this.message, super.key});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final blocked = message.status == MessageStatus.blocked;
    final failed = message.status == MessageStatus.failed;
    final mine = message.isMine;
    final text = message.text;
    final role = message.senderRole;
    final bubble = Container(
      constraints: BoxConstraints(
        maxWidth:
            MediaQuery.sizeOf(context).width * Dimens.bubbleMaxWidthFactor,
      ),
      padding: Dimens.tilePadding,
      decoration: BoxDecoration(
        color: blocked
            ? AppColors.errorSurface
            : mine
            ? AppColors.bubbleMine
            : AppColors.surface,
        borderRadius: BorderRadius.circular(Dimens.radius14),
        border: Border.all(
          color: blocked || failed ? AppColors.error : AppColors.border,
          width: Dimens.borderWidth,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!mine)
            Text(
              role == null
                  ? message.senderName
                  : context.l10n.chatSenderWithRole(message.senderName, role),
              style: AppTextStyles.base.s12.w600.primaryDarkColor(),
            ),
          if (blocked) ...[
            Text(
              context.l10n.chatNotSent,
              style: AppTextStyles.base.s14.w700.errorColor(),
            ),
            Text(
              MessageBlockedFailure(message.blockReason ?? BlockReason.abuse)
                  .message(context.l10n),
              style: AppTextStyles.base.s13.errorColor(),
            ),
          ] else ...[
            if (message.photoUrl != null || message.localPhoto != null)
              MessagePhoto(message: message),
            if (text != null && text.isNotEmpty)
              Text(text, style: AppTextStyles.base.s15),
          ],
          4.hSpace,
          MessageMeta(message: message),
        ],
      ),
    );
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: GestureDetector(
        onTap: failed
            ? () => context.read<ConversationBloc>().add(
                MessageRetried(message.id),
              )
            : null,
        onLongPress: mine || blocked ? null : () => _confirmReport(context),
        child: bubble,
      ),
    );
  }

  Future<void> _confirmReport(BuildContext context) async {
    final bloc = context.read<ConversationBloc>();
    final l10n = context.l10n;
    final report = await showModalBottomSheet<bool>(
      context: context,
      builder: (sheet) => SafeArea(
        child: ListTile(
          leading: const Icon(Icons.flag_outlined, color: AppColors.errorText),
          title: Text(
            l10n.chatReport,
            style: AppTextStyles.base.s15.errorColor(),
          ),
          onTap: () => Navigator.of(sheet).pop(true),
        ),
      ),
    );
    if (report ?? false) bloc.add(MessageReported(message.id));
  }
}
