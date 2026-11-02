import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/today_checklist.dart';
import 'package:rapsap_ops_app/features/checklist/domain/usecases/get_today_checklist.dart';

class TodayChecklistState extends Equatable {
  const new({
    this.status = LoadStatus.loading,
    this.checklist,
    this.filter = ChecklistFilter.all,
    this.failure,
  });

  final LoadStatus status;
  final TodayChecklist? checklist;
  final ChecklistFilter filter;
  final Failure? failure;

  TodayChecklistState copyWith({
    LoadStatus? status,
    TodayChecklist? checklist,
    ChecklistFilter? filter,
    Failure? failure,
  }) => TodayChecklistState(
    status: status ?? this.status,
    checklist: checklist ?? this.checklist,
    filter: filter ?? this.filter,
    failure: failure,
  );

  @override
  List<Object?> get props => [status, checklist, filter, failure];
}

/// Today's tasks, shared by the Home and Checklist tabs and the nav badge.
@injectable
class TodayChecklistCubit extends Cubit<TodayChecklistState> {
  new(this._getToday) : super(const TodayChecklistState());

  final GetTodayChecklist _getToday;

  Future<void> load() async {
    // Keep showing loaded data during a refresh.
    if (state.checklist == null) {
      emit(state.copyWith(status: LoadStatus.loading));
    }
    final result = await _getToday();
    if (isClosed) return;
    emit(
      result.match(
        (failure) =>
            state.copyWith(status: LoadStatus.failure, failure: failure),
        (checklist) =>
            state.copyWith(status: LoadStatus.success, checklist: checklist),
      ),
    );
  }

  void setFilter(ChecklistFilter filter) =>
      emit(state.copyWith(filter: filter));

  /// Retry after the connection returns if we failed for lack of it.
  void onConnectionRestored() {
    if (state.failure is NoInternetFailure) unawaited(load());
  }
}
