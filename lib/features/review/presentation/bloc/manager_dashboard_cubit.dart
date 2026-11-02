import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/manager_dashboard.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/get_manager_dashboard.dart';

@injectable
class ManagerDashboardCubit extends LoadCubit<ManagerDashboard> {
  new(GetManagerDashboard get) : super(get.call);
}
