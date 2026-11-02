import 'package:equatable/equatable.dart';

enum SectionStatus {
  inProgress,
  critical,
  ready,
  submitted,
  approved,
  returned,
}

class SectionProgress extends Equatable {
  const new({
    required this.id,
    required this.name,
    required this.status,
    required this.done,
    required this.total,
    this.missed = 0,
  });

  final String id;
  final String name;
  final SectionStatus status;
  final int done;
  final int total;
  final int missed;

  @override
  List<Object?> get props => [id, name, status, done, total, missed];
}

/// Month-to-date sales vs target, from the latest DSR (SM-03).
class SalesSummary extends Equatable {
  const new({
    required this.month,
    required this.salesMtd,
    required this.target,
    required this.dsrDueAt,
  });

  final DateTime month;
  final num salesMtd;
  final num target;
  final DateTime dsrDueAt;

  int get percent => target == 0 ? 0 : (salesMtd * 100 / target).round();

  @override
  List<Object?> get props => [month, salesMtd, target, dsrDueAt];
}

/// C1 · SM home.
class ManagerDashboard extends Equatable {
  const new({
    required this.date,
    required this.done,
    required this.total,
    required this.toReview,
    required this.missed,
    required this.notDone,
    required this.sections,
    this.sales,
  });

  final DateTime date;
  final int done;
  final int total;
  final int toReview;
  final int missed;
  final int notDone;
  final List<SectionProgress> sections;
  final SalesSummary? sales;

  @override
  List<Object?> get props => [
    date,
    done,
    total,
    toReview,
    missed,
    notDone,
    sections,
    sales,
  ];
}
