import 'package:equatable/equatable.dart';

enum DsrField { store, date, netSales, bills, monthTarget, dayTarget }

class DsrCheckLine extends Equatable {
  const new({required this.field, required this.value, required this.ok});

  final DsrField field;
  final String value;
  final bool ok;

  @override
  List<Object?> get props => [field, value, ok];
}

/// C21 · What the server read from the Excel, before saving.
class DsrCheck extends Equatable {
  const new({
    required this.uploadId,
    required this.fileName,
    required this.size,
    required this.lines,
    required this.warnings,
    required this.replacesExisting,
  });

  final String uploadId;
  final String fileName;
  final int size;
  final List<DsrCheckLine> lines;

  /// Server-localised notes that don't block saving.
  final List<String> warnings;
  final bool replacesExisting;

  @override
  List<Object?> get props => [
    uploadId,
    fileName,
    size,
    lines,
    warnings,
    replacesExisting,
  ];
}

/// C23 · Saved DSR summary for the snapshot.
class DsrSaved extends Equatable {
  const new({
    required this.date,
    required this.storeName,
    required this.sales,
    required this.bills,
    required this.mtdPercent,
    required this.savedAt,
    required this.onTime,
  });

  final DateTime date;
  final String storeName;
  final num sales;
  final int bills;
  final int mtdPercent;
  final DateTime savedAt;
  final bool onTime;

  num get ticketSize => bills == 0 ? 0 : sales / bills;

  @override
  List<Object?> get props => [
    date,
    storeName,
    sales,
    bills,
    mtdPercent,
    savedAt,
    onTime,
  ];
}
