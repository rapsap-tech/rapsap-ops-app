import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/constants/api_constants.dart';
import 'package:rapsap_ops_app/core/network/dio_client.dart';
import 'package:rapsap_ops_app/features/profile/data/models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> profile();
}

@realApi
@LazySingleton(as: ProfileRemoteDataSource)
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  const new(this._client);

  final DioClient _client;

  @override
  Future<ProfileModel> profile() => _client.get(
    ApiConstants.me.profile,
    fromData: (data) => ProfileModel.fromJson(data! as Map<String, dynamic>),
  );
}

@fakeApi
@LazySingleton(as: ProfileRemoteDataSource)
class FakeProfileRemoteDataSource implements ProfileRemoteDataSource {
  @override
  Future<ProfileModel> profile() async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return const ProfileModel(
      name: 'Priya',
      tags: ['Housekeeping', 'Staff'],
      employeeId: 'RAP-04-017',
      phone: '9876543001',
      storeName: 'Walk Hiranandani',
      reportsTo: 'Rahul Shinde',
      onTimePercent: 91,
      doneThisMonth: 168,
      missedThisMonth: 4,
      emergencyContact: 'Sunita Pawar · Spouse · 98XXXXX455',
    );
  }
}
