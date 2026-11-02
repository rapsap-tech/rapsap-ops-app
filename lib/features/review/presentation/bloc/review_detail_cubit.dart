import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_detail.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/get_review_detail.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/take_over_task.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/unlock_task.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/verify_entry.dart';

enum ReviewAction { verify, unlock, takeOver }

class ReviewDetailState extends Equatable {
  const new({
    this.load = LoadStatus.loading,
    this.detail,
    this.running,
    this.done,
    this.failure,
  });

  final LoadStatus load;
  final ReviewDetail? detail;

  /// Action in flight (its button shows a spinner, the others are disabled).
  final ReviewAction? running;

  /// Last action that succeeded.
  final ReviewAction? done;
  final Failure? failure;

  ReviewDetailState copyWith({
    LoadStatus? load,
    ReviewDetail? detail,
    ReviewAction? running,
    ReviewAction? done,
    Failure? failure,
  }) => ReviewDetailState(
    load: load ?? this.load,
    detail: detail ?? this.detail,
    running: running,
    done: done,
    failure: failure,
  );

  @override
  List<Object?> get props => [load, detail, running, done, failure];
}

/// C3 report review and C6 missed task.
@injectable
class ReviewDetailCubit extends Cubit<ReviewDetailState> {
  new(this._get, this._verify, this._unlock, this._takeOver)
    : super(const ReviewDetailState());

  final GetReviewDetail _get;
  final VerifyEntry _verify;
  final UnlockTask _unlock;
  final TakeOverTask _takeOver;
  late String _taskId;

  Future<void> load(String taskId) async {
    _taskId = taskId;
    emit(state.copyWith(load: LoadStatus.loading));
    final result = await _get(taskId);
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(load: LoadStatus.failure, failure: f),
        (d) => state.copyWith(load: LoadStatus.success, detail: d),
      ),
    );
  }

  Future<void> reload() => load(_taskId);

  Future<void> verify() => _act(ReviewAction.verify, () => _verify(_taskId));

  Future<void> unlock() => _act(ReviewAction.unlock, () => _unlock(_taskId));

  Future<void> takeOver() =>
      _act(ReviewAction.takeOver, () => _takeOver(_taskId));

  Future<void> _act(
    ReviewAction action,
    Future<Either<Failure, Unit>> Function() call,
  ) async {
    if (state.running != null) return;
    emit(state.copyWith(running: action));
    final result = await call();
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(failure: f),
        (_) => state.copyWith(done: action),
      ),
    );
  }
}
