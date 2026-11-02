import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';
import 'package:rapsap_ops_app/features/dsr/domain/usecases/get_sales_overview.dart';

class SalesState extends Equatable {
  const new({
    this.status = LoadStatus.loading,
    this.period = TrendPeriod.month,
    this.overview,
    this.failure,
  });

  final LoadStatus status;
  final TrendPeriod period;
  final SalesOverview? overview;
  final Failure? failure;

  SalesState copyWith({
    LoadStatus? status,
    TrendPeriod? period,
    SalesOverview? overview,
    Failure? failure,
  }) => SalesState(
    status: status ?? this.status,
    period: period ?? this.period,
    overview: overview ?? this.overview,
    failure: failure,
  );

  @override
  List<Object?> get props => [status, period, overview, failure];
}

/// C20 · Sales tab with the trend period switch.
@injectable
class SalesCubit extends Cubit<SalesState> {
  new(this._get) : super(const SalesState());

  final GetSalesOverview _get;

  Future<void> load() async {
    final period = state.period;
    final result = await _get(period);
    if (isClosed || period != state.period) return;
    emit(
      result.match(
        (f) => state.copyWith(status: LoadStatus.failure, failure: f),
        (o) => state.copyWith(status: LoadStatus.success, overview: o),
      ),
    );
  }

  void selectPeriod(TrendPeriod period) {
    if (period == state.period) return;
    emit(state.copyWith(period: period));
    unawaited(load());
  }

  void onConnectionRestored() {
    if (state.failure is NoInternetFailure) unawaited(load());
  }
}
