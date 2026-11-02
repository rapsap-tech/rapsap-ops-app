import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_avatar.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/chat_list_cubit.dart';

class ConversationTile extends StatelessWidget {
  const new({required this.conversation, super.key});

  final Conversation conversation;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toLanguageTag();
    final lastAt = conversation.lastAt;
    return InkWell(
      onTap: () => _open(context),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: Dimens.space14),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.divider,
              width: Dimens.borderWidth,
            ),
          ),
        ),
        child: Row(
          children: [
            AppAvatar(name: conversation.title),
            12.wSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    conversation.title,
                    style: AppTextStyles.base.s15.w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                  2.hSpace,
                  Text(
                    conversation.lastPreview ?? '',
                    style: AppTextStyles.base.s12.secondaryTextColor(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            8.wSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (lastAt != null)
                  Text(
                    lastAt.storeClock(locale),
                    style: AppTextStyles.base.s12.secondaryTextColor(),
                  ),
                4.hSpace,
                if (conversation.unread > 0)
                  Badge(
                    label: Text('${conversation.unread}'),
                    backgroundColor: conversation.muted
                        ? AppColors.disabled
                        : AppColors.primary,
                    textStyle: AppTextStyles.base.s11.w700,
                  )
                else if (conversation.muted)
                  Icon(
                    Icons.notifications_off_outlined,
                    size: Dimens.iconExtraSmall,
                    color: AppColors.textSecondary,
                    semanticLabel: context.l10n.chatMuted,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _open(BuildContext context) async {
    final list = context.read<ChatListCubit>();
    await context.pushNamed(
      RouteNames.conversation,
      pathParameters: {RoutePaths.conversationIdParam: conversation.id},
    );
    if (!list.isClosed) unawaited(list.load());
  }
}
