import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/error/error_mapper.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:rapsap_ops_app/features/dsr/data/datasources/dsr_remote_data_source.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/dsr_check.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';
import 'package:rapsap_ops_app/features/dsr/domain/repositories/dsr_repository.dart';

@LazySingleton(as: DsrRepository)
class DsrRepositoryImpl implements DsrRepository {
  const new(this._remote, this._auth);

  final DsrRemoteDataSource _remote;
  final AuthRepository _auth;

  static const Map<TrendPeriod, String> _periods = {
    TrendPeriod.month: '1M',
    TrendPeriod.quarter: '3M',
    TrendPeriod.half: '6M',
    TrendPeriod.year: '1Y',
  };

  @override
  Future<Either<Failure, SalesOverview>> overview(TrendPeriod period) =>
      guardFailure(
        () async => (await _remote.overview(_periods[period]!)).toEntity(),
      );

  @override
  Future<Either<Failure, DsrCheck>> check({
    required String fileName,
    required Uint8List bytes,
  }) => guardFailure(
    () async => (await _remote.check(fileName, bytes)).toEntity(),
  );

  @override
  Future<Either<Failure, DsrSaved>> save(String uploadId) =>
      guardFailure(() async {
        final saved = await _remote.save(uploadId);
        if (saved.storeName.isNotEmpty) return saved.toEntity();
        // The server doesn't send the store name yet; it is the SM's own.
        final store = _auth.lastSignedInUser()?.storeName ?? '';
        return saved.copyWith(storeName: store).toEntity();
      });

  @override
  Future<Either<Failure, Unit>> post({
    required DateTime date,
    required Uint8List image,
    required List<String> conversationIds,
  }) => guardFailure(() async {
    await _remote.post(date, image, conversationIds);
    return unit;
  });
}
