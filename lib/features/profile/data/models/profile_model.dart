import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/profile/domain/entities/profile.dart';

part 'profile_model.freezed.dart';
part 'profile_model.g.dart';

@freezed
abstract class ProfileModel with _$ProfileModel {
  const factory({
    required String name,
    required String employeeId,
    required String phone,
    required String storeName,
    required String reportsTo,
    @Default(<String>[]) List<String> tags,
    @Default(0) int onTimePercent,
    @Default(0) int doneThisMonth,
    @Default(0) int missedThisMonth,
    String? emergencyContact,
  }) = _ProfileModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

  Profile toEntity() => Profile(
    name: name,
    tags: tags,
    employeeId: employeeId,
    phone: phone,
    storeName: storeName,
    reportsTo: reportsTo,
    onTimePercent: onTimePercent,
    doneThisMonth: doneThisMonth,
    missedThisMonth: missedThisMonth,
    emergencyContact: emergencyContact,
  );
}
