import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/features/auth/data/models/user_model.dart';
import 'package:rapsap_ops_app/features/chat/data/models/chat_models.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/task_detail_model.dart';
import 'package:rapsap_ops_app/features/checklist/data/models/today_checklist_model.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';
import 'package:rapsap_ops_app/features/dsr/data/models/dsr_models.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/dsr_check.dart';
import 'package:rapsap_ops_app/features/notifications/data/models/app_notification_model.dart';
import 'package:rapsap_ops_app/features/review/data/models/review_models.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/team/data/models/team_models.dart';
import 'package:rapsap_ops_app/features/team/domain/entities/team_member.dart';

/// Responses copied from rapsap-operations-api services (numeric ids, nulls).
void main() {
  test('user with a numeric id and no store', () {
    final user = UserModel.fromJson({
      'id': 42,
      'name': 'Admin',
      'role': 'admin',
      'store_name': null,
      'job_roles': <String>[],
      'consent_accepted': true,
    }).toEntity();
    expect(user.id, '42');
    expect(user.storeName, '');
  });

  test('checklist with no open section and an untimed task', () {
    final today = TodayChecklistModel.fromJson({
      'date': '2026-11-06',
      'shift': null,
      'sections': [
        {
          'name': 'back_store',
          'opens_at': null,
          'closes_at': null,
          'tasks': [
            {
              'id': '7',
              'number': 7,
              'title': 'Check stock',
              'section': 'back_store',
              'opens_at': null,
              'due_at': null,
              'status': 'pending',
            },
          ],
        },
      ],
    }).toEntity();
    final task = today.tasks.single;
    expect(today.shift, isNull);
    expect(task.opensAt, DateTime(2026, 11, 6));
    expect(task.dueAt, DateTime(2026, 11, 7));
  });

  test('a section name maps to the mid shift', () {
    final today = TodayChecklistModel.fromJson({
      'date': '2026-11-06',
      'shift': 'trading',
      'sections': <Object>[],
    }).toEntity();
    expect(today.shift, Shift.mid);
  });

  test('task detail moves a clip out of photo_url', () {
    final detail = TaskDetailModel.fromJson({
      'task': {
        'id': '7',
        'number': 7,
        'title': 'Check stock',
        'opens_at': '2026-11-06T08:00:00+05:30',
        'due_at': '2026-11-06T09:00:00+05:30',
        'status': 'submitted',
      },
      'section': 'opening',
      'assigned_to': null,
      'photo_hint': 'Check stock',
      'manager_name': null,
      'checklist_group': null,
      'photo_url': 'https://blob.example/proof.mp4',
      'video_url': null,
    }).toEntity();
    expect(detail.photoUrl, isNull);
    expect(detail.videoUrl, 'https://blob.example/proof.mp4');
    expect(detail.assignedTo, '');
  });

  test('notification with a numeric id and no subtitle', () {
    final n = AppNotificationModel.fromJson({
      'id': 9,
      'title': 'Your login is ready',
      'subtitle': null,
      'created_at': '2026-11-06T10:00:00+05:30',
      'read': false,
      'target_type': null,
      'target_id': null,
    }).toEntity();
    expect(n.id, '9');
    expect(n.subtitle, '');
  });

  test("chat message is mine when sender_id is the user's id", () {
    final json = {
      'id': 5,
      'conversation_id': 3,
      'sender_id': 42,
      'sender_name': null,
      'text': 'hi',
      'photo_url': null,
      'video_url': null,
      'created_at': '2026-11-06T10:00:00+05:30',
    };
    final mine = ChatMessageModel.fromJson(json).toEntity(myId: '42');
    final theirs = ChatMessageModel.fromJson(json).toEntity(myId: '1');
    expect(mine.id, '5');
    expect(mine.isMine, isTrue);
    expect(theirs.isMine, isFalse);
    expect(mine.sentAt, DateTime.parse('2026-11-06T10:00:00+05:30'));
  });

  test('review detail takes staff and kind from the queue row', () {
    final queued = ReviewItemModel.fromJson({
      'task_id': 11,
      'number': 7,
      'title': 'Check stock',
      'section': 'opening',
      'staff_name': 'Priya',
      'staff_role': '',
      'kind': 'missed',
      'at': '2026-11-06T09:00:00+05:30',
      'reason': null,
    }).toEntity();
    final detail = ReviewDetailModel.fromJson({
      'item': {'id': '7', 'number': 7, 'title': 'Check stock', 'section': 'x'},
      'status': 'pending',
      'photo_url': null,
      'video_url': null,
      'locked_at': null,
      'unlock_minutes': 30,
    });
    expect(queued.taskId, '11');
    expect(detail.toEntity('11', queued).item.kind, ReviewKind.missed);
    expect(detail.toEntity('11', null).item.staffName, '');
  });

  test('team member role names get catalog ids', () {
    final member =
        TeamMemberModel.fromJson({
          'id': 3,
          'name': 'Priya',
          'phone': null,
          'status': 'invited',
          'roles': ['Cashier'],
          'access_level': null,
        }).toEntity(
          catalog: const [JobRole(id: '2', name: 'Cashier')],
        );
    expect(member.id, '3');
    expect(member.roles.single.id, '2');
    expect(member.status, MemberStatus.invited);
  });

  test('DSR overview, check and save shapes', () {
    final overview = SalesOverviewModel.fromJson({
      'date': '2026-11-06',
      'due_at': '2026-11-06T23:00:00+05:30',
      'sales_mtd': 1000,
      'target': 5000,
      'need_per_day': 167,
      'trend': [
        {'day': '2026-11-05', 'current': 500},
      ],
      'change_percent': 0,
      'history': [
        {'date': '2026-11-05', 'net_sales': 500, 'bills': 4, 'status': 'saved'},
      ],
      'todays_posting': {'net_sales': 500, 'bills': 4},
    }).toEntity();
    expect(overview.trend.single.day, 5);
    expect(overview.history.single.postedAt, isNull);
    expect(overview.todaysPosting?.date, DateTime(2026, 11, 6));

    final check = DsrCheckModel.fromJson({
      'upload_id': 12,
      'file_name': 'DSR.xlsx',
      'size': 100,
      'lines': [
        {'field': 'net_sales', 'value': 500, 'ok': true},
        {'field': 'daily_target', 'value': 160, 'ok': true},
      ],
      'warnings': <String>[],
      'replaces_existing': false,
    }).toEntity();
    expect(check.uploadId, '12');
    expect(check.lines.last.field, DsrField.dayTarget);
    expect(check.lines.first.value, '500');

    final saved = DsrSavedModel.fromJson({
      'date': '2026-11-06',
      'store_name': null,
      'sales': 500,
      'bills': 4,
      'mtd_percent': 20.45,
      'saved_at': '2026-11-06T22:00:00+05:30',
      'on_time': true,
    }).toEntity();
    expect(saved.mtdPercent, 20);
    expect(saved.storeName, '');
  });
}
