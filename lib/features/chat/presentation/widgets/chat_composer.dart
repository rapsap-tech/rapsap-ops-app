import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/extensions/context_ext.dart';
import 'package:rapsap_ops_app/core/extensions/date_ext.dart';
import 'package:rapsap_ops_app/core/extensions/navigation_ext.dart';
import 'package:rapsap_ops_app/core/router/route_names.dart';
import 'package:rapsap_ops_app/core/router/route_paths.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/app_text_styles.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/core/widgets/app_svg_icon.dart';
import 'package:rapsap_ops_app/core/widgets/message_banner.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/conversation_bloc.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/pages/camera_page.dart';
import 'package:rapsap_ops_app/gen/assets.gen.dart';

/// Camera button (no gallery, CHAT-03), message box and send.
class ChatComposer extends StatefulWidget {
  const new({super.key});

  @override
  State<ChatComposer> createState() => _ChatComposerState();
}

class _ChatComposerState extends State<ChatComposer> {
  final TextEditingController _text = TextEditingController();

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  void _send() {
    final text = _text.text;
    if (text.trim().isEmpty) return;
    context.read<ConversationBloc>().add(MessageSubmitted(text: text));
    _text.clear();
  }

  Future<void> _capture(Conversation c) async {
    final bloc = context.read<ConversationBloc>();
    final media = await context.pushNamedOffHistory<MediaFile>(
      RouteNames.conversationCamera,
      pathParameters: {RoutePaths.conversationIdParam: c.id},
      extra: CameraPageArgs(title: c.title),
    );
    if (media != null) bloc.add(MessageSubmitted(media: media));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final state = context.watch<ConversationBloc>().state;
    final c = state.conversation;
    if (c == null) return const SizedBox.shrink();
    if (!c.canPost) {
      return Text(
        l10n.chatReadOnly,
        textAlign: TextAlign.center,
        style: AppTextStyles.base.s13.secondaryTextColor(),
      );
    }
    final mutedUntil = state.mutedUntil;
    if (mutedUntil != null && state.isMutedAt(DateTime.now())) {
      final locale = Localizations.localeOf(context).toLanguageTag();
      return MessageBanner(l10n.chatMutedNotice(mutedUntil.storeClock(locale)));
    }
    return Row(
      children: [
        IconButton(
          tooltip: l10n.cameraTakePhoto,
          onPressed: () => _capture(c),
          icon: AppSvgIcon(
            Assets.icons.camera,
            size: Dimens.iconSmall,
            color: AppColors.primaryDark,
          ),
        ),
        Expanded(
          child: TextField(
            controller: _text,
            minLines: 1,
            maxLines: 4,
            maxLength: AppConstants.chatMessageMaxLength,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) => _send(),
            decoration: InputDecoration(
              hintText: l10n.chatMessageHint,
              counterText: '',
            ),
          ),
        ),
        IconButton(
          tooltip: l10n.chatSend,
          onPressed: _send,
          icon: const Icon(Icons.send_rounded, color: AppColors.primary),
        ),
      ],
    );
  }
}
