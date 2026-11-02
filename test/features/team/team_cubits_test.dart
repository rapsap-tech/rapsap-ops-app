import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/features/team/data/datasources/fake_team_remote_data_source.dart';
import 'package:rapsap_ops_app/features/team/data/repositories/team_repository_impl.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/create_login.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/get_role_catalog.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/get_team_member.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/resend_invite.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/set_member_active.dart';
import 'package:rapsap_ops_app/features/team/domain/usecases/update_member_roles.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/create_login_cubit.dart';
import 'package:rapsap_ops_app/features/team/presentation/bloc/member_detail_cubit.dart';

void main() {
  late TeamRepositoryImpl repository;

  setUp(() => repository = TeamRepositoryImpl(FakeTeamRemoteDataSource()));

  CreateLoginCubit createCubit() => CreateLoginCubit(
    GetRoleCatalog(repository),
    CreateLogin(repository),
    ResendInvite(repository),
  );

  test('a number that already has a login sends you back to step 1', () async {
    final cubit = createCubit()
      ..phoneChanged('9876543210')
      ..nameChanged('Priya Naik')
      ..toggleRole('housekeeping')
      ..goTo(CreateStep.review);
    await cubit.submit();
    expect(cubit.state.step, CreateStep.details);
    expect(cubit.state.phoneTaken, isTrue);
    await cubit.close();
  });

  test('SMS failure keeps the login and offers a retry (X7)', () async {
    final cubit = createCubit()
      ..phoneChanged('9123400000')
      ..nameChanged('Test nosms')
      ..toggleRole('cashier');
    await cubit.submit();
    expect(cubit.state.result?.smsSent, isFalse);
    await cubit.resendSms();
    expect(cubit.state.result?.smsSent, isTrue);
    await cubit.close();
  });

  test('role edits are dirty until saved, and save needs a role', () async {
    final cubit = MemberDetailCubit(
      GetTeamMember(repository),
      GetRoleCatalog(repository),
      UpdateMemberRoles(repository),
      SetMemberActive(repository),
    );
    await cubit.load('m-1');
    expect(cubit.state.dirty, isFalse);
    cubit.toggleRole('security');
    expect(cubit.state.dirty, isTrue);
    await cubit.save();
    await Future<void>.delayed(const Duration(milliseconds: 600));
    expect(cubit.state.dirty, isFalse);
    expect(cubit.state.member?.roles.map((r) => r.id), contains('security'));
    await cubit.close();
  });
}
