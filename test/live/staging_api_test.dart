import 'dart:async';
import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/core/network/network_events.dart';
import 'package:rapsap_ops_app/core/services/locks/tab_lock.dart';
import 'package:rapsap_ops_app/core/services/socket/chat_socket_service.dart';
import 'package:rapsap_ops_app/core/services/storage/local_storage_service.dart';
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart';
import 'package:rapsap_ops_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:rapsap_ops_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';
import 'package:rapsap_ops_app/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:rapsap_ops_app/features/chat/data/repositories/chat_repository_impl.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/data/repositories/checklist_repository_impl.dart';
import 'package:rapsap_ops_app/features/dsr/data/datasources/dsr_remote_data_source.dart';
import 'package:rapsap_ops_app/features/dsr/data/repositories/dsr_repository_impl.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';
import 'package:rapsap_ops_app/features/notifications/data/datasources/notification_remote_data_source.dart';
import 'package:rapsap_ops_app/features/notifications/data/repositories/notification_repository_impl.dart';
import 'package:rapsap_ops_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:rapsap_ops_app/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:rapsap_ops_app/features/review/data/datasources/review_remote_data_source.dart';
import 'package:rapsap_ops_app/features/review/data/repositories/review_repository_impl.dart';
import 'package:rapsap_ops_app/features/team/data/datasources/team_remote_data_source.dart';
import 'package:rapsap_ops_app/features/team/data/repositories/team_repository_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../helpers/always_online.dart';
import '../helpers/test_local_db.dart';

/// Read-only checks of every integrated endpoint against the real staging
/// API, through the app's own data sources, models and error mapping.
/// Skipped unless a staging login is given (never commit it):
///
/// `make test-live STAGING_PHONE=9xxxxxxxxx STAGING_OTP=123456`
const String _phone = String.fromEnvironment('STAGING_PHONE');
const String _otp = String.fromEnvironment('STAGING_OTP');

void main() {
  final skip = _phone.isEmpty || _otp.isEmpty || EnvConfig.instance.useFakeApi
      ? 'needs env/staging.json, STAGING_PHONE and STAGING_OTP'
      : null;

  late SecureStorageService storage;
  late DioClient client;
  late AuthRepositoryImpl auth;
  late User user;

  /// Fails the test with the mapped failure, so the report names it.
  T ok<T>(Either<Failure, T> result) =>
      result.match((f) => fail('API call failed: $f'), (value) => value);

  bool isManager() =>
      user.role == UserRole.storeManager || user.role == UserRole.admin;

  setUpAll(() async {
    if (skip != null) return;
    FlutterSecureStorage.setMockInitialValues({});
    SharedPreferences.setMockInitialValues({});
    PackageInfo.setMockInitialValues(
      appName: 'ops',
      packageName: 'ops',
      version: '1.0.0',
      buildNumber: '1',
      buildSignature: '',
    );
    storage = SecureStorageService(const FlutterSecureStorage());
    final events = NetworkEvents();
    client = DioClient(
      const AlwaysOnline(),
      storage,
      LocalStorageService(await SharedPreferences.getInstance()),
      events,
      await PackageInfo.fromPlatform(),
      TabLock.create(),
    );
    auth = AuthRepositoryImpl(
      AuthRemoteDataSourceImpl(client),
      storage,
      await openTestLocalDb(),
      events,
    );
    user = ok(await auth.verifyOtp(_phone, _otp));
  });

  group('auth', skip: skip, () {
    test('verify signed in and stored tokens', () async {
      expect(user.id, isNotEmpty);
      expect(await storage.accessToken, isNotNull);
    });

    test('GET /auth/me', () async {
      expect(ok(await auth.currentUser())?.id, user.id);
    });

    test('POST /auth/refresh rotates the tokens', () async {
      final refresh = await storage.refreshToken;
      final response = await client.post(
        ApiConstants.auth.refresh,
        data: {'refresh_token': refresh},
        fromData: (d) => d! as Map<String, dynamic>,
      );
      await storage.saveTokens(
        accessToken: response['access_token'] as String,
        refreshToken: response['refresh_token'] as String,
      );
      expect(response['refresh_token'], isNot(refresh));
      expect(ok(await auth.currentUser())?.id, user.id);
    });

    test('profile from /auth/me', () async {
      final repo = ProfileRepositoryImpl(ProfileRemoteDataSourceImpl(client));
      expect(ok(await repo.profile()).name, user.name);
    });
  });

  group('worker checklist', skip: skip, () {
    ChecklistRepositoryImpl repo() =>
        ChecklistRepositoryImpl(ChecklistRemoteDataSourceImpl(client));

    test('GET /checklist/today, /tasks/{id}, capture token', () async {
      final today = await repo().today();
      if (isManager() && today.isLeft()) {
        markTestSkipped('checklist is for assigned staff: $today');
        return;
      }
      final checklist = ok(today);
      if (checklist.tasks.isEmpty) {
        markTestSkipped('no tasks assigned today');
        return;
      }
      final task = checklist.tasks.first;
      expect(ok(await repo().taskDetail(task.id)).task.id, task.id);
      expect(ok(await repo().startCapture(task.id)).token, isNotEmpty);
    });
  });

  group('notifications', skip: skip, () {
    test('GET /notifications', () async {
      final repo = NotificationRepositoryImpl(
        NotificationRemoteDataSourceImpl(client),
      );
      ok(await repo.notifications());
    });
  });

  group('chat', skip: skip, () {
    late ChatRepositoryImpl repo;

    setUp(() {
      repo = ChatRepositoryImpl(
        ChatRemoteDataSourceImpl(client),
        FakeChatSocketService(),
        auth,
      );
    });

    test('GET conversations, one conversation and its messages', () async {
      final conversations = ok(await repo.conversations());
      expect(conversations, isNotEmpty, reason: 'staff join groups on login');
      final id = conversations.first.id;
      expect(ok(await repo.conversation(id)).id, id);
      final page = ok(await repo.messages(id));
      if (page.hasMore) {
        ok(await repo.messages(id, beforeId: page.messages.first.id));
      }
    });

    test('GET /chat/conversations/my-manager', () async {
      final result = await repo.managerConversation();
      // An SM has no manager chat; a store without an SM answers 404.
      if (isManager() || result.getLeft().toNullable() is NotFoundFailure) {
        markTestSkipped('no manager chat for this user: $result');
        return;
      }
      ok(result);
    });

    test('WebSocket accepts the auth frame', () async {
      final channel = WebSocketChannel.connect(
        Uri.parse(ApiConstants.chat.socket),
      );
      await channel.ready;
      final token = await storage.accessToken;
      channel.sink.add(jsonEncode({'type': 'auth', 'token': token}));
      final closed = Completer<void>();
      final subscription = channel.stream.listen(
        (_) {},
        onDone: closed.complete,
      );
      // The server closes within 5 s when the auth frame is rejected.
      await Future.any([
        closed.future,
        Future<void>.delayed(const Duration(seconds: 7)),
      ]);
      expect(channel.closeCode, isNull, reason: 'socket was closed');
      await subscription.cancel();
      await channel.sink.close();
    });
  });

  group('store manager', skip: skip, () {
    setUp(() {
      if (!isManager()) markTestSkipped('signed in as staff');
    });

    test('dashboard, review queue and detail', () async {
      if (!isManager()) return;
      final repo = ReviewRepositoryImpl(ReviewRemoteDataSourceImpl(client));
      ok(await repo.dashboard());
      final queue = ok(await repo.queue());
      if (queue.isEmpty) return;
      final detail = ok(await repo.detail(queue.first.taskId));
      expect(detail.item.taskId, queue.first.taskId);
    });

    test('team members, one member and the catalog', () async {
      if (!isManager()) return;
      final repo = TeamRepositoryImpl(TeamRemoteDataSourceImpl(client));
      final team = ok(await repo.team());
      final catalog = ok(await repo.catalog());
      expect(catalog.roles, isNotEmpty);
      if (team.isEmpty) return;
      expect(ok(await repo.member(team.first.id)).id, team.first.id);
    });

    test('DSR overview for every period', () async {
      if (!isManager()) return;
      final repo = DsrRepositoryImpl(DsrRemoteDataSourceImpl(client), auth);
      for (final period in TrendPeriod.values) {
        ok(await repo.overview(period));
      }
    });
  });
}
