import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/profile/data/datasources/profile_remote_data_source.dart';
import 'package:rapsap_ops_app/features/profile/domain/entities/profile.dart';
import 'package:rapsap_ops_app/features/profile/domain/repositories/profile_repository.dart';

@LazySingleton(as: ProfileRepository)
class ProfileRepositoryImpl implements ProfileRepository {
  const new(this._remote);

  final ProfileRemoteDataSource _remote;

  @override
  Future<Either<Failure, Profile>> profile() =>
      guardFailure(() async => (await _remote.profile()).toEntity());
}
