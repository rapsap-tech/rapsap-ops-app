// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:package_info_plus/package_info_plus.dart' as _i655;
import 'package:rapsap_ops_app/core/bloc/connectivity_cubit.dart' as _i685;
import 'package:rapsap_ops_app/core/bloc/locale_cubit.dart' as _i844;
import 'package:rapsap_ops_app/core/bloc/session_cubit.dart' as _i1041;
import 'package:rapsap_ops_app/core/di/register_module.dart' as _i941;
import 'package:rapsap_ops_app/core/network/dio_client.dart' as _i1055;
import 'package:rapsap_ops_app/core/network/network_events.dart' as _i621;
import 'package:rapsap_ops_app/core/network/network_info.dart' as _i524;
import 'package:rapsap_ops_app/core/router/app_router.dart' as _i288;
import 'package:rapsap_ops_app/core/services/app_update/app_config_source.dart'
    as _i349;
import 'package:rapsap_ops_app/core/services/app_update/app_update_service.dart'
    as _i613;
import 'package:rapsap_ops_app/core/services/files/file_picker_service.dart'
    as _i65;
import 'package:rapsap_ops_app/core/services/install/install_service.dart'
    as _i600;
import 'package:rapsap_ops_app/core/services/locks/tab_lock.dart' as _i322;
import 'package:rapsap_ops_app/core/services/media/camera_service.dart'
    as _i869;
import 'package:rapsap_ops_app/core/services/media/photo_processor.dart'
    as _i886;
import 'package:rapsap_ops_app/core/services/permissions/permission_service.dart'
    as _i269;
import 'package:rapsap_ops_app/core/services/socket/chat_socket_service.dart'
    as _i572;
import 'package:rapsap_ops_app/core/services/storage/local_db.dart' as _i936;
import 'package:rapsap_ops_app/core/services/storage/local_storage_service.dart'
    as _i560;
import 'package:rapsap_ops_app/core/services/storage/secure_storage_service.dart'
    as _i814;
import 'package:rapsap_ops_app/features/auth/data/datasources/auth_remote_data_source.dart'
    as _i58;
import 'package:rapsap_ops_app/features/auth/data/datasources/fake_auth_remote_data_source.dart'
    as _i412;
import 'package:rapsap_ops_app/features/auth/data/repositories/auth_repository_impl.dart'
    as _i186;
import 'package:rapsap_ops_app/features/auth/domain/repositories/auth_repository.dart'
    as _i763;
import 'package:rapsap_ops_app/features/auth/domain/usecases/accept_consent.dart'
    as _i976;
import 'package:rapsap_ops_app/features/auth/domain/usecases/get_current_user.dart'
    as _i298;
import 'package:rapsap_ops_app/features/auth/domain/usecases/get_unsent_proof_owner.dart'
    as _i743;
import 'package:rapsap_ops_app/features/auth/domain/usecases/log_out.dart'
    as _i355;
import 'package:rapsap_ops_app/features/auth/domain/usecases/send_otp.dart'
    as _i439;
import 'package:rapsap_ops_app/features/auth/domain/usecases/verify_otp.dart'
    as _i797;
import 'package:rapsap_ops_app/features/auth/presentation/bloc/first_sign_in_cubit.dart'
    as _i667;
import 'package:rapsap_ops_app/features/auth/presentation/bloc/install_cubit.dart'
    as _i585;
import 'package:rapsap_ops_app/features/auth/presentation/bloc/login_cubit.dart'
    as _i762;
import 'package:rapsap_ops_app/features/auth/presentation/bloc/logout_cubit.dart'
    as _i92;
import 'package:rapsap_ops_app/features/auth/presentation/bloc/otp_cubit.dart'
    as _i82;
import 'package:rapsap_ops_app/features/chat/data/datasources/chat_remote_data_source.dart'
    as _i610;
import 'package:rapsap_ops_app/features/chat/data/datasources/fake_chat_remote_data_source.dart'
    as _i1009;
import 'package:rapsap_ops_app/features/chat/data/repositories/chat_repository_impl.dart'
    as _i677;
import 'package:rapsap_ops_app/features/chat/domain/repositories/chat_repository.dart'
    as _i77;
import 'package:rapsap_ops_app/features/chat/domain/usecases/get_conversations.dart'
    as _i801;
import 'package:rapsap_ops_app/features/chat/domain/usecases/get_manager_conversation.dart'
    as _i1042;
import 'package:rapsap_ops_app/features/chat/domain/usecases/get_older_messages.dart'
    as _i761;
import 'package:rapsap_ops_app/features/chat/domain/usecases/open_conversation.dart'
    as _i832;
import 'package:rapsap_ops_app/features/chat/domain/usecases/report_message.dart'
    as _i299;
import 'package:rapsap_ops_app/features/chat/domain/usecases/send_chat_message.dart'
    as _i866;
import 'package:rapsap_ops_app/features/chat/domain/usecases/set_conversation_muted.dart'
    as _i337;
import 'package:rapsap_ops_app/features/chat/domain/usecases/watch_conversation.dart'
    as _i833;
import 'package:rapsap_ops_app/features/chat/presentation/bloc/chat_list_cubit.dart'
    as _i810;
import 'package:rapsap_ops_app/features/chat/presentation/bloc/chat_search_cubit.dart'
    as _i470;
import 'package:rapsap_ops_app/features/chat/presentation/bloc/conversation_bloc.dart'
    as _i739;
import 'package:rapsap_ops_app/features/chat/presentation/bloc/manager_chat_cubit.dart'
    as _i629;
import 'package:rapsap_ops_app/features/checklist/data/datasources/checklist_remote_data_source.dart'
    as _i461;
import 'package:rapsap_ops_app/features/checklist/data/datasources/fake_checklist_remote_data_source.dart'
    as _i870;
import 'package:rapsap_ops_app/features/checklist/data/repositories/checklist_repository_impl.dart'
    as _i920;
import 'package:rapsap_ops_app/features/checklist/domain/repositories/checklist_repository.dart'
    as _i997;
import 'package:rapsap_ops_app/features/checklist/domain/usecases/get_task_detail.dart'
    as _i545;
import 'package:rapsap_ops_app/features/checklist/domain/usecases/get_today_checklist.dart'
    as _i222;
import 'package:rapsap_ops_app/features/checklist/domain/usecases/start_capture.dart'
    as _i511;
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_not_done.dart'
    as _i273;
import 'package:rapsap_ops_app/features/checklist/domain/usecases/submit_task_photo.dart'
    as _i509;
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/camera_cubit.dart'
    as _i239;
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/task_cubit.dart'
    as _i284;
import 'package:rapsap_ops_app/features/checklist/presentation/bloc/today_checklist_cubit.dart'
    as _i474;
import 'package:rapsap_ops_app/features/dsr/data/datasources/dsr_remote_data_source.dart'
    as _i791;
import 'package:rapsap_ops_app/features/dsr/data/datasources/fake_dsr_remote_data_source.dart'
    as _i91;
import 'package:rapsap_ops_app/features/dsr/data/repositories/dsr_repository_impl.dart'
    as _i292;
import 'package:rapsap_ops_app/features/dsr/domain/repositories/dsr_repository.dart'
    as _i280;
import 'package:rapsap_ops_app/features/dsr/domain/usecases/check_dsr_file.dart'
    as _i1026;
import 'package:rapsap_ops_app/features/dsr/domain/usecases/get_sales_overview.dart'
    as _i353;
import 'package:rapsap_ops_app/features/dsr/domain/usecases/post_dsr_snapshot.dart'
    as _i89;
import 'package:rapsap_ops_app/features/dsr/domain/usecases/save_dsr.dart'
    as _i642;
import 'package:rapsap_ops_app/features/dsr/presentation/bloc/dsr_upload_cubit.dart'
    as _i605;
import 'package:rapsap_ops_app/features/dsr/presentation/bloc/sales_cubit.dart'
    as _i155;
import 'package:rapsap_ops_app/features/notifications/data/datasources/notification_remote_data_source.dart'
    as _i435;
import 'package:rapsap_ops_app/features/notifications/data/repositories/notification_repository_impl.dart'
    as _i256;
import 'package:rapsap_ops_app/features/notifications/domain/repositories/notification_repository.dart'
    as _i626;
import 'package:rapsap_ops_app/features/notifications/domain/usecases/get_notifications.dart'
    as _i742;
import 'package:rapsap_ops_app/features/notifications/domain/usecases/mark_all_notifications_read.dart'
    as _i411;
import 'package:rapsap_ops_app/features/notifications/domain/usecases/mark_notification_read.dart'
    as _i144;
import 'package:rapsap_ops_app/features/notifications/presentation/bloc/notifications_cubit.dart'
    as _i221;
import 'package:rapsap_ops_app/features/profile/data/datasources/profile_remote_data_source.dart'
    as _i754;
import 'package:rapsap_ops_app/features/profile/data/repositories/profile_repository_impl.dart'
    as _i145;
import 'package:rapsap_ops_app/features/profile/domain/repositories/profile_repository.dart'
    as _i921;
import 'package:rapsap_ops_app/features/profile/domain/usecases/get_profile.dart'
    as _i628;
import 'package:rapsap_ops_app/features/profile/presentation/bloc/profile_cubit.dart'
    as _i1;
import 'package:rapsap_ops_app/features/review/data/datasources/fake_review_remote_data_source.dart'
    as _i125;
import 'package:rapsap_ops_app/features/review/data/datasources/review_remote_data_source.dart'
    as _i931;
import 'package:rapsap_ops_app/features/review/data/repositories/review_repository_impl.dart'
    as _i336;
import 'package:rapsap_ops_app/features/review/domain/repositories/review_repository.dart'
    as _i128;
import 'package:rapsap_ops_app/features/review/domain/usecases/edit_entry.dart'
    as _i949;
import 'package:rapsap_ops_app/features/review/domain/usecases/get_manager_dashboard.dart'
    as _i395;
import 'package:rapsap_ops_app/features/review/domain/usecases/get_review_detail.dart'
    as _i633;
import 'package:rapsap_ops_app/features/review/domain/usecases/get_review_queue.dart'
    as _i947;
import 'package:rapsap_ops_app/features/review/domain/usecases/send_back_entry.dart'
    as _i23;
import 'package:rapsap_ops_app/features/review/domain/usecases/take_over_task.dart'
    as _i855;
import 'package:rapsap_ops_app/features/review/domain/usecases/unlock_task.dart'
    as _i782;
import 'package:rapsap_ops_app/features/review/domain/usecases/verify_entry.dart'
    as _i389;
import 'package:rapsap_ops_app/features/review/presentation/bloc/edit_entry_cubit.dart'
    as _i744;
import 'package:rapsap_ops_app/features/review/presentation/bloc/manager_dashboard_cubit.dart'
    as _i527;
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_detail_cubit.dart'
    as _i402;
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_queue_cubit.dart'
    as _i645;
import 'package:rapsap_ops_app/features/review/presentation/bloc/send_back_cubit.dart'
    as _i356;
import 'package:rapsap_ops_app/features/section_reports/data/datasources/fake_report_remote_data_source.dart'
    as _i979;
import 'package:rapsap_ops_app/features/section_reports/data/datasources/report_remote_data_source.dart'
    as _i104;
import 'package:rapsap_ops_app/features/section_reports/data/repositories/section_report_repository_impl.dart'
    as _i999;
import 'package:rapsap_ops_app/features/section_reports/domain/repositories/section_report_repository.dart'
    as _i449;
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_closing_form.dart'
    as _i574;
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_daily_summary_form.dart'
    as _i515;
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_report_snapshot.dart'
    as _i327;
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_section_reports.dart'
    as _i1034;
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/post_snapshot.dart'
    as _i673;
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_closing_report.dart'
    as _i684;
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_daily_summary.dart'
    as _i161;
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_section_report.dart'
    as _i783;
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_walkthrough.dart'
    as _i36;
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/closing_cubit.dart'
    as _i638;
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/daily_summary_cubit.dart'
    as _i937;
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/section_reports_cubit.dart'
    as _i603;
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/snapshot_cubit.dart'
    as _i940;
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/walkthrough_cubit.dart'
    as _i984;
import 'package:rapsap_ops_app/features/settings/data/datasources/settings_remote_data_source.dart'
    as _i726;
import 'package:rapsap_ops_app/features/settings/data/repositories/settings_repository_impl.dart'
    as _i1000;
import 'package:rapsap_ops_app/features/settings/domain/repositories/settings_repository.dart'
    as _i871;
import 'package:rapsap_ops_app/features/settings/domain/usecases/get_notification_prefs.dart'
    as _i26;
import 'package:rapsap_ops_app/features/settings/domain/usecases/save_notification_prefs.dart'
    as _i138;
import 'package:rapsap_ops_app/features/settings/presentation/bloc/settings_cubit.dart'
    as _i663;
import 'package:rapsap_ops_app/features/team/data/datasources/fake_team_remote_data_source.dart'
    as _i1035;
import 'package:rapsap_ops_app/features/team/data/datasources/team_remote_data_source.dart'
    as _i932;
import 'package:rapsap_ops_app/features/team/data/repositories/team_repository_impl.dart'
    as _i112;
import 'package:rapsap_ops_app/features/team/domain/repositories/team_repository.dart'
    as _i904;
import 'package:rapsap_ops_app/features/team/domain/usecases/confirm_number_change.dart'
    as _i462;
import 'package:rapsap_ops_app/features/team/domain/usecases/create_login.dart'
    as _i442;
import 'package:rapsap_ops_app/features/team/domain/usecases/get_role_catalog.dart'
    as _i970;
import 'package:rapsap_ops_app/features/team/domain/usecases/get_team.dart'
    as _i890;
import 'package:rapsap_ops_app/features/team/domain/usecases/get_team_member.dart'
    as _i1036;
import 'package:rapsap_ops_app/features/team/domain/usecases/resend_invite.dart'
    as _i880;
import 'package:rapsap_ops_app/features/team/domain/usecases/set_member_active.dart'
    as _i618;
import 'package:rapsap_ops_app/features/team/domain/usecases/start_number_change.dart'
    as _i875;
import 'package:rapsap_ops_app/features/team/domain/usecases/update_member_roles.dart'
    as _i1014;
import 'package:rapsap_ops_app/features/team/presentation/bloc/change_number_cubit.dart'
    as _i162;
import 'package:rapsap_ops_app/features/team/presentation/bloc/create_login_cubit.dart'
    as _i536;
import 'package:rapsap_ops_app/features/team/presentation/bloc/member_detail_cubit.dart'
    as _i541;
import 'package:rapsap_ops_app/features/team/presentation/bloc/team_cubit.dart'
    as _i839;
import 'package:rapsap_ops_app/features/uploads/data/datasources/upload_outbox_local_data_source.dart'
    as _i525;
import 'package:rapsap_ops_app/features/uploads/data/repositories/upload_outbox_repository_impl.dart'
    as _i237;
import 'package:rapsap_ops_app/features/uploads/domain/repositories/upload_outbox_repository.dart'
    as _i643;
import 'package:rapsap_ops_app/features/uploads/domain/usecases/find_saved_proof.dart'
    as _i438;
import 'package:rapsap_ops_app/features/uploads/domain/usecases/remove_upload.dart'
    as _i360;
import 'package:rapsap_ops_app/features/uploads/domain/usecases/save_upload.dart'
    as _i606;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

const String _real = 'real';
const String _fake = 'fake';

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    await gh.factoryAsync<_i655.PackageInfo>(
      () => registerModule.packageInfo,
      preResolve: true,
    );
    await gh.factoryAsync<_i936.LocalDb>(
      () => registerModule.localDb,
      preResolve: true,
    );
    gh.factory<_i869.CameraService>(() => _i869.CameraService());
    gh.factory<_i470.ChatSearchCubit>(() => _i470.ChatSearchCubit());
    gh.factory<_i645.ReviewFilterCubit>(() => _i645.ReviewFilterCubit());
    gh.factory<_i839.TeamFilterCubit>(() => _i839.TeamFilterCubit());
    gh.lazySingleton<_i558.FlutterSecureStorage>(
      () => registerModule.secureStorage,
    );
    gh.lazySingleton<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i621.NetworkEvents>(
      () => _i621.NetworkEvents(),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i65.FilePickerService>(() => _i65.FilePickerService());
    gh.lazySingleton<_i600.InstallService>(() => _i600.InstallService.create());
    gh.lazySingleton<_i322.TabLock>(() => _i322.TabLock.create());
    gh.lazySingleton<_i886.PhotoProcessor>(() => _i886.PhotoProcessor());
    gh.lazySingleton<_i269.PermissionService>(
      () => _i269.PermissionService.create(),
    );
    gh.lazySingleton<_i524.NetworkInfo>(
      () => _i524.NetworkInfoImpl(gh<_i895.Connectivity>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i524.NetworkInfo>(
      () => _i524.DeviceNetworkInfo(gh<_i895.Connectivity>()),
      registerFor: {_fake},
    );
    gh.lazySingleton<_i461.ChecklistRemoteDataSource>(
      () => _i870.FakeChecklistRemoteDataSource(gh<_i524.NetworkInfo>()),
      registerFor: {_fake},
    );
    gh.lazySingleton<_i814.SecureStorageService>(
      () => _i814.SecureStorageService(gh<_i558.FlutterSecureStorage>()),
    );
    gh.lazySingleton<_i104.ReportRemoteDataSource>(
      () => _i979.FakeReportRemoteDataSource(
        gh<_i461.ChecklistRemoteDataSource>(),
      ),
      registerFor: {_fake},
    );
    gh.factory<_i585.InstallCubit>(
      () => _i585.InstallCubit(gh<_i600.InstallService>()),
    );
    gh.lazySingleton<_i931.ReviewRemoteDataSource>(
      () => _i125.FakeReviewRemoteDataSource(
        gh<_i461.ChecklistRemoteDataSource>(),
      ),
      registerFor: {_fake},
    );
    gh.lazySingleton<_i932.TeamRemoteDataSource>(
      () => _i1035.FakeTeamRemoteDataSource(),
      registerFor: {_fake},
    );
    gh.lazySingleton<_i58.AuthRemoteDataSource>(
      () => _i412.FakeAuthRemoteDataSource(gh<_i814.SecureStorageService>()),
      registerFor: {_fake},
    );
    gh.lazySingleton<_i610.ChatRemoteDataSource>(
      () => _i1009.FakeChatRemoteDataSource(),
      registerFor: {_fake},
    );
    gh.lazySingleton<_i560.LocalStorageService>(
      () => _i560.LocalStorageService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i349.AppConfigSource>(
      () => _i349.FakeAppConfigSource(),
      registerFor: {_fake},
    );
    gh.factory<_i685.ConnectivityCubit>(
      () => _i685.ConnectivityCubit(gh<_i524.NetworkInfo>()),
    );
    gh.lazySingleton<_i525.UploadOutboxLocalDataSource>(
      () => _i525.UploadOutboxLocalDataSource(gh<_i936.LocalDb>()),
    );
    gh.factory<_i239.CameraCubit>(
      () => _i239.CameraCubit(
        gh<_i869.CameraService>(),
        gh<_i886.PhotoProcessor>(),
      ),
    );
    gh.lazySingleton<_i791.DsrRemoteDataSource>(
      () => _i91.FakeDsrRemoteDataSource(),
      registerFor: {_fake},
    );
    gh.lazySingleton<_i726.SettingsRemoteDataSource>(
      () => _i726.FakeSettingsRemoteDataSource(),
      registerFor: {_fake},
    );
    gh.lazySingleton<_i643.UploadOutboxRepository>(
      () => _i237.UploadOutboxRepositoryImpl(
        gh<_i525.UploadOutboxLocalDataSource>(),
      ),
    );
    gh.lazySingleton<_i754.ProfileRemoteDataSource>(
      () => _i754.FakeProfileRemoteDataSource(),
      registerFor: {_fake},
    );
    gh.factory<_i844.LocaleCubit>(
      () => _i844.LocaleCubit(gh<_i560.LocalStorageService>()),
    );
    gh.lazySingleton<_i435.NotificationRemoteDataSource>(
      () => _i435.FakeNotificationRemoteDataSource(),
      registerFor: {_fake},
    );
    gh.lazySingleton<_i572.ChatSocketService>(
      () => _i572.FakeChatSocketService(),
      registerFor: {_fake},
    );
    gh.factory<_i438.FindSavedProof>(
      () => _i438.FindSavedProof(gh<_i643.UploadOutboxRepository>()),
    );
    gh.factory<_i360.RemoveUpload>(
      () => _i360.RemoveUpload(gh<_i643.UploadOutboxRepository>()),
    );
    gh.factory<_i606.SaveUpload>(
      () => _i606.SaveUpload(gh<_i643.UploadOutboxRepository>()),
    );
    gh.lazySingleton<_i1055.DioClient>(
      () => _i1055.DioClient(
        gh<_i524.NetworkInfo>(),
        gh<_i814.SecureStorageService>(),
        gh<_i560.LocalStorageService>(),
        gh<_i621.NetworkEvents>(),
        gh<_i655.PackageInfo>(),
        gh<_i322.TabLock>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.lazySingleton<_i791.DsrRemoteDataSource>(
      () => _i791.DsrRemoteDataSourceImpl(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i58.AuthRemoteDataSource>(
      () => _i58.AuthRemoteDataSourceImpl(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i435.NotificationRemoteDataSource>(
      () => _i435.NotificationRemoteDataSourceImpl(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i931.ReviewRemoteDataSource>(
      () => _i931.ReviewRemoteDataSourceImpl(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i104.ReportRemoteDataSource>(
      () => _i104.ReportRemoteDataSourceImpl(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i754.ProfileRemoteDataSource>(
      () => _i754.ProfileRemoteDataSourceImpl(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i461.ChecklistRemoteDataSource>(
      () => _i461.ChecklistRemoteDataSourceImpl(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i932.TeamRemoteDataSource>(
      () => _i932.TeamRemoteDataSourceImpl(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i349.AppConfigSource>(
      () => _i349.RemoteAppConfigSource(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i613.AppUpdateService>(
      () => _i613.AppUpdateService(
        gh<_i349.AppConfigSource>(),
        gh<_i655.PackageInfo>(),
      ),
    );
    gh.lazySingleton<_i610.ChatRemoteDataSource>(
      () => _i610.ChatRemoteDataSourceImpl(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i763.AuthRepository>(
      () => _i186.AuthRepositoryImpl(
        gh<_i58.AuthRemoteDataSource>(),
        gh<_i814.SecureStorageService>(),
        gh<_i936.LocalDb>(),
        gh<_i621.NetworkEvents>(),
      ),
    );
    gh.lazySingleton<_i572.ChatSocketService>(
      () => _i572.WebChatSocketService(
        gh<_i814.SecureStorageService>(),
        gh<_i1055.DioClient>(),
        gh<_i621.NetworkEvents>(),
      ),
      registerFor: {_real},
    );
    gh.lazySingleton<_i726.SettingsRemoteDataSource>(
      () => _i726.SettingsRemoteDataSourceImpl(gh<_i1055.DioClient>()),
      registerFor: {_real},
    );
    gh.lazySingleton<_i904.TeamRepository>(
      () => _i112.TeamRepositoryImpl(gh<_i932.TeamRemoteDataSource>()),
    );
    gh.lazySingleton<_i626.NotificationRepository>(
      () => _i256.NotificationRepositoryImpl(
        gh<_i435.NotificationRemoteDataSource>(),
      ),
    );
    gh.factory<_i742.GetNotifications>(
      () => _i742.GetNotifications(gh<_i626.NotificationRepository>()),
    );
    gh.factory<_i411.MarkAllNotificationsRead>(
      () => _i411.MarkAllNotificationsRead(gh<_i626.NotificationRepository>()),
    );
    gh.factory<_i144.MarkNotificationRead>(
      () => _i144.MarkNotificationRead(gh<_i626.NotificationRepository>()),
    );
    gh.lazySingleton<_i449.SectionReportRepository>(
      () =>
          _i999.SectionReportRepositoryImpl(gh<_i104.ReportRemoteDataSource>()),
    );
    gh.lazySingleton<_i280.DsrRepository>(
      () => _i292.DsrRepositoryImpl(
        gh<_i791.DsrRemoteDataSource>(),
        gh<_i763.AuthRepository>(),
      ),
    );
    gh.lazySingleton<_i997.ChecklistRepository>(
      () =>
          _i920.ChecklistRepositoryImpl(gh<_i461.ChecklistRemoteDataSource>()),
    );
    gh.lazySingleton<_i871.SettingsRepository>(
      () => _i1000.SettingsRepositoryImpl(gh<_i726.SettingsRemoteDataSource>()),
    );
    gh.factory<_i743.GetUnsentProofOwner>(
      () => _i743.GetUnsentProofOwner(
        gh<_i763.AuthRepository>(),
        gh<_i643.UploadOutboxRepository>(),
      ),
    );
    gh.lazySingleton<_i128.ReviewRepository>(
      () => _i336.ReviewRepositoryImpl(gh<_i931.ReviewRemoteDataSource>()),
    );
    gh.lazySingleton<_i921.ProfileRepository>(
      () => _i145.ProfileRepositoryImpl(gh<_i754.ProfileRemoteDataSource>()),
    );
    gh.factory<_i1026.CheckDsrFile>(
      () => _i1026.CheckDsrFile(gh<_i280.DsrRepository>()),
    );
    gh.factory<_i353.GetSalesOverview>(
      () => _i353.GetSalesOverview(gh<_i280.DsrRepository>()),
    );
    gh.factory<_i89.PostDsrSnapshot>(
      () => _i89.PostDsrSnapshot(gh<_i280.DsrRepository>()),
    );
    gh.factory<_i642.SaveDsr>(() => _i642.SaveDsr(gh<_i280.DsrRepository>()));
    gh.factory<_i949.EditEntry>(
      () => _i949.EditEntry(gh<_i128.ReviewRepository>()),
    );
    gh.factory<_i395.GetManagerDashboard>(
      () => _i395.GetManagerDashboard(gh<_i128.ReviewRepository>()),
    );
    gh.factory<_i633.GetReviewDetail>(
      () => _i633.GetReviewDetail(gh<_i128.ReviewRepository>()),
    );
    gh.factory<_i947.GetReviewQueue>(
      () => _i947.GetReviewQueue(gh<_i128.ReviewRepository>()),
    );
    gh.factory<_i23.SendBackEntry>(
      () => _i23.SendBackEntry(gh<_i128.ReviewRepository>()),
    );
    gh.factory<_i855.TakeOverTask>(
      () => _i855.TakeOverTask(gh<_i128.ReviewRepository>()),
    );
    gh.factory<_i782.UnlockTask>(
      () => _i782.UnlockTask(gh<_i128.ReviewRepository>()),
    );
    gh.factory<_i389.VerifyEntry>(
      () => _i389.VerifyEntry(gh<_i128.ReviewRepository>()),
    );
    gh.factory<_i462.ConfirmNumberChange>(
      () => _i462.ConfirmNumberChange(gh<_i904.TeamRepository>()),
    );
    gh.factory<_i442.CreateLogin>(
      () => _i442.CreateLogin(gh<_i904.TeamRepository>()),
    );
    gh.factory<_i970.GetRoleCatalog>(
      () => _i970.GetRoleCatalog(gh<_i904.TeamRepository>()),
    );
    gh.factory<_i890.GetTeam>(() => _i890.GetTeam(gh<_i904.TeamRepository>()));
    gh.factory<_i1036.GetTeamMember>(
      () => _i1036.GetTeamMember(gh<_i904.TeamRepository>()),
    );
    gh.factory<_i880.ResendInvite>(
      () => _i880.ResendInvite(gh<_i904.TeamRepository>()),
    );
    gh.factory<_i618.SetMemberActive>(
      () => _i618.SetMemberActive(gh<_i904.TeamRepository>()),
    );
    gh.factory<_i875.StartNumberChange>(
      () => _i875.StartNumberChange(gh<_i904.TeamRepository>()),
    );
    gh.factory<_i1014.UpdateMemberRoles>(
      () => _i1014.UpdateMemberRoles(gh<_i904.TeamRepository>()),
    );
    gh.factory<_i155.SalesCubit>(
      () => _i155.SalesCubit(gh<_i353.GetSalesOverview>()),
    );
    gh.factory<_i645.ReviewQueueCubit>(
      () => _i645.ReviewQueueCubit(gh<_i947.GetReviewQueue>()),
    );
    gh.factory<_i574.GetClosingForm>(
      () => _i574.GetClosingForm(gh<_i449.SectionReportRepository>()),
    );
    gh.factory<_i515.GetDailySummaryForm>(
      () => _i515.GetDailySummaryForm(gh<_i449.SectionReportRepository>()),
    );
    gh.factory<_i327.GetReportSnapshot>(
      () => _i327.GetReportSnapshot(gh<_i449.SectionReportRepository>()),
    );
    gh.factory<_i1034.GetSectionReports>(
      () => _i1034.GetSectionReports(gh<_i449.SectionReportRepository>()),
    );
    gh.factory<_i673.PostSnapshot>(
      () => _i673.PostSnapshot(gh<_i449.SectionReportRepository>()),
    );
    gh.factory<_i684.SubmitClosingReport>(
      () => _i684.SubmitClosingReport(gh<_i449.SectionReportRepository>()),
    );
    gh.factory<_i161.SubmitDailySummary>(
      () => _i161.SubmitDailySummary(gh<_i449.SectionReportRepository>()),
    );
    gh.factory<_i783.SubmitSectionReport>(
      () => _i783.SubmitSectionReport(gh<_i449.SectionReportRepository>()),
    );
    gh.factory<_i36.SubmitWalkthrough>(
      () => _i36.SubmitWalkthrough(gh<_i449.SectionReportRepository>()),
    );
    gh.factory<_i402.ReviewDetailCubit>(
      () => _i402.ReviewDetailCubit(
        gh<_i633.GetReviewDetail>(),
        gh<_i389.VerifyEntry>(),
        gh<_i782.UnlockTask>(),
        gh<_i855.TakeOverTask>(),
      ),
    );
    gh.factory<_i839.TeamCubit>(() => _i839.TeamCubit(gh<_i890.GetTeam>()));
    gh.factory<_i605.DsrUploadCubit>(
      () => _i605.DsrUploadCubit(
        gh<_i65.FilePickerService>(),
        gh<_i1026.CheckDsrFile>(),
        gh<_i642.SaveDsr>(),
        gh<_i89.PostDsrSnapshot>(),
        gh<_i886.PhotoProcessor>(),
      ),
    );
    gh.factory<_i545.GetTaskDetail>(
      () => _i545.GetTaskDetail(gh<_i997.ChecklistRepository>()),
    );
    gh.factory<_i222.GetTodayChecklist>(
      () => _i222.GetTodayChecklist(gh<_i997.ChecklistRepository>()),
    );
    gh.factory<_i511.StartCapture>(
      () => _i511.StartCapture(gh<_i997.ChecklistRepository>()),
    );
    gh.factory<_i273.SubmitTaskNotDone>(
      () => _i273.SubmitTaskNotDone(gh<_i997.ChecklistRepository>()),
    );
    gh.factory<_i509.SubmitTaskPhoto>(
      () => _i509.SubmitTaskPhoto(gh<_i997.ChecklistRepository>()),
    );
    gh.factory<_i976.AcceptConsent>(
      () => _i976.AcceptConsent(gh<_i763.AuthRepository>()),
    );
    gh.factory<_i298.GetCurrentUser>(
      () => _i298.GetCurrentUser(gh<_i763.AuthRepository>()),
    );
    gh.factory<_i355.LogOut>(() => _i355.LogOut(gh<_i763.AuthRepository>()));
    gh.factory<_i439.SendOtp>(() => _i439.SendOtp(gh<_i763.AuthRepository>()));
    gh.factory<_i797.VerifyOtp>(
      () => _i797.VerifyOtp(gh<_i763.AuthRepository>()),
    );
    gh.factory<_i937.DailySummaryCubit>(
      () => _i937.DailySummaryCubit(
        gh<_i515.GetDailySummaryForm>(),
        gh<_i161.SubmitDailySummary>(),
      ),
    );
    gh.lazySingleton<_i77.ChatRepository>(
      () => _i677.ChatRepositoryImpl(
        gh<_i610.ChatRemoteDataSource>(),
        gh<_i572.ChatSocketService>(),
        gh<_i763.AuthRepository>(),
      ),
    );
    gh.factory<_i541.MemberDetailCubit>(
      () => _i541.MemberDetailCubit(
        gh<_i1036.GetTeamMember>(),
        gh<_i970.GetRoleCatalog>(),
        gh<_i1014.UpdateMemberRoles>(),
        gh<_i618.SetMemberActive>(),
      ),
    );
    gh.factory<_i536.CreateLoginCubit>(
      () => _i536.CreateLoginCubit(
        gh<_i970.GetRoleCatalog>(),
        gh<_i442.CreateLogin>(),
        gh<_i880.ResendInvite>(),
      ),
    );
    gh.factory<_i527.ManagerDashboardCubit>(
      () => _i527.ManagerDashboardCubit(gh<_i395.GetManagerDashboard>()),
    );
    gh.factory<_i839.InviteCubit>(
      () => _i839.InviteCubit(gh<_i880.ResendInvite>()),
    );
    gh.factory<_i603.SubmitReportCubit>(
      () => _i603.SubmitReportCubit(gh<_i783.SubmitSectionReport>()),
    );
    gh.factory<_i221.NotificationsCubit>(
      () => _i221.NotificationsCubit(
        gh<_i742.GetNotifications>(),
        gh<_i144.MarkNotificationRead>(),
        gh<_i411.MarkAllNotificationsRead>(),
      ),
    );
    gh.factory<_i628.GetProfile>(
      () => _i628.GetProfile(gh<_i921.ProfileRepository>()),
    );
    gh.lazySingleton<_i1041.SessionCubit>(
      () => _i1041.SessionCubit(
        gh<_i298.GetCurrentUser>(),
        gh<_i621.NetworkEvents>(),
      ),
    );
    gh.factory<_i603.SectionReportsCubit>(
      () => _i603.SectionReportsCubit(gh<_i1034.GetSectionReports>()),
    );
    gh.factory<_i744.EditEntryCubit>(
      () =>
          _i744.EditEntryCubit(gh<_i511.StartCapture>(), gh<_i949.EditEntry>()),
    );
    gh.factory<_i356.SendBackCubit>(
      () => _i356.SendBackCubit(gh<_i23.SendBackEntry>()),
    );
    gh.factory<_i162.ChangeNumberCubit>(
      () => _i162.ChangeNumberCubit(
        gh<_i875.StartNumberChange>(),
        gh<_i462.ConfirmNumberChange>(),
      ),
    );
    gh.factory<_i801.GetConversations>(
      () => _i801.GetConversations(gh<_i77.ChatRepository>()),
    );
    gh.factory<_i1042.GetManagerConversation>(
      () => _i1042.GetManagerConversation(gh<_i77.ChatRepository>()),
    );
    gh.factory<_i761.GetOlderMessages>(
      () => _i761.GetOlderMessages(gh<_i77.ChatRepository>()),
    );
    gh.factory<_i832.OpenConversation>(
      () => _i832.OpenConversation(gh<_i77.ChatRepository>()),
    );
    gh.factory<_i299.ReportMessage>(
      () => _i299.ReportMessage(gh<_i77.ChatRepository>()),
    );
    gh.factory<_i866.SendChatMessage>(
      () => _i866.SendChatMessage(gh<_i77.ChatRepository>()),
    );
    gh.factory<_i337.SetConversationMuted>(
      () => _i337.SetConversationMuted(gh<_i77.ChatRepository>()),
    );
    gh.factory<_i833.WatchConversation>(
      () => _i833.WatchConversation(gh<_i77.ChatRepository>()),
    );
    gh.factory<_i638.ClosingCubit>(
      () => _i638.ClosingCubit(
        gh<_i574.GetClosingForm>(),
        gh<_i511.StartCapture>(),
        gh<_i684.SubmitClosingReport>(),
      ),
    );
    gh.factory<_i762.LoginCubit>(
      () => _i762.LoginCubit(
        gh<_i439.SendOtp>(),
        gh<_i743.GetUnsentProofOwner>(),
      ),
    );
    gh.factory<_i739.ConversationBloc>(
      () => _i739.ConversationBloc(
        gh<_i832.OpenConversation>(),
        gh<_i761.GetOlderMessages>(),
        gh<_i866.SendChatMessage>(),
        gh<_i299.ReportMessage>(),
        gh<_i337.SetConversationMuted>(),
        gh<_i833.WatchConversation>(),
      ),
    );
    gh.factory<_i940.SnapshotCubit>(
      () => _i940.SnapshotCubit(
        gh<_i327.GetReportSnapshot>(),
        gh<_i673.PostSnapshot>(),
        gh<_i886.PhotoProcessor>(),
      ),
    );
    gh.factory<_i26.GetNotificationPrefs>(
      () => _i26.GetNotificationPrefs(gh<_i871.SettingsRepository>()),
    );
    gh.factory<_i138.SaveNotificationPrefs>(
      () => _i138.SaveNotificationPrefs(gh<_i871.SettingsRepository>()),
    );
    gh.factory<_i984.WalkthroughCubit>(
      () => _i984.WalkthroughCubit(
        gh<_i869.CameraService>(),
        gh<_i511.StartCapture>(),
        gh<_i36.SubmitWalkthrough>(),
      ),
    );
    gh.factory<_i474.TodayChecklistCubit>(
      () => _i474.TodayChecklistCubit(gh<_i222.GetTodayChecklist>()),
    );
    gh.factory<_i284.TaskCubit>(
      () => _i284.TaskCubit(
        gh<_i545.GetTaskDetail>(),
        gh<_i511.StartCapture>(),
        gh<_i509.SubmitTaskPhoto>(),
        gh<_i273.SubmitTaskNotDone>(),
        gh<_i438.FindSavedProof>(),
        gh<_i606.SaveUpload>(),
        gh<_i360.RemoveUpload>(),
      ),
    );
    gh.factory<_i82.OtpCubit>(
      () => _i82.OtpCubit(gh<_i797.VerifyOtp>(), gh<_i439.SendOtp>()),
    );
    gh.factory<_i667.FirstSignInCubit>(
      () => _i667.FirstSignInCubit(
        gh<_i269.PermissionService>(),
        gh<_i976.AcceptConsent>(),
      ),
    );
    gh.factory<_i663.SettingsCubit>(
      () => _i663.SettingsCubit(
        gh<_i26.GetNotificationPrefs>(),
        gh<_i138.SaveNotificationPrefs>(),
      ),
    );
    gh.factory<_i92.LogoutCubit>(
      () => _i92.LogoutCubit(gh<_i355.LogOut>(), gh<_i1041.SessionCubit>()),
    );
    gh.factory<_i810.ChatListCubit>(
      () => _i810.ChatListCubit(gh<_i801.GetConversations>()),
    );
    gh.factory<_i1.ProfileCubit>(
      () => _i1.ProfileCubit(gh<_i628.GetProfile>()),
    );
    gh.lazySingleton<_i288.AppRouter>(
      () => _i288.AppRouter(
        gh<_i1041.SessionCubit>(),
        gh<_i600.InstallService>(),
      ),
      dispose: (i) => i.dispose(),
    );
    gh.factory<_i629.ManagerChatCubit>(
      () => _i629.ManagerChatCubit(gh<_i1042.GetManagerConversation>()),
    );
    return this;
  }
}

class _$RegisterModule extends _i941.RegisterModule {}
