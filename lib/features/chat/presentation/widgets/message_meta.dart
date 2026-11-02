import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';

/// "9:41 · ✓✓ Seen by 6", "Sending…" or "Failed — tap to retry".
class MessageMeta extends StatelessWidget {
  const new({required this.message, super.key});

  final ChatMessage message;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final time = message.sentAt.storeClock(locale);
    final style = AppTextStyles.base.s12.secondaryTextColor();
    return switch (message.status) {
      MessageStatus.sending => Text(l10n.chatSending, style: style),
      MessageStatus.failed => Text(
        l10n.chatFailedRetry,
        style: AppTextStyles.base.s12.w600.errorColor(),
      ),
      MessageStatus.blocked => const SizedBox.shrink(),
      MessageStatus.sent => Text(
        message.isMine && message.seenBy > 0
            ? l10n.chatSeenBy(time, message.seenBy)
            : time,
        style: style,
      ),
    };
  }
}
