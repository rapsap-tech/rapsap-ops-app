import 'package:mocktail/mocktail.dart';
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart';
import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/network/network_events.dart';
import 'package:rapsap_ops_app/core/services/socket/chat_socket_service.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';
import 'package:rapsap_ops_app/features/auth/data/datasources/fake_auth_remote_data_source.dart';
import 'package:rapsap_ops_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:rapsap_ops_app/features/auth/domain/usecases/log_out.dart';
import 'package:rapsap_ops_app/features/auth/presentation/bloc/logout_cubit.dart';
import 'package:rapsap_ops_app/features/chat/data/datasources/fake_chat_remote_data_source.dart';
import 'package:rapsap_ops_app/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/get_conversations.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/get_manager_conversation.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/get_older_messages.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/open_conversation.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/report_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/send_chat_message.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/set_conversation_muted.dart';
import 'package:rapsap_ops_app/features/chat/domain/usecases/watch_conversation.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/chat_list_cubit.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/chat_search_cubit.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/conversation_bloc.dart';
import 'package:rapsap_ops_app/features/chat/presentation/bloc/manager_chat_cubit.dart';
import 'package:rapsap_ops_app/features/notifications/data/datasources/notification_remote_data_source.dart';
import 'package:rapsap_ops_app/features/notifications/data/repositories/notification_repository_impl.dart';
import 'package:rapsap_ops_app/features/notifications/domain/usecases/get_notifications.dart';
import 'package:rapsap_ops_app/features/notifications/domain/usecases/mark_all_notifications_read.dart';
import 'package:rapsap_ops_app/features/notifications/domain/usecases/mark_notification_read.dart';
import 'package:rapsap_ops_app/features/notifications/presentation/bloc/notifications_cubit.dart';
import 'package:rapsap_ops_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:rapsap_ops_app/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:rapsap_ops_app/features/profile/domain/usecases/get_profile.dart';
import 'package:rapsap_ops_app/features/profile/presentation/bloc/profile_cubit.dart';
import 'package:rapsap_ops_app/features/settings/data/datasources/settings_remote_data_source.dart';
import 'package:rapsap_ops_app/features/settings/data/repositories/settings_repository_impl.dart';
import 'package:rapsap_ops_app/features/settings/domain/usecases/get_notification_prefs.dart';
import 'package:rapsap_ops_app/features/settings/domain/usecases/save_notification_prefs.dart';
import 'package:rapsap_ops_app/features/settings/presentation/bloc/settings_cubit.dart';

import 'test_local_db.dart';

class _MockStorage extends Mock implements SecureStorageService;

/// Registers fake-backed cubits for the slice-2 pages in widget tests.
Future<void> registerAppCubits(SessionCubit session) async {
  final chat = ChatRepositoryImpl(
    FakeChatRemoteDataSource(),
    FakeChatSocketService(),
  );
  final notifications = NotificationRepositoryImpl(
    FakeNotificationRemoteDataSource(),
  );
  final settings = SettingsRepositoryImpl(FakeSettingsRemoteDataSource());
  final storage = _MockStorage();
  when(storage.clear).thenAnswer((_) async {});
  final auth = AuthRepositoryImpl(
    FakeAuthRemoteDataSource(storage),
    storage,
    await openTestLocalDb(),
    NetworkEvents(),
  );
  getIt
    ..registerFactory(() => ManagerChatCubit(GetManagerConversation(chat)))
    ..registerFactory(() => ChatListCubit(GetConversations(chat)))
    ..registerFactory(ChatSearchCubit.new)
    ..registerFactory(
      () => ConversationBloc(
        OpenConversation(chat),
        GetOlderMessages(chat),
        SendChatMessage(chat),
        ReportMessage(chat),
        SetConversationMuted(chat),
        WatchConversation(chat),
      ),
    )
    ..registerFactory(
      () => NotificationsCubit(
        GetNotifications(notifications),
        MarkNotificationRead(notifications),
        MarkAllNotificationsRead(notifications),
      ),
    )
    ..registerFactory(
      () => ProfileCubit(
        GetProfile(ProfileRepositoryImpl(FakeProfileRemoteDataSource())),
      ),
    )
    ..registerFactory(
      () => SettingsCubit(
        GetNotificationPrefs(settings),
        SaveNotificationPrefs(settings),
      ),
    )
    ..registerFactory(() => LogoutCubit(LogOut(auth), session));
}
