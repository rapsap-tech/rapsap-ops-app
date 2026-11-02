import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  const new({
    required this.name,
    required this.tags,
    required this.employeeId,
    required this.phone,
    required this.storeName,
    required this.reportsTo,
    required this.onTimePercent,
    required this.doneThisMonth,
    required this.missedThisMonth,
    this.emergencyContact,
  });

  final String name;

  /// Job roles and access level, shown as chips (e.g. Maintenance, IT).
  final List<String> tags;
  final String employeeId;
  final String phone;
  final String storeName;
  final String reportsTo;
  final int onTimePercent;
  final int doneThisMonth;
  final int missedThisMonth;
  final String? emergencyContact;

  @override
  List<Object?> get props => [
    name,
    tags,
    employeeId,
    phone,
    storeName,
    reportsTo,
    onTimePercent,
    doneThisMonth,
    missedThisMonth,
    emergencyContact,
  ];
}
