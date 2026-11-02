import 'package:rapsap_ops_app/core/di/injection.dart';
import 'package:rapsap_ops_app/core/services/media/photo_processor.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/fake_checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/checklist/data/repositories/checklist_repository_impl.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/start_capture.dart';
import 'package:rapsap_ops_app/features/dsr/data/datasources/fake_dsr_remote_data_source.dart';
import 'package:rapsap_ops_app/features/dsr/data/repositories/dsr_repository_impl.dart';
import 'package:rapsap_ops_app/features/dsr/domain/usecases/get_sales_overview.dart';
import 'package:rapsap_ops_app/features/dsr/presentation/bloc/sales_cubit.dart';
import 'package:rapsap_ops_app/features/review/data/datasources/fake_review_remote_data_source.dart';
import 'package:rapsap_ops_app/features/review/data/repositories/review_repository_impl.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/edit_entry.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/get_manager_dashboard.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/get_review_detail.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/get_review_queue.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/send_back_entry.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/take_over_task.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/unlock_task.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/verify_entry.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/edit_entry_cubit.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/manager_dashboard_cubit.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_detail_cubit.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_queue_cubit.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/send_back_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/data/datasources/fake_report_remote_data_source.dart';
import 'package:rapsap_ops_app/features/section_reports/data/repositories/section_report_repository_impl.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_closing_form.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_daily_summary_form.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_report_snapshot.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_section_reports.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/post_snapshot.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_closing_report.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_daily_summary.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_section_report.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/closing_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/daily_summary_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/section_reports_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/snapshot_cubit.dart';
import 'package:rapsap_ops_app/features/team/data/datasources/fake_team_remote_data_source.dart';
import 'package:rapsap_ops_app/features/team/data/repositories/team_repository_impl.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/confirm_number_change.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/create_login.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/get_role_catalog.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/get_team.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/get_team_member.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/resend_invite.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/set_member_active.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/start_number_change.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/update_member_roles.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/change_number_cubit.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/create_login_cubit.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/member_detail_cubit.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/team_cubit.dart';

/// Fake-backed cubits for the store-manager pages in widget tests.
void registerManagerCubits(FakeChecklistRemoteDataSource checklist) {
  final review = ReviewRepositoryImpl(FakeReviewRemoteDataSource(checklist));
  final team = TeamRepositoryImpl(FakeTeamRemoteDataSource());
  final reports = SectionReportRepositoryImpl(
    FakeReportRemoteDataSource(checklist),
  );
  final capture = StartCapture(ChecklistRepositoryImpl(checklist));
  final dsr = DsrRepositoryImpl(FakeDsrRemoteDataSource());
  getIt
    ..registerFactory(() => ManagerDashboardCubit(GetManagerDashboard(review)))
    ..registerFactory(() => ReviewQueueCubit(GetReviewQueue(review)))
    ..registerFactory(ReviewFilterCubit.new)
    ..registerFactory(
      () => ReviewDetailCubit(
        GetReviewDetail(review),
        VerifyEntry(review),
        UnlockTask(review),
        TakeOverTask(review),
      ),
    )
    ..registerFactory(() => SendBackCubit(SendBackEntry(review)))
    ..registerFactory(() => EditEntryCubit(capture, EditEntry(review)))
    ..registerFactory(() => TeamCubit(GetTeam(team)))
    ..registerFactory(TeamFilterCubit.new)
    ..registerFactory(() => InviteCubit(ResendInvite(team)))
    ..registerFactory(
      () => CreateLoginCubit(
        GetRoleCatalog(team),
        CreateLogin(team),
        ResendInvite(team),
      ),
    )
    ..registerFactory(
      () => MemberDetailCubit(
        GetTeamMember(team),
        GetRoleCatalog(team),
        UpdateMemberRoles(team),
        SetMemberActive(team),
      ),
    )
    ..registerFactory(
      () =>
          ChangeNumberCubit(StartNumberChange(team), ConfirmNumberChange(team)),
    )
    ..registerFactory(() => SectionReportsCubit(GetSectionReports(reports)))
    ..registerFactory(() => SubmitReportCubit(SubmitSectionReport(reports)))
    ..registerFactory(
      () => DailySummaryCubit(
        GetDailySummaryForm(reports),
        SubmitDailySummary(reports),
      ),
    )
    ..registerFactory(
      () => SnapshotCubit(
        GetReportSnapshot(reports),
        PostSnapshot(reports),
        PhotoProcessor(),
      ),
    )
    ..registerFactory(
      () => ClosingCubit(
        GetClosingForm(reports),
        capture,
        SubmitClosingReport(reports),
      ),
    )
    ..registerFactory(() => SalesCubit(GetSalesOverview(dsr)));
}
