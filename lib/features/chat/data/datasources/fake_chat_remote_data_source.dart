import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:rapsap_ops_app/features/chat/data/models/chat_models.dart';

/// Sample chats with the server's moderation rules imitated: links, OTP or
/// password-like text and a few abusive words are blocked; 3 blocks mute
/// the sender for 24 hours.
@fakeApi
@LazySingleton(as: ChatRemoteDataSource)
class FakeChatRemoteDataSource implements ChatRemoteDataSource {
  static const Duration _latency = Duration(milliseconds: 400);
  static const int _blocksBeforeMute = 3;
  static const Duration _muteFor = Duration(hours: 24);
  static final RegExp _link = RegExp(r'(https?://|www\.|\.(com|in|net)\b)');
  static final RegExp _sensitive = RegExp(
    r'(\b\d{4,}\b|otp|password|aadhaar|pan\b)',
    caseSensitive: false,
  );
  static final RegExp _abuse = RegExp(
    r'\b(idiot|stupid|bewakoof)\b',
    caseSensitive: false,
  );

  final DateTime _now = DateTime.now();
  late final Map<String, ConversationModel> _conversations = {
    for (final c in _seedConversations()) c.id: c,
  };
  late final Map<String, List<ChatMessageModel>> _messages = _seedMessages();
  int _blocks = 0;
  DateTime? _mutedUntil;

  @override
  Future<List<ConversationModel>> conversations() async {
    await Future<void>.delayed(_latency);
    return _conversations.values.toList();
  }

  @override
  Future<ConversationModel> conversation(String id) async {
    await Future<void>.delayed(_latency);
    final c = _conversations[id];
    if (c == null) throw const NotFoundException();
    _conversations[id] = c.copyWith(unread: 0);
    return c;
  }

  @override
  Future<ConversationModel> managerConversation() => conversation('c-rahul');

  @override
  Future<MessagePageModel> messages(String id, {String? beforeId}) async {
    await Future<void>.delayed(_latency);
    return MessagePageModel(messages: _messages[id] ?? const []);
  }

  @override
  Future<ChatMessageModel> sendText(
    String id,
    String clientId,
    String text,
  ) async {
    await Future<void>.delayed(_latency);
    _moderate(text);
    return _append(
      id,
      ChatMessageModel(
        id: clientId,
        senderName: 'Priya',
        sentAt: DateTime.now(),
        isMine: true,
        text: text,
      ),
    );
  }

  @override
  Future<ChatMessageModel> sendMedia(
    String id,
    String clientId,
    MediaFile media,
  ) async {
    await Future<void>.delayed(_latency);
    _moderate('');
    return _append(
      id,
      ChatMessageModel(
        id: clientId,
        senderName: 'Priya',
        sentAt: DateTime.now(),
        isMine: true,
      ),
    );
  }

  @override
  Future<void> report(String messageId) => Future<void>.delayed(_latency);

  @override
  Future<void> setMuted(String id, {required bool muted}) async {
    await Future<void>.delayed(_latency);
    final c = _conversations[id];
    if (c != null) _conversations[id] = c.copyWith(muted: muted);
  }

  void _moderate(String text) {
    final until = _mutedUntil;
    if (until != null && DateTime.now().isBefore(until)) {
      throw MessageBlockedException('muted', mutedUntil: until);
    }
    final reason = _link.hasMatch(text)
        ? 'link'
        : _sensitive.hasMatch(text)
        ? 'sensitive'
        : _abuse.hasMatch(text)
        ? 'abuse'
        : null;
    if (reason == null) return;
    if (++_blocks >= _blocksBeforeMute) {
      _mutedUntil = DateTime.now().add(_muteFor);
    }
    throw MessageBlockedException(reason, mutedUntil: _mutedUntil);
  }

  ChatMessageModel _append(String id, ChatMessageModel message) {
    (_messages[id] ??= []).add(message);
    final c = _conversations[id];
    if (c != null) {
      _conversations[id] = c.copyWith(
        lastPreview: message.text,
        lastAt: message.sentAt,
      );
    }
    return message;
  }

  List<ConversationModel> _seedConversations() {
    DateTime ago(int m) => _now.subtract(Duration(minutes: m));
    return [
      ConversationModel(
        id: 'c-team',
        title: 'Walk · Store Team',
        kind: 'group',
        memberCount: 11,
        unread: 2,
        lastPreview: 'Rahul: Stock arriving at 4, GRN team…',
        lastAt: ago(40),
        pinnedText: 'Shop opens 7:30 sharp from Monday',
      ),
      ConversationModel(
        id: 'c-checklist',
        title: 'Walk - Checklist',
        kind: 'group',
        memberCount: 12,
        unread: 1,
        lastPreview: 'Santosh: #22 Chiller temperature · Trading',
        lastAt: ago(20),
        pinnedText:
            'Checklist photos post here automatically. '
            "Don't post them by hand.",
      ),
      ConversationModel(
        id: 'c-announcements',
        title: 'Rapsap Announcements',
        kind: 'announcements',
        memberCount: 240,
        canPost: false,
        lastPreview: 'HO: Diwali store timings',
        lastAt: ago(60 * 24),
      ),
      ConversationModel(
        id: 'c-rahul',
        title: 'Rahul Shinde',
        kind: 'direct',
        memberCount: 2,
        lastPreview: 'Ok, noted',
        lastAt: ago(60 * 26),
      ),
    ];
  }

  Map<String, List<ChatMessageModel>> _seedMessages() {
    DateTime ago(int m) => _now.subtract(Duration(minutes: m));
    return {
      'c-team': [
        ChatMessageModel(
          id: 'm1',
          senderName: 'Rahul',
          senderRole: 'SM',
          sentAt: ago(42),
          text: 'Stock arriving at 4, GRN team be ready',
        ),
        ChatMessageModel(
          id: 'm2',
          senderName: 'Priya',
          sentAt: ago(41),
          isMine: true,
          text: 'Ok sir',
          seenBy: 6,
        ),
        ChatMessageModel(
          id: 'm3',
          senderName: 'Kavita',
          senderRole: 'ASM',
          sentAt: ago(30),
          text: 'Chiller 2 door seal is loose, noted in the register.',
        ),
      ],
      'c-announcements': [
        ChatMessageModel(
          id: 'm4',
          senderName: 'HO',
          sentAt: ago(60 * 24),
          text: 'Diwali store timings: 8 AM to 11 PM from 1 to 5 Nov.',
        ),
      ],
      'c-rahul': [
        ChatMessageModel(
          id: 'm5',
          senderName: 'Priya',
          sentAt: ago(60 * 26),
          isMine: true,
          text: 'Leaving 15 min early today, informed the ASM.',
          seenBy: 1,
        ),
        ChatMessageModel(
          id: 'm6',
          senderName: 'Rahul',
          senderRole: 'SM',
          sentAt: ago(60 * 26 - 2),
          text: 'Ok, noted',
        ),
      ],
    };
  }
}
