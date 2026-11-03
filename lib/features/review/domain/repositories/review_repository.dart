import 'package:fpdart/fpdart.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/media_file.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/manager_dashboard.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_detail.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';

enum EditReason { photoUnclear, wrongPhoto, remarkMissing, other }

abstract class ReviewRepository {
  Future<Either<Failure, ManagerDashboard>> dashboard();
  Future<Either<Failure, List<ReviewItem>>> queue();
  Future<Either<Failure, ReviewDetail>> detail(String taskId);
  Future<Either<Failure, Unit>> verify(String taskId);
  Future<Either<Failure, Unit>> sendBack(String taskId, String reason);
  Future<Either<Failure, Unit>> editEntry({
    required String taskId,
    required MediaFile media,
    required String captureToken,
    required EditReason reason,
    required String remarks,
  });

  /// Reopens a missed task for the staff member for 30 minutes (SM-23).
  Future<Either<Failure, Unit>> unlock(String taskId);

  /// SM does the task himself; it is marked "Done by SM" (SM-22).
  Future<Either<Failure, Unit>> takeOver(String taskId);
}
