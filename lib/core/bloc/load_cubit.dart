import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';

enum LoadStatus { loading, success, failure }

class LoadState<T> extends Equatable {
  const new({this.status = LoadStatus.loading, this.data, this.failure});

  final LoadStatus status;
  final T? data;
  final Failure? failure;

  @override
  List<Object?> get props => [status, data, failure];
}

/// Loads one thing for a screen. Keeps showing old data while refreshing.
class LoadCubit<T> extends Cubit<LoadState<T>> {
  new(this._fetch) : super(LoadState<T>());

  final Future<Either<Failure, T>> Function() _fetch;

  Future<void> load() async {
    if (state.data == null) emit(LoadState<T>());
    final result = await _fetch();
    if (isClosed) return;
    emit(
      result.match(
        (failure) => LoadState<T>(
          status: LoadStatus.failure,
          data: state.data,
          failure: failure,
        ),
        (data) => LoadState<T>(status: LoadStatus.success, data: data),
      ),
    );
  }

  /// Local change after an action, without a reload.
  void replace(T data) =>
      emit(LoadState<T>(status: LoadStatus.success, data: data));

  void onConnectionRestored() {
    if (state.failure is NoInternetFailure) unawaited(load());
  }
}
