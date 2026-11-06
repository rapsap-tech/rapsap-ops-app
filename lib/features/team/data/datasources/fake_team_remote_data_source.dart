import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/features/auth/data/models/otp_ticket_model.dart';
import 'package:rapsap_ops_app/features/team/data/datasources/team_remote_data_source.dart';
import 'package:rapsap_ops_app/features/team/data/models/team_models.dart';

/// Sample store team. Numbers starting 98765 4 already have a login; names
/// containing "nosms" simulate an SMS delivery failure (X7); OTP 000000 is
/// wrong when changing a number.
@fakeApi
@LazySingleton(as: TeamRemoteDataSource)
class FakeTeamRemoteDataSource implements TeamRemoteDataSource {
  static const Duration _latency = Duration(milliseconds: 400);
  static const String _takenPrefix = '987654';
  static const String _noSmsMarker = 'nosms';
  static const String _wrongOtp = '000000';

  static const List<JobRoleModel> _roles = [
    JobRoleModel(id: 'housekeeping', name: 'Housekeeping'),
    JobRoleModel(id: 'cashier', name: 'Cashier'),
    JobRoleModel(id: 'cashier_supervisor', name: 'Cashier Supervisor'),
    JobRoleModel(id: 'fnv', name: 'FNV Team'),
    JobRoleModel(id: 'security', name: 'Security'),
    JobRoleModel(id: 'asm', name: 'ASM'),
    JobRoleModel(id: 'grn', name: 'GRN Team'),
    JobRoleModel(id: 'maintenance', name: 'Maintenance'),
    JobRoleModel(id: 'it', name: 'IT'),
    JobRoleModel(id: 'store_admin', name: 'Store Admin'),
    JobRoleModel(id: 'hr', name: 'HR'),
  ];

  static String _role(String id) => _roles.firstWhere((r) => r.id == id).name;

  static const List<TaskTemplateModel> _tasks = [
    TaskTemplateModel(
      id: 'k3',
      number: 3,
      title: 'Entry area cleaned and sanitized',
      roleIds: ['housekeeping'],
    ),
    TaskTemplateModel(
      id: 'k4',
      number: 4,
      title: 'Baskets and trolleys clean',
      roleIds: ['housekeeping'],
    ),
    TaskTemplateModel(
      id: 'k13',
      number: 13,
      title: 'Floor cleanliness (3 times)',
      roleIds: ['housekeeping'],
    ),
    TaskTemplateModel(
      id: 'k29',
      number: 29,
      title: 'Washrooms cleaned',
      roleIds: ['housekeeping'],
    ),
    TaskTemplateModel(
      id: 'k9',
      number: 9,
      title: 'POS systems working',
      roleIds: ['cashier', 'it'],
    ),
    TaskTemplateModel(
      id: 'k20',
      number: 20,
      title: 'Queue time monitored',
      roleIds: ['cashier_supervisor'],
    ),
    TaskTemplateModel(
      id: 'k34',
      number: 34,
      title: 'Cash tally completed',
      roleIds: ['cashier'],
    ),
    TaskTemplateModel(
      id: 'k23',
      number: 23,
      title: 'Security checks',
      roleIds: ['security'],
    ),
    TaskTemplateModel(
      id: 'k22',
      number: 22,
      title: 'Chiller temperature',
      roleIds: ['maintenance'],
    ),
    TaskTemplateModel(
      id: 'k5',
      number: 5,
      title: 'Fresh produce display filled',
      roleIds: ['fnv'],
    ),
  ];

  late final Map<String, TeamMemberModel> _members = {
    for (final m in _seed(DateTime.now())) m.id: m,
  };

  @override
  Future<List<TeamMemberModel>> team() async {
    await Future<void>.delayed(_latency);
    return _members.values.toList();
  }

  @override
  Future<TeamMemberModel> member(String id) async {
    await Future<void>.delayed(_latency);
    return _members[id] ?? (throw const NotFoundException());
  }

  @override
  Future<RoleCatalogModel> catalog() async {
    await Future<void>.delayed(_latency);
    return const RoleCatalogModel(roles: _roles, tasks: _tasks);
  }

  @override
  Future<({String id, bool smsSent})> create({
    required String phone,
    required String name,
    required List<String> roleIds,
    required List<String> extraTaskIds,
  }) async {
    await Future<void>.delayed(_latency);
    if (phone.startsWith(_takenPrefix)) {
      throw const ValidationException({'phone': 'taken'});
    }
    final id = 'm-${_members.length + 1}';
    final smsSent = !name.toLowerCase().contains(_noSmsMarker);
    _members[id] = TeamMemberModel(
      id: id,
      name: name,
      status: 'invited',
      phone: phone,
      roles: [for (final r in roleIds) _role(r)],
      since: DateTime.now(),
    );
    return (id: id, smsSent: smsSent);
  }

  @override
  Future<void> resendInvite(String id) =>
      _update(id, (m) => m.copyWith(since: DateTime.now()));

  @override
  Future<void> updateRoles(String id, List<String> roleIds) => _update(
    id,
    (m) => m.copyWith(roles: [for (final r in roleIds) _role(r)]),
  );

  @override
  Future<OtpTicketModel> startNumberChange(String id, String phone) async {
    await Future<void>.delayed(_latency);
    if (phone.startsWith(_takenPrefix)) {
      throw const ValidationException({'phone': 'taken'});
    }
    return const OtpTicketModel();
  }

  @override
  Future<void> confirmNumberChange(String id, String phone, String otp) async {
    if (otp == _wrongOtp) {
      await Future<void>.delayed(_latency);
      throw const InvalidOtpException(4);
    }
    await _update(id, (m) => m.copyWith(phone: phone));
  }

  @override
  Future<void> setActive(String id, {required bool active}) => _update(
    id,
    (m) => m.copyWith(
      status: active ? 'active' : 'deactivated',
      since: active ? null : DateTime.now(),
    ),
  );

  Future<void> _update(
    String id,
    TeamMemberModel Function(TeamMemberModel) change,
  ) async {
    await Future<void>.delayed(_latency);
    final m = _members[id];
    if (m == null) throw const NotFoundException();
    _members[id] = change(m);
  }

  static List<TeamMemberModel> _seed(DateTime now) => [
    TeamMemberModel(
      id: 'm-1',
      name: 'Ramesh Patil',
      status: 'active',
      phone: '9820000003',
      roles: [_role('cashier'), _role('cashier_supervisor')],
    ),
    TeamMemberModel(
      id: 'm-2',
      name: 'Kavita Jadhav',
      status: 'active',
      phone: '9820000004',
      roles: [_role('asm'), _role('hr')],
    ),
    TeamMemberModel(
      id: 'm-3',
      name: 'Priya Naik',
      status: 'invited',
      phone: '9876511122',
      roles: [_role('housekeeping')],
      since: now.subtract(const Duration(days: 2)),
    ),
    TeamMemberModel(
      id: 'm-4',
      name: 'Santosh Pawar',
      status: 'active',
      phone: '9820000001',
      roles: [_role('maintenance'), _role('it'), _role('store_admin')],
    ),
    TeamMemberModel(
      id: 'm-5',
      name: 'Sunita More',
      status: 'deactivated',
      phone: '9820000009',
      roles: [_role('housekeeping')],
      since: now.subtract(const Duration(days: 20)),
    ),
  ];
}
