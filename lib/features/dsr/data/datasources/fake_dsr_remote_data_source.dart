import 'dart:math' as math;
import 'dart:typed_data';

import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/config/env_config.dart';
import 'package:rapsap_ops_app/core/error/exceptions.dart';
import 'package:rapsap_ops_app/features/dsr/data/datasources/dsr_remote_data_source.dart';
import 'package:rapsap_ops_app/features/dsr/data/models/dsr_models.dart';
import 'package:rapsap_ops_app/features/section_reports/data/datasources/fake_report_remote_data_source.dart';

/// Pretends to read the Excel. A file name containing "rio" is another
/// store's DSR (C22); "macro" has macros. Saving feeds the daily summary.
@fakeApi
@LazySingleton(as: DsrRemoteDataSource)
class FakeDsrRemoteDataSource implements DsrRemoteDataSource {
  static const Duration _latency = Duration(milliseconds: 600);
  static const num _sales = 64210;
  static const int _bills = 412;
  static const num _target = 2750000;
  static const num _mtd = 1840000;

  DsrPostingModel? _today;

  @override
  Future<SalesOverviewModel> overview(String period) async {
    await Future<void>.delayed(_latency);
    final now = DateTime.now();
    final day = DateTime(now.year, now.month, now.day);
    final days = switch (period) {
      '3M' => 90,
      '6M' => 180,
      '1Y' => 365,
      _ => 30,
    };
    final points = math.min(days, 30);
    return SalesOverviewModel(
      date: now,
      dueAt: day.add(const Duration(hours: 23)),
      salesMtd: _mtd + (_today == null ? 0 : _sales),
      target: _target,
      needPerDay: 75800,
      changePercent: 8.2,
      trend: [
        for (var i = 1; i <= points; i++)
          TrendPointModel(
            day: i,
            current: 52000 + 9000 * math.sin(i / 3) + i * 300,
            previous: 50000 + 8000 * math.sin(i / 3 + 1),
          ),
      ],
      history: [
        DsrPostingModel(
          date: day.subtract(const Duration(days: 1)),
          postedAt: day.subtract(const Duration(minutes: 78)),
          onTime: true,
        ),
        DsrPostingModel(
          date: day.subtract(const Duration(days: 2)),
          postedAt: day.subtract(const Duration(days: 1, minutes: -18)),
          onTime: false,
        ),
      ],
      todaysPosting: _today,
    );
  }

  @override
  Future<DsrCheckModel> check(String fileName, Uint8List bytes) async {
    await Future<void>.delayed(_latency);
    final name = fileName.toLowerCase();
    if (name.contains('rio')) {
      throw const DsrRejectedException('wrong_store', detectedStore: 'Rio');
    }
    if (name.contains('macro')) throw const DsrRejectedException('has_macros');
    return DsrCheckModel(
      uploadId: 'up-${DateTime.now().millisecondsSinceEpoch}',
      fileName: fileName,
      size: bytes.length,
      lines: const [
        DsrCheckLineModel(field: 'store', value: 'Walk Hiranandani', ok: true),
        DsrCheckLineModel(field: 'date', value: 'Today', ok: true),
        DsrCheckLineModel(field: 'net_sales', value: '₹64,210', ok: true),
        DsrCheckLineModel(field: 'bills', value: '412', ok: true),
        DsrCheckLineModel(field: 'month_target', value: '₹27.5 L', ok: true),
      ],
      warnings: const ['Wine & beer target is missing. You can still save.'],
      replacesExisting: _today != null,
    );
  }

  @override
  Future<DsrSavedModel> save(String uploadId) async {
    await Future<void>.delayed(_latency);
    final now = DateTime.now();
    final onTime = now.hour < 23;
    _today = DsrPostingModel(date: now, postedAt: now, onTime: onTime);
    FakeReportRemoteDataSource.todaysDsr = (sales: _sales, bills: _bills);
    return DsrSavedModel(
      date: now,
      storeName: 'Walk Hiranandani',
      sales: _sales,
      bills: _bills,
      mtdPercent: ((_mtd + _sales) * 100 / _target).round(),
      savedAt: now,
      onTime: onTime,
    );
  }

  @override
  Future<void> post(
    DateTime date,
    Uint8List image,
    List<String> conversationIds,
  ) => Future<void>.delayed(_latency);
}
