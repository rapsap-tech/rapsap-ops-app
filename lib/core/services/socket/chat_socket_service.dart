import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

/// Live chat events as decoded JSON. Connects while someone listens.
abstract class ChatSocketService {
  Stream<Map<String, dynamic>> get events;

  /// Drops the connection (e.g. on logout).
  Future<void> disconnect();
}

@realApi
@LazySingleton(as: ChatSocketService)
class WebChatSocketService implements ChatSocketService {
  new(this._storage) {
    _events = StreamController<Map<String, dynamic>>.broadcast(
      onListen: _connect,
      onCancel: disconnect,
    );
  }

  final SecureStorageService _storage;
  late final StreamController<Map<String, dynamic>> _events;
  WebSocketChannel? _channel;
  StreamSubscription<dynamic>? _subscription;
  Timer? _retry;
  int _attempt = 0;

  /// Bumped on every close so callbacks from old sockets are ignored.
  int _generation = 0;

  @override
  Stream<Map<String, dynamic>> get events => _events.stream;

  Future<void> _connect() async {
    _close();
    final generation = _generation;
    final token = await _storage.accessToken;
    if (token == null || !_events.hasListener || generation != _generation) {
      return;
    }
    try {
      final channel = WebSocketChannel.connect(
        Uri.parse(ApiConstants.chat.socket),
      );
      await channel.ready;
      // Listeners left or a newer connect started during the handshake.
      if (generation != _generation || !_events.hasListener) {
        unawaited(channel.sink.close());
        return;
      }
      channel.sink.add(jsonEncode({'type': 'auth', 'token': token}));
      _channel = channel;
      _attempt = 0;
      _subscription = channel.stream.listen(
        _onData,
        onError: (Object error) {
          if (generation == _generation) _scheduleRetry(error);
        },
        onDone: () {
          if (generation == _generation) _scheduleRetry(null);
        },
      );
    } on Object catch (error) {
      if (generation == _generation) _scheduleRetry(error);
    }
  }

  void _onData(dynamic raw) {
    try {
      final data = jsonDecode('$raw');
      if (data is Map<String, dynamic>) _events.add(data);
    } on FormatException catch (error) {
      appLogger.w('Bad socket frame', error: error.runtimeType);
    }
  }

  /// Exponential backoff, capped, while there are listeners.
  void _scheduleRetry(Object? error) {
    if (error != null) {
      appLogger.w('Chat socket dropped', error: error.runtimeType);
    }
    _close();
    if (!_events.hasListener) return;
    final delay =
        AppConstants.socketRetryBase * math.pow(2, _attempt++).toInt();
    _retry = Timer(
      delay > AppConstants.socketRetryMax ? AppConstants.socketRetryMax : delay,
      () => unawaited(_connect()),
    );
  }

  void _close() {
    _generation++;
    _retry?.cancel();
    unawaited(_subscription?.cancel());
    unawaited(_channel?.sink.close());
    _subscription = null;
    _channel = null;
  }

  @override
  Future<void> disconnect() async {
    _close();
    _attempt = 0;
  }
}

/// No server in fake mode: nothing arrives live.
@fakeApi
@LazySingleton(as: ChatSocketService)
class FakeChatSocketService implements ChatSocketService {
  @override
  Stream<Map<String, dynamic>> get events => const Stream.empty();

  @override
  Future<void> disconnect() async {}
}
