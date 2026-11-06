import 'package:equatable/equatable.dart';

enum TrendPeriod { month, quarter, half, year }

class DsrPosting extends Equatable {
  const new({required this.date, this.postedAt, this.onTime});

  final DateTime date;

  /// Null when the server doesn't say when or whether it was on time.
  final DateTime? postedAt;
  final bool? onTime;

  @override
  List<Object?> get props => [date, postedAt, onTime];
}

class TrendPoint extends Equatable {
  const new({required this.day, required this.current, this.previous});

  final int day;
  final num current;

  /// Same day last period (dashed line).
  final num? previous;

  @override
  List<Object?> get props => [day, current, previous];
}

/// C20 · Sales tab.
class SalesOverview extends Equatable {
  const new({
    required this.date,
    required this.dueAt,
    required this.salesMtd,
    required this.target,
    required this.needPerDay,
    required this.trend,
    required this.changePercent,
    required this.history,
    this.todaysPosting,
  });

  final DateTime date;
  final DateTime dueAt;
  final num salesMtd;
  final num target;
  final num needPerDay;
  final List<TrendPoint> trend;
  final num changePercent;
  final List<DsrPosting> history;

  /// Null until today's DSR is uploaded.
  final DsrPosting? todaysPosting;

  int get percent => target == 0 ? 0 : (salesMtd * 100 / target).round();

  @override
  List<Object?> get props => [
    date,
    dueAt,
    salesMtd,
    target,
    needPerDay,
    trend,
    changePercent,
    history,
    todaysPosting,
  ];
}
