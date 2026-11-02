import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/failure_ext.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/app_loader.dart';
import 'package:rapsap_ops_app/core/widgets/app_scaffold.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/conversation_bloc.dart';
import 'package:rapsap_ops_app/features/chat/presentation/widgets/chat_composer.dart';
import 'package:rapsap_ops_app/features/chat/presentation/widgets/conversation_header.dart';
import 'package:rapsap_ops_app/features/chat/presentation/widgets/message_list.dart';

/// B11 · Group / direct chat.
class ConversationPage extends StatelessWidget {
  const new({required this.conversationId, super.key});

  final String conversationId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          getIt<ConversationBloc>()..add(ConversationStarted(conversationId)),
      child: BlocListener<ConversationBloc, ConversationState>(
        listenWhen: (prev, next) =>
            next.notice != null ||
            (next.reportedId != null && prev.reportedId == null),
        listener: (context, state) {
          final notice = state.notice;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                notice == null
                    ? context.l10n.chatReported
                    : notice.message(context.l10n),
              ),
            ),
          );
        },
        child: const AppScaffold(
          header: ConversationHeader(),
          body: _Body(),
          footer: ChatComposer(),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) {
    final status = context.select<ConversationBloc, LoadStatus>(
      (b) => b.state.status,
    );
    return switch (status) {
      LoadStatus.loading => const Center(child: AppLoader()),
      LoadStatus.failure => AppMessageView(
        message:
            context.read<ConversationBloc>().state.failure?.message(
              context.l10n,
            ) ??
            context.l10n.errorUnknown,
      ),
      LoadStatus.success => const MessageList(),
    };
  }
}
