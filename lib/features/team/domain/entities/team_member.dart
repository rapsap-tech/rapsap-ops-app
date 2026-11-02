import 'package:equatable/equatable.dart';

enum MemberStatus { active, invited, deactivated }

class JobRole extends Equatable {
  const new({required this.id, required this.name});

  final String id;
  final String name;

  @override
  List<Object?> get props => [id, name];
}

class TaskTemplate extends Equatable {
  const new({
    required this.id,
    required this.number,
    required this.title,
    required this.roleIds,
  });

  final String id;
  final int number;
  final String title;
  final List<String> roleIds;

  @override
  List<Object?> get props => [id, number, title, roleIds];
}

class TeamMember extends Equatable {
  const new({
    required this.id,
    required this.name,
    required this.roles,
    required this.status,
    required this.phone,
    this.since,
  });

  final String id;
  final String name;
  final List<JobRole> roles;
  final MemberStatus status;
  final String phone;

  /// When the invite SMS went out, or when the login was deactivated.
  final DateTime? since;

  @override
  List<Object?> get props => [id, name, roles, status, phone, since];
}

/// Roles and task catalogue for creating or editing a login.
class RoleCatalog extends Equatable {
  const new({required this.roles, required this.tasks});

  final List<JobRole> roles;
  final List<TaskTemplate> tasks;

  List<TaskTemplate> tasksFor(Set<String> roleIds) => [
    for (final t in tasks)
      if (t.roleIds.any(roleIds.contains)) t,
  ];

  @override
  List<Object?> get props => [roles, tasks];
}

class NewLogin extends Equatable {
  const new({
    required this.phone,
    required this.name,
    required this.roleIds,
    this.extraTaskIds = const {},
  });

  final String phone;
  final String name;
  final Set<String> roleIds;
  final Set<String> extraTaskIds;

  @override
  List<Object?> get props => [phone, name, roleIds, extraTaskIds];
}

class CreateLoginResult extends Equatable {
  const new({required this.memberId, required this.smsSent});

  final String memberId;
  final bool smsSent;

  @override
  List<Object?> get props => [memberId, smsSent];
}
