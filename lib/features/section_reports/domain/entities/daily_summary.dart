import 'package:equatable/equatable.dart';

/// Read-only figures from today's DSR (C18).
class DsrFigures extends Equatable {
  const new({required this.sales, required this.bills});

  final num sales;
  final int bills;

  num get ticketSize => bills == 0 ? 0 : sales / bills;

  @override
  List<Object?> get props => [sales, bills];
}

/// What the SM types into the closing daily summary (SM-31).
class DailySummaryInput extends Equatable {
  const new({
    required this.marginPercent,
    required this.complaints,
    required this.damages,
    required this.shrinkage,
    required this.manpowerPresent,
    required this.keyIssues,
  });

  final num marginPercent;
  final int complaints;
  final num damages;
  final num shrinkage;
  final int manpowerPresent;
  final String keyIssues;

  @override
  List<Object?> get props => [
    marginPercent,
    complaints,
    damages,
    shrinkage,
    manpowerPresent,
    keyIssues,
  ];
}

class DailySummaryForm extends Equatable {
  const new({required this.staffTotal, this.dsr});

  /// Null when today's DSR isn't uploaded yet (X12).
  final DsrFigures? dsr;
  final int staffTotal;

  @override
  List<Object?> get props => [dsr, staffTotal];
}
