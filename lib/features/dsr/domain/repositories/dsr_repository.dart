import 'dart:typed_data';

import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/dsr_check.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';

abstract class DsrRepository {
  Future<Either<Failure, SalesOverview>> overview(TrendPeriod period);

  /// Uploads the Excel; the server reads it with this store's format.
  Future<Either<Failure, DsrCheck>> check({
    required String fileName,
    required Uint8List bytes,
  });
  Future<Either<Failure, DsrSaved>> save(String uploadId);
  Future<Either<Failure, Unit>> post({
    required DateTime date,
    required Uint8List image,
    required List<String> conversationIds,
  });
}
