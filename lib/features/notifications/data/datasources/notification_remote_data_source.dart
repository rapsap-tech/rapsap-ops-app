import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/features/notifications/data/models/app_notification_model.dart';

abstract class NotificationRemoteDataSource {
  Future<List<AppNotificationModel>> notifications();
  Future<void> markRead(String id);
  Future<void> markAllRead();
}

@realApi
@LazySingleton(as: NotificationRemoteDataSource)
class NotificationRemoteDataSourceImpl implements NotificationRemoteDataSource {
  const new(this._client);

  final DioClient _client;

  @override
  Future<List<AppNotificationModel>> notifications() => _client.get(
    ApiConstants.notifications.list,
    fromData: (data) => [
      for (final item in data! as List<dynamic>)
        AppNotificationModel.fromJson(item as Map<String, dynamic>),
    ],
  );

  @override
  Future<void> markRead(String id) =>
      _client.post(ApiConstants.notifications.read(id), fromData: (_) {});

  @override
  Future<void> markAllRead() =>
      _client.post(ApiConstants.notifications.readAll, fromData: (_) {});
}

@fakeApi
@LazySingleton(as: NotificationRemoteDataSource)
class FakeNotificationRemoteDataSource implements NotificationRemoteDataSource {
  static const Duration _latency = Duration(milliseconds: 400);

  late List<AppNotificationModel> _items = _seed(DateTime.now());

  @override
  Future<List<AppNotificationModel>> notifications() async {
    await Future<void>.delayed(_latency);
    return _items;
  }

  @override
  Future<void> markRead(String id) async {
    _items = [
      for (final n in _items)
        if (n.id == id) n.copyWith(read: true) else n,
    ];
  }

  @override
  Future<void> markAllRead() async {
    await Future<void>.delayed(_latency);
    _items = [for (final n in _items) n.copyWith(read: true)];
  }

  static List<AppNotificationModel> _seed(DateTime now) {
    DateTime ago(int minutes) => now.subtract(Duration(minutes: minutes));
    return [
      AppNotificationModel(
        id: 'n1',
        title: 'Due in 15 min · #22 Chiller temperature',
        subtitle: 'Trading',
        createdAt: ago(3),
        targetType: 'task',
        targetId: 't-22--20',
      ),
      AppNotificationModel(
        id: 'n2',
        title: 'Sent back · #5 Photo is blurry, show the full shelf',
        subtitle: 'From Rahul (SM)',
        createdAt: ago(60),
        targetType: 'task',
        targetId: 't-5--150',
      ),
      AppNotificationModel(
        id: 'n3',
        title: 'Verified · #2 Lights, AC, signage working',
        subtitle: 'By Rahul (SM)',
        createdAt: ago(140),
        targetType: 'task',
        targetId: 't-2--180',
      ),
      AppNotificationModel(
        id: 'n4',
        title: 'Task missed · #11 Fire exits clear',
        subtitle: 'Ask your SM to unlock',
        createdAt: ago(150),
        targetType: 'task',
        targetId: 't-11--170',
      ),
      AppNotificationModel(
        id: 'n5',
        title: 'Rapsap Announcements · Diwali store timings',
        subtitle: 'HO',
        createdAt: ago(60 * 24),
        read: true,
        targetType: 'conversation',
        targetId: 'c-announcements',
      ),
    ];
  }
}
