import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/get_manager_conversation.dart';

class ManagerChatState extends Equatable {
  const new({this.loading = false, this.conversationId, this.failure});

  final bool loading;
  final String? conversationId;
  final Failure? failure;

  @override
  List<Object?> get props => [loading, conversationId, failure];
}

/// "Message my SM": finds the one-to-one chat with the store manager.
@injectable
class ManagerChatCubit extends Cubit<ManagerChatState> {
  new(this._get) : super(const ManagerChatState());

  final GetManagerConversation _get;

  Future<void> open() async {
    if (state.loading) return;
    emit(const ManagerChatState(loading: true));
    final result = await _get();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => ManagerChatState(failure: failure),
        (c) => ManagerChatState(conversationId: c.id),
      ),
    );
  }
}
