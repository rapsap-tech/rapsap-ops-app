import 'dart:async';

import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/entities/conversation.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/get_older_messages.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/open_conversation.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/report_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/send_chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/set_conversation_muted.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/watch_conversation.dart';

part 'conversation_event.dart';
part 'conversation_state.dart';

/// One chat: loads the latest page, "load older", optimistic sends with
/// tap-to-retry, moderation blocks, live messages, report and mute.
@injectable
class ConversationBloc extends Bloc<ConversationEvent, ConversationState> {
  new(
    this._open,
    this._older,
    this._send,
    this._report,
    this._mute,
    this._watch,
  ) : super(const ConversationState()) {
    on<ConversationStarted>(_onStarted, transformer: restartable());
    on<OlderRequested>(_onOlder, transformer: droppable());
    on<MessageSubmitted>(_onSubmitted, transformer: sequential());
    on<MessageRetried>(_onRetried, transformer: sequential());
    on<MessageReported>(_onReported, transformer: droppable());
    on<MuteToggled>(_onMuteToggled, transformer: droppable());
    on<_LiveArrived>(_onLive);
  }

  final OpenConversation _open;
  final GetOlderMessages _older;
  final SendChatMessage _send;
  final ReportMessage _report;
  final SetConversationMuted _mute;
  final WatchConversation _watch;
  StreamSubscription<ChatMessage>? _live;
  late String _id;

  Future<void> _onStarted(
    ConversationStarted event,
    Emitter<ConversationState> emit,
  ) async {
    _id = event.id;
    emit(const ConversationState());
    final result = await _open(event.id);
    result.match(
      (failure) =>
          emit(state.copyWith(status: LoadStatus.failure, failure: failure)),
      (data) {
        final (conversation, page) = data;
        emit(
          state.copyWith(
            status: LoadStatus.success,
            conversation: conversation,
            messages: page.messages,
            hasMore: page.hasMore,
          ),
        );
        unawaited(_live?.cancel());
        // The page may have closed while loading; don't open a socket then.
        if (emit.isDone || isClosed) return;
        _live = _watch(event.id).listen((m) {
          if (!isClosed) add(_LiveArrived(m));
        });
      },
    );
  }

  Future<void> _onOlder(
    OlderRequested event,
    Emitter<ConversationState> emit,
  ) async {
    if (!state.hasMore || state.messages.isEmpty) return;
    emit(state.copyWith(loadingOlder: true));
    final result = await _older(_id, state.messages.first.id);
    result.match(
      (failure) => emit(state.copyWith(loadingOlder: false, notice: failure)),
      (page) => emit(
        state.copyWith(
          loadingOlder: false,
          hasMore: page.hasMore,
          messages: [...page.messages, ...state.messages],
        ),
      ),
    );
  }

  Future<void> _onSubmitted(
    MessageSubmitted event,
    Emitter<ConversationState> emit,
  ) async {
    final text = event.text?.trim();
    if ((text == null || text.isEmpty) && event.media == null) return;
    final draft = ChatMessage(
      id: 'local-${DateTime.now().microsecondsSinceEpoch}',
      senderName: '',
      isMine: true,
      sentAt: DateTime.now(),
      text: text,
      localMedia: event.media,
      status: MessageStatus.sending,
    );
    emit(state.copyWith(messages: [...state.messages, draft]));
    await _deliver(draft, emit);
  }

  Future<void> _onRetried(
    MessageRetried event,
    Emitter<ConversationState> emit,
  ) async {
    final draft = state.messages.where((m) => m.id == event.id).firstOrNull;
    if (draft == null || draft.status != MessageStatus.failed) return;
    _replace(draft.id, draft.withStatus(MessageStatus.sending), emit);
    await _deliver(draft, emit);
  }

  Future<void> _deliver(
    ChatMessage draft,
    Emitter<ConversationState> emit,
  ) async {
    final result = await _send(_id, draft);
    result.match(
      (failure) {
        if (failure is MessageBlockedFailure) {
          _replace(
            draft.id,
            draft.withStatus(
              MessageStatus.blocked,
              blockReason: failure.reason,
            ),
            emit,
          );
          if (failure.mutedUntil != null) {
            emit(state.copyWith(mutedUntil: failure.mutedUntil));
          }
        } else {
          _replace(draft.id, draft.withStatus(MessageStatus.failed), emit);
        }
      },
      (sent) {
        // The socket may already have delivered our own message.
        emit(
          state.copyWith(
            messages: [
              for (final m in state.messages)
                if (m.id != sent.id || m.id == draft.id) m,
            ],
          ),
        );
        _replace(draft.id, sent, emit);
      },
    );
  }

  Future<void> _onReported(
    MessageReported event,
    Emitter<ConversationState> emit,
  ) async {
    final result = await _report(event.id);
    emit(
      result.match(
        (failure) => state.copyWith(notice: failure),
        (_) => state.copyWith(reportedId: event.id),
      ),
    );
  }

  Future<void> _onMuteToggled(
    MuteToggled event,
    Emitter<ConversationState> emit,
  ) async {
    final conversation = state.conversation;
    if (conversation == null) return;
    final muted = !conversation.muted;
    emit(state.copyWith(conversation: conversation.copyWith(muted: muted)));
    final result = await _mute(_id, muted: muted);
    result.match(
      (failure) =>
          emit(state.copyWith(conversation: conversation, notice: failure)),
      (_) {},
    );
  }

  void _onLive(_LiveArrived event, Emitter<ConversationState> emit) {
    if (state.messages.any((m) => m.id == event.message.id)) return;
    emit(state.copyWith(messages: [...state.messages, event.message]));
  }

  void _replace(
    String id,
    ChatMessage message,
    Emitter<ConversationState> emit,
  ) {
    emit(
      state.copyWith(
        messages: [
          for (final m in state.messages)
            if (m.id == id) message else m,
        ],
      ),
    );
  }

  @override
  Future<void> close() async {
    await _live?.cancel();
    await super.close();
  }
}
