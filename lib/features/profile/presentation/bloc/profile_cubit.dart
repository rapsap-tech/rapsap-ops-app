import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/features/profile/domain/entities/profile.dart';
import 'package:rapsap_ops_app/features/profile/domain/usecases/get_profile.dart';

@injectable
class ProfileCubit extends LoadCubit<Profile> {
  new(GetProfile getProfile) : super(getProfile.call);
}
