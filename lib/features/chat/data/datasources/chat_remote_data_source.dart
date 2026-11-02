import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/features/chat/data/models/chat_models.dart';

abstract class ChatRemoteDataSource {
  Future<List<ConversationModel>> conversations();
  Future<ConversationModel> conversation(String id);
  Future<ConversationModel> managerConversation();
  Future<MessagePageModel> messages(String id, {String? beforeId});
  Future<ChatMessageModel> sendText(String id, String clientId, String text);
  Future<ChatMessageModel> sendPhoto(
    String id,
    String clientId,
    Uint8List photo,
  );
  Future<void> report(String messageId);
  Future<void> setMuted(String id, {required bool muted});
}

Map<String, dynamic> _json(Object? data) => data! as Map<String, dynamic>;

@realApi
@LazySingleton(as: ChatRemoteDataSource)
class ChatRemoteDataSourceImpl implements ChatRemoteDataSource {
  const new(this._client);

  final DioClient _client;

  @override
  Future<List<ConversationModel>> conversations() => _client.get(
    ApiConstants.chat.conversations,
    fromData: (data) => [
      for (final c in data! as List<dynamic>)
        ConversationModel.fromJson(c as Map<String, dynamic>),
    ],
  );

  @override
  Future<ConversationModel> conversation(String id) => _client.get(
    ApiConstants.chat.conversation(id),
    fromData: (data) => ConversationModel.fromJson(_json(data)),
  );

  @override
  Future<ConversationModel> managerConversation() => _client.get(
    ApiConstants.chat.managerConversation,
    fromData: (data) => ConversationModel.fromJson(_json(data)),
  );

  @override
  Future<MessagePageModel> messages(String id, {String? beforeId}) =>
      _client.get(
        ApiConstants.chat.messages(id),
        queryParameters: {'limit': AppConstants.pageSize, 'before': ?beforeId},
        fromData: (data) => MessagePageModel.fromJson(_json(data)),
      );

  @override
  Future<ChatMessageModel> sendText(String id, String clientId, String text) =>
      _client.post(
        ApiConstants.chat.messages(id),
        data: {'client_id': clientId, 'text': text},
        fromData: (data) => ChatMessageModel.fromJson(_json(data)),
      );

  @override
  Future<ChatMessageModel> sendPhoto(
    String id,
    String clientId,
    Uint8List photo,
  ) => _client.upload(
    ApiConstants.chat.photo(id),
    formData: FormData.fromMap({
      'client_id': clientId,
      'photo': MultipartFile.fromBytes(
        photo,
        filename: AppConstants.photoFileName,
        contentType: DioMediaType('image', 'jpeg'),
      ),
    }),
    fromData: (data) => ChatMessageModel.fromJson(_json(data)),
  );

  @override
  Future<void> report(String messageId) =>
      _client.post(ApiConstants.chat.report(messageId), fromData: (_) {});

  @override
  Future<void> setMuted(String id, {required bool muted}) => _client.put(
    ApiConstants.chat.mute(id),
    data: {'muted': muted},
    fromData: (_) {},
  );
}
