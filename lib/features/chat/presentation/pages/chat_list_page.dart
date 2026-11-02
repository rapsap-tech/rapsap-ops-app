import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_error_view.dart';
import 'package:rapsap_ops_app/core/widgets/load_state_view.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/chat_list_cubit.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/chat_search_cubit.dart';
import 'package:rapsap_ops_app/features/chat/presentation/widgets/conversation_tile.dart';

/// B10 · Chat list (Chat tab). [ChatListCubit] lives in the staff shell.
class ChatListPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<ChatSearchCubit>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              Dimens.paddingMedium,
              Dimens.space12,
              Dimens.paddingMedium,
              0,
            ),
            child: Text(
              context.l10n.chatTitle,
              style: AppTextStyles.base.s24.w700.l1,
            ),
          ),
          const _SearchField(),
          Expanded(
            child: LoadStateView<ChatListCubit, List<Conversation>>(
              isEmpty: (list) => list.isEmpty,
              emptyMessage: context.l10n.chatEmpty,
              builder: (context, list) => _ConversationList(all: list),
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const new();

  @override
  Widget build(BuildContext context) => Padding(
    padding: Dimens.pagePadding,
    child: TextField(
      onChanged: context.read<ChatSearchCubit>().changed,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: context.l10n.chatSearch,
        prefixIcon: const Icon(Icons.search_rounded),
      ),
    ),
  );
}

class _ConversationList extends StatelessWidget {
  const new({required this.all});

  final List<Conversation> all;

  @override
  Widget build(BuildContext context) {
    final query = context.watch<ChatSearchCubit>().state;
    final list = [
      for (final c in all)
        if (query.isEmpty || c.title.toLowerCase().contains(query)) c,
    ];
    if (list.isEmpty) return AppMessageView(message: context.l10n.chatNoMatch);
    return RefreshIndicator(
      onRefresh: context.read<ChatListCubit>().load,
      child: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: Dimens.paddingMedium),
        itemCount: list.length,
        itemBuilder: (_, i) => ConversationTile(conversation: list[i]),
      ),
    );
  }
}
