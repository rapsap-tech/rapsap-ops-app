import 'package:flutter_test/flutter_test.dart';
import 'package:rapsap_ops_app/core/services/media/photo_processor.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';
import 'package:rapsap_ops_app/features/checklist/presentation/widgets/capture_stamp.dart';

void main() {
  test('stamp uses server time in IST plus elapsed time (CK-12)', () {
    final session = CaptureSession(
      token: 't',
      serverTime: DateTime.utc(2026, 10, 19, 4, 51, 8),
      storeCode: 'S04',
      storeName: 'WALK HIRANANDANI',
      staffName: 'Santosh Pawar',
      taskNumber: 22,
    );
    expect(captureStampLines(session, const Duration(seconds: 2)), [
      'RAPSAP · S04 WALK HIRANANDANI',
      'Santosh Pawar · Task #22',
      '19 Oct 2026 · 10:21:10 AM IST',
    ]);
  });

  test('photos are scaled to 1280 px on the long side, never up (CK-15)', () {
    final big = PhotoProcessor.fitWithin(4000, 3000, 1280);
    expect((big.width, big.height), (1280, 960));
    final small = PhotoProcessor.fitWithin(800, 600, 1280);
    expect((small.width, small.height), (800, 600));
  });
}
