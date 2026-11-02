import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/daily_summary.dart';
import 'package:rapsap_ops_app/features/section_reports/presentation/bloc/daily_summary_cubit.dart';

void main() {
  const form = DailySummaryForm(
    staffTotal: 14,
    dsr: DsrFigures(sales: 64210, bills: 412),
  );

  DailySummaryState state(Map<SummaryField, String> values) =>
      DailySummaryState(load: LoadStatus.success, form: form, values: values);

  final complete = {
    SummaryField.margin: '18.4',
    SummaryField.complaints: '2',
    SummaryField.damages: '1250',
    SummaryField.shrinkage: '430',
    SummaryField.manpower: '13',
  };

  test('valid only when every number is filled and in range', () {
    expect(state(complete).valid, isTrue);
    expect(state({...complete, SummaryField.margin: '120'}).valid, isFalse);
    expect(state({...complete, SummaryField.manpower: '15'}).valid, isFalse);
    expect(state({...complete}..remove(SummaryField.damages)).valid, isFalse);
  });

  test('ticket size is sales ÷ bills', () {
    expect(form.dsr!.ticketSize.round(), 156);
  });
}
