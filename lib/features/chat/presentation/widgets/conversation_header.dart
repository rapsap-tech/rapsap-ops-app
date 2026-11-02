import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/page_header.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/conversation_bloc.dart';

/// Title, member count, mute switch and the pinned message.
class ConversationHeader extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final c = context.select<ConversationBloc, Conversation?>(
      (b) => b.state.conversation,
    );
    final pinned = c?.pinnedText;
    return Column(
      children: [
        PageHeader(
          title: c?.title ?? '',
          subtitle: c == null || c.kind == ConversationKind.direct
              ? null
              : l10n.chatMembers(c.memberCount),
          trailing: c == null
              ? null
              : IconButton(
                  tooltip: c.muted ? l10n.chatUnmute : l10n.chatMute,
                  onPressed: () =>
                      context.read<ConversationBloc>().add(const MuteToggled()),
                  icon: Icon(
                    c.muted
                        ? Icons.notifications_off_outlined
                        : Icons.notifications_none_rounded,
                    color: AppColors.textPrimary,
                  ),
                ),
        ),
        if (pinned != null)
          Container(
            width: double.infinity,
            color: AppColors.pinnedSurface,
            padding: Dimens.bannerPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.chatPinned.toUpperCase(),
                  style: AppTextStyles.base.s11.w700.p7.secondaryTextColor(),
                ),
                2.hSpace,
                Text(pinned, style: AppTextStyles.base.s13.w600),
              ],
            ),
          ),
      ],
    );
  }
}
