import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/features/review/domain/entities/review_item.dart';
import 'package:rapsap_ops_app/features/review/domain/usecases/get_review_queue.dart';

/// SM's queue of entries to act on (C2) and the Checklist tab badge.
@injectable
class ReviewQueueCubit extends LoadCubit<List<ReviewItem>> {
  new(GetReviewQueue get) : super(get.call);
}

/// Selected filter on the review queue (SM-10).
@injectable
class ReviewFilterCubit extends Cubit<ReviewKind> {
  new() : super(ReviewKind.needsReview);

  void select(ReviewKind kind) => emit(kind);
}
