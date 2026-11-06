import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/socket/chat_socket_service.dart';
import 'package:rapsap_ops_app/features/chat/data/datasources/fake_chat_remote_data_source.dart';
import 'package:rapsap_ops_app/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/get_older_messages.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/open_conversation.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/report_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/send_chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/set_conversation_muted.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/watch_conversation.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/conversation_bloc.dart';

import '../../helpers/signed_out_auth.dart';

void main() {
  late ConversationBloc bloc;

  setUp(() {
    final repo = ChatRepositoryImpl(
      FakeChatRemoteDataSource(),
      FakeChatSocketService(),
      SignedOutAuth(),
    );
    bloc = ConversationBloc(
      OpenConversation(repo),
      GetOlderMessages(repo),
      SendChatMessage(repo),
      ReportMessage(repo),
      SetConversationMuted(repo),
      WatchConversation(repo),
    )..add(const ConversationStarted('c-team'));
  });

  tearDown(() => bloc.close());

  Future<ChatMessage> send(String text) async {
    bloc.add(MessageSubmitted(text: text));
    await bloc.stream.firstWhere(
      (s) =>
          s.messages.last.status != MessageStatus.sending &&
          s.messages.last.text == text,
    );
    return bloc.state.messages.last;
  }

  test('a normal message is sent', () async {
    await bloc.stream.firstWhere((s) => s.conversation != null);
    expect((await send('Stock received')).status, MessageStatus.sent);
  });

  test(
    'OTP-like text is blocked; 3 blocks mute the sender (CHAT-07/08)',
    () async {
      await bloc.stream.firstWhere((s) => s.conversation != null);
      final first = await send('my otp is 482910');
      expect(first.status, MessageStatus.blocked);
      expect(first.blockReason, BlockReason.sensitive);
      await send('visit www.example.com');
      await send('password 1234');
      expect(bloc.state.isMutedAt(DateTime.now()), isTrue);
    },
  );
}
