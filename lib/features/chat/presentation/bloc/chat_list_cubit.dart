import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/get_conversations.dart';

/// Chat list for the Chat tab and its unread badge.
@injectable
class ChatListCubit extends LoadCubit<List<Conversation>> {
  new(GetConversations get) : super(get.call);
}
