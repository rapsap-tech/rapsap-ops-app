import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/daily_summary.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_daily_summary_form.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_daily_summary.dart';

enum SummaryField {
  margin,
  complaints,
  damages,
  shrinkage,
  manpower,
  keyIssues,
}

class DailySummaryState extends Equatable {
  const new({
    this.load = LoadStatus.loading,
    this.form,
    this.values = const {},
    this.sending = false,
    this.sent = false,
    this.failure,
  });

  final LoadStatus load;
  final DailySummaryForm? form;
  final Map<SummaryField, String> values;
  final bool sending;
  final bool sent;
  final Failure? failure;

  num? number(SummaryField f) => num.tryParse(values[f]?.trim() ?? '');

  /// Every number filled and within range; key issues may be empty.
  bool get valid {
    final staff = form?.staffTotal ?? 0;
    final margin = number(SummaryField.margin);
    final manpower = number(SummaryField.manpower);
    return margin != null &&
        margin >= 0 &&
        margin <= 100 &&
        number(SummaryField.complaints) != null &&
        number(SummaryField.damages) != null &&
        number(SummaryField.shrinkage) != null &&
        manpower != null &&
        manpower >= 0 &&
        manpower <= staff;
  }

  DailySummaryState copyWith({
    LoadStatus? load,
    DailySummaryForm? form,
    Map<SummaryField, String>? values,
    bool? sending,
    bool? sent,
    Failure? failure,
  }) => DailySummaryState(
    load: load ?? this.load,
    form: form ?? this.form,
    values: values ?? this.values,
    sending: sending ?? this.sending,
    sent: sent ?? this.sent,
    failure: failure,
  );

  @override
  List<Object?> get props => [load, form, values, sending, sent, failure];
}

/// C18 · closing daily summary (needs today's DSR, else X12).
@injectable
class DailySummaryCubit extends Cubit<DailySummaryState> {
  new(this._get, this._submit) : super(const DailySummaryState()) {
    unawaited(load());
  }

  final GetDailySummaryForm _get;
  final SubmitDailySummary _submit;

  Future<void> load() async {
    emit(state.copyWith(load: LoadStatus.loading));
    final result = await _get();
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(load: LoadStatus.failure, failure: f),
        (form) => state.copyWith(load: LoadStatus.success, form: form),
      ),
    );
  }

  void changed(SummaryField field, String value) =>
      emit(state.copyWith(values: {...state.values, field: value}));

  Future<void> submit() async {
    if (!state.valid || state.sending) return;
    emit(state.copyWith(sending: true));
    num n(SummaryField f) => state.number(f) ?? 0;
    final result = await _submit(
      DailySummaryInput(
        marginPercent: n(SummaryField.margin),
        complaints: n(SummaryField.complaints).toInt(),
        damages: n(SummaryField.damages),
        shrinkage: n(SummaryField.shrinkage),
        manpowerPresent: n(SummaryField.manpower).toInt(),
        keyIssues: state.values[SummaryField.keyIssues]?.trim() ?? '',
      ),
    );
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(sending: false, failure: f),
        (_) => state.copyWith(sending: false, sent: true),
      ),
    );
  }
}
