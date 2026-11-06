import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/features/auth/data/models/otp_ticket_model.dart';
import 'package:rapsap_ops_app/features/team/data/models/team_models.dart';

abstract class TeamRemoteDataSource {
  Future<List<TeamMemberModel>> team();
  Future<TeamMemberModel> member(String id);
  Future<RoleCatalogModel> catalog();
  Future<({String id, bool smsSent})> create({
    required String phone,
    required String name,
    required List<String> roleIds,
    required List<String> extraTaskIds,
  });
  Future<void> resendInvite(String id);
  Future<void> updateRoles(String id, List<String> roleIds);
  Future<OtpTicketModel> startNumberChange(String id, String phone);
  Future<void> confirmNumberChange(String id, String phone, String otp);
  Future<void> setActive(String id, {required bool active});
}

Map<String, dynamic> _json(Object? d) => d! as Map<String, dynamic>;

/// Role and task ids are numbers on the server.
List<Object> _numericIds(List<String> ids) => [
  for (final id in ids) int.tryParse(id) ?? id,
];

@realApi
@LazySingleton(as: TeamRemoteDataSource)
class TeamRemoteDataSourceImpl implements TeamRemoteDataSource {
  const new(this._client);

  final DioClient _client;

  @override
  Future<List<TeamMemberModel>> team() => _client.get(
    ApiConstants.team.members,
    fromData: (d) => [
      for (final m in d! as List<dynamic>)
        TeamMemberModel.fromJson(m as Map<String, dynamic>),
    ],
  );

  @override
  Future<TeamMemberModel> member(String id) => _client.get(
    ApiConstants.team.member(id),
    fromData: (d) => TeamMemberModel.fromJson(_json(d)),
  );

  @override
  Future<RoleCatalogModel> catalog() => _client.get(
    ApiConstants.team.catalog,
    fromData: (d) => RoleCatalogModel.fromJson(_json(d)),
  );

  @override
  Future<({String id, bool smsSent})> create({
    required String phone,
    required String name,
    required List<String> roleIds,
    required List<String> extraTaskIds,
  }) => _client.post(
    ApiConstants.team.members,
    data: {
      'phone': phone,
      'name': name,
      'role_ids': _numericIds(roleIds),
      'extra_task_ids': _numericIds(extraTaskIds),
    },
    fromData: (d) {
      final json = _json(d);
      return (id: '${json['id']}', smsSent: json['sms_sent'] == true);
    },
  );

  @override
  Future<void> resendInvite(String id) =>
      _client.post(ApiConstants.team.resendInvite(id), fromData: (_) {});

  @override
  Future<void> updateRoles(String id, List<String> roleIds) => _client.put(
    ApiConstants.team.roles(id),
    data: {'role_ids': _numericIds(roleIds)},
    fromData: (_) {},
  );

  @override
  Future<OtpTicketModel> startNumberChange(String id, String phone) =>
      _client.post(
        ApiConstants.team.numberChange(id),
        data: {'phone': phone},
        fromData: (d) => OtpTicketModel.fromJson(_json(d)),
      );

  @override
  Future<void> confirmNumberChange(String id, String phone, String otp) =>
      _client.post(
        ApiConstants.team.numberChangeVerify(id),
        data: {'phone': phone, 'otp': otp},
        fromData: (_) {},
      );

  @override
  Future<void> setActive(String id, {required bool active}) => _client.put(
    ApiConstants.team.active(id),
    data: {'active': active},
    fromData: (_) {},
  );
}
