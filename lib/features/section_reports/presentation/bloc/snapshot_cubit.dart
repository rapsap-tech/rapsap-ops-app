import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/bloc/load_cubit.dart';
import 'package:rapsap_ops_app/core/error/failures.dart';
import 'package:rapsap_ops_app/core/services/media/photo_processor.dart';
import 'package:rapsap_ops_app/core/utils/logger.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/entities/report_snapshot.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/get_report_snapshot.dart';
import 'package:rapsap_ops_app/features/section_reports/domain/usecases/post_snapshot.dart';

class SnapshotState extends Equatable {
  const new({
    this.load = LoadStatus.loading,
    this.snapshot,
    this.targets = const {},
    this.posting = false,
    this.posted = false,
    this.failure,
  });

  final LoadStatus load;
  final ReportSnapshot? snapshot;
  final Set<String> targets;
  final bool posting;
  final bool posted;
  final Failure? failure;

  SnapshotState copyWith({
    LoadStatus? load,
    ReportSnapshot? snapshot,
    Set<String>? targets,
    bool? posting,
    bool? posted,
    Failure? failure,
  }) => SnapshotState(
    load: load ?? this.load,
    snapshot: snapshot ?? this.snapshot,
    targets: targets ?? this.targets,
    posting: posting ?? this.posting,
    posted: posted ?? this.posted,
    failure: failure,
  );

  @override
  List<Object?> get props => [
    load,
    snapshot,
    targets,
    posting,
    posted,
    failure,
  ];
}

/// C19 · Report snapshot → "Post to chat" (SM-32).
@injectable
class SnapshotCubit extends Cubit<SnapshotState> {
  new(this._get, this._post, this._processor) : super(const SnapshotState());

  final GetReportSnapshot _get;
  final PostSnapshot _post;
  final PhotoProcessor _processor;
  late String _id;

  Future<void> load(String reportId) async {
    _id = reportId;
    final result = await _get(reportId);
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(load: LoadStatus.failure, failure: f),
        (s) => state.copyWith(
          load: LoadStatus.success,
          snapshot: s,
          targets: {if (s.targets.isNotEmpty) s.targets.first.conversationId},
        ),
      ),
    );
  }

  Future<void> reload() => load(_id);

  void toggle(String conversationId) => emit(
    state.copyWith(
      targets: state.targets.contains(conversationId)
          ? ({...state.targets}..remove(conversationId))
          : {...state.targets, conversationId},
    ),
  );

  /// [png] is the rendered snapshot card.
  Future<void> post(Future<Uint8List> Function() png) async {
    if (state.posting || state.targets.isEmpty) return;
    emit(state.copyWith(posting: true));
    final Uint8List image;
    try {
      image = await _processor.stampAndCompress(await png(), const []);
    } on Object catch (error, stackTrace) {
      appLogger.e(
        'Snapshot render failed',
        error: error,
        stackTrace: stackTrace,
      );
      if (!isClosed) {
        emit(state.copyWith(posting: false, failure: const UnknownFailure()));
      }
      return;
    }
    final result = await _post(
      _id,
      image: image,
      conversationIds: state.targets.toList(),
    );
    if (isClosed) return;
    emit(
      result.match(
        (f) => state.copyWith(posting: false, failure: f),
        (_) => state.copyWith(posting: false, posted: true),
      ),
    );
  }
}
