import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_button.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/conversation_bloc.dart';
import 'package:rapsap_ops_app/features/chat/presentation/widgets/message_bubble.dart';

/// Newest at the bottom; "Load older" at the top when there is more.
class MessageList extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<ConversationBloc>().state;
    final messages = state.messages;
    if (messages.isEmpty) {
      return AppMessageView(message: context.l10n.chatNoMessages);
    }
    final extra = state.hasMore ? 1 : 0;
    return ListView.separated(
      reverse: true,
      padding: Dimens.pagePadding,
      itemCount: messages.length + extra,
      separatorBuilder: (_, _) => 10.hSpace,
      itemBuilder: (context, i) {
        if (i == messages.length) {
          return Center(
            child: AppButton(
              label: context.l10n.chatLoadOlder,
              variant: AppButtonVariant.outline,
              expand: false,
              isLoading: state.loadingOlder,
              onPressed: () =>
                  context.read<ConversationBloc>().add(const OlderRequested()),
            ),
          );
        }
        return MessageBubble(message: messages[messages.length - 1 - i]);
      },
    );
  }
}
