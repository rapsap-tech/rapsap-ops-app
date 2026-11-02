part of 'conversation_bloc.dart';

sealed class ConversationEvent extends Equatable {
  const new();

  @override
  List<Object?> get props => [];
}

class ConversationStarted extends ConversationEvent {
  const new(this.id);
  final String id;

  @override
  List<Object?> get props => [id];
}

class OlderRequested extends ConversationEvent {
  const new();
}

class MessageSubmitted extends ConversationEvent {
  const new({this.text, this.photo});
  final String? text;
  final Uint8List? photo;

  @override
  List<Object?> get props => [text, photo];
}

class MessageRetried extends ConversationEvent {
  const new(this.id);
  final String id;

  @override
  List<Object?> get props => [id];
}

class MessageReported extends ConversationEvent {
  const new(this.id);
  final String id;

  @override
  List<Object?> get props => [id];
}

class MuteToggled extends ConversationEvent {
  const new();
}

class _LiveArrived extends ConversationEvent {
  const new(this.message);
  final ChatMessage message;

  @override
  List<Object?> get props => [message];
}
