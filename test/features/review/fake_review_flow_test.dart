import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/features/checklist/data/datasources/fake_checklist_remote_data_source.dart';
import 'package:rapsap_ops_app/features/review/data/datasources/fake_review_remote_data_source.dart';
import 'package:rapsap_ops_app/features/review/data/repositories/review_repository_impl.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/get_review_detail.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/take_over_task.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/unlock_task.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/verify_entry.dart';
import 'package:rapsap_ops_app/features/review/presentation/bloc/review_detail_cubit.dart';

import '../../helpers/always_online.dart';

void main() {
  late FakeChecklistRemoteDataSource checklist;
  late ReviewRepositoryImpl repository;

  setUp(() {
    checklist = FakeChecklistRemoteDataSource(const AlwaysOnline());
    repository = ReviewRepositoryImpl(FakeReviewRemoteDataSource(checklist));
  });

  test('queue lists submitted, missed and open tasks', () async {
    final queue = (await repository.queue()).toNullable()!;
    final kinds = queue.map((i) => i.kind).toSet();
    expect(kinds, containsAll([ReviewKind.needsReview, ReviewKind.missed]));
  });

  test('verifying updates the staff checklist too (SM-11)', () async {
    final queue = (await repository.queue()).toNullable()!;
    final item = queue.firstWhere((i) => i.kind == ReviewKind.needsReview);
    final cubit = ReviewDetailCubit(
      GetReviewDetail(repository),
      VerifyEntry(repository),
      UnlockTask(repository),
      TakeOverTask(repository),
    );
    await cubit.load(item.taskId);
    await cubit.verify();
    expect(cubit.state.done, ReviewAction.verify);
    final task = [for (final s in checklist.current.sections) ...s.tasks]
        .firstWhere((t) => t.id == item.taskId);
    expect(task.status, 'verified');
    await cubit.close();
  });

  test('unlocking a missed task reopens it for 30 minutes (SM-23)', () async {
    final queue = (await repository.queue()).toNullable()!;
    final missed = queue.firstWhere((i) => i.kind == ReviewKind.missed);
    await repository.unlock(missed.taskId);
    final task = [for (final s in checklist.current.sections) ...s.tasks]
        .firstWhere((t) => t.id == missed.taskId);
    expect(task.status, 'pending');
    expect(task.dueAt!.isAfter(DateTime.now()), isTrue);
  });
}
