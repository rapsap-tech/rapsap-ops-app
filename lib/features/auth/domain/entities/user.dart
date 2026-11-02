import 'package:equatable/equatable.dart';

enum UserRole { staff, storeManager, admin }

class User extends Equatable {
  const new({
    required this.id,
    required this.name,
    required this.role,
    required this.jobRoles,
    required this.storeName,
    required this.consentAccepted,
  });

  final String id;
  final String name;
  final UserRole role;
  final List<String> jobRoles;
  final String storeName;
  final bool consentAccepted;

  User copyWith({bool? consentAccepted}) => User(
    id: id,
    name: name,
    role: role,
    jobRoles: jobRoles,
    storeName: storeName,
    consentAccepted: consentAccepted ?? this.consentAccepted,
  );

  @override
  List<Object?> get props => [
    id,
    name,
    role,
    jobRoles,
    storeName,
    consentAccepted,
  ];
}
