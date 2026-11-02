import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/auth/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  const factory({
    required String id,
    required String name,
    required String role,
    required String storeName,
    @Default(<String>[]) List<String> jobRoles,
    @Default(false) bool consentAccepted,
  }) = _UserModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  User toEntity() => User(
    id: id,
    name: name,
    role: switch (role) {
      'store_manager' => UserRole.storeManager,
      'admin' => UserRole.admin,
      _ => UserRole.staff,
    },
    jobRoles: jobRoles,
    storeName: storeName,
    consentAccepted: consentAccepted,
  );
}
