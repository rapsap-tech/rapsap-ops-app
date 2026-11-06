import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/features/dsr/data/datasources/fake_dsr_remote_data_source.dart';
import 'package:rapsap_ops_app/features/dsr/data/repositories/dsr_repository_impl.dart';
import 'package:rapsap_ops_app/features/dsr/domain/usecases/check_dsr_file.dart';
import 'package:rapsap_ops_app/features/section_reports/data/datasources/fake_report_remote_data_source.dart';

import '../../helpers/signed_out_auth.dart';

void main() {
  late DsrRepositoryImpl repo;
  late CheckDsrFile check;

  setUp(() {
    repo = DsrRepositoryImpl(FakeDsrRemoteDataSource(), SignedOutAuth());
    check = CheckDsrFile(repo);
  });

  test('files over 5 MB are refused before upload (DSR-01)', () async {
    final big = Uint8List(
      AppConstants.dsrMaxUploadMb * AppConstants.bytesPerMb + 1,
    );
    expect(
      await check(fileName: 'DSR.xlsx', bytes: big),
      const Left<Failure, dynamic>(DsrRejectedFailure(DsrRejection.tooLarge)),
    );
  });

  test("another store's DSR is refused with the store name (C22)", () async {
    final result = await check(
      fileName: 'DSR_Rio_19Oct.xlsx',
      bytes: Uint8List(10),
    );
    expect(
      result,
      const Left<Failure, dynamic>(
        DsrRejectedFailure(DsrRejection.wrongStore, detectedStore: 'Rio'),
      ),
    );
  });

  test('saving the DSR unlocks the closing daily summary (X12)', () async {
    final upload = (await repo.check(
      fileName: 'DSR.xlsx',
      bytes: Uint8List(10),
    )).toNullable()!;
    await repo.save(upload.uploadId);
    expect(FakeReportRemoteDataSource.todaysDsr?.bills, 412);
  });
}
