import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/section_report.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_section_reports.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/submit_section_report.dart';

/// C17 · today's section reports.
@injectable
class SectionReportsCubit extends LoadCubit<List<SectionReport>> {
  new(GetSectionReports get) : super(get.call);
}

enum SubmitReportStatus { idle, sending, sent, failure }

class SubmitReportState extends Equatable {
  const new({
    this.note = '',
    this.status = SubmitReportStatus.idle,
    this.failure,
  });

  final String note;
  final SubmitReportStatus status;
  final Failure? failure;

  @override
  List<Object?> get props => [note, status, failure];
}

/// "Note to HO" + "Submit to HO" on one report card (also resubmits X11).
@injectable
class SubmitReportCubit extends Cubit<SubmitReportState> {
  new(this._submit) : super(const SubmitReportState());

  final SubmitSectionReport _submit;

  void noteChanged(String note) => emit(SubmitReportState(note: note));

  Future<void> submit(String reportId) async {
    if (state.status == SubmitReportStatus.sending) return;
    final note = state.note;
    emit(SubmitReportState(note: note, status: SubmitReportStatus.sending));
    final result = await _submit(reportId, note: note);
    if (isClosed) return;
    emit(
      result.match(
        (f) => SubmitReportState(
          note: note,
          status: SubmitReportStatus.failure,
          failure: f,
        ),
        (_) => SubmitReportState(note: note, status: SubmitReportStatus.sent),
      ),
    );
  }
}
