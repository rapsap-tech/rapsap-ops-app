import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rapsap_ops_app/features/checklist/domain/entities/capture_session.dart';

part 'capture_session_model.freezed.dart';
part 'capture_session_model.g.dart';

@freezed
abstract class CaptureSessionModel with _$CaptureSessionModel {
  const factory({
    required String token,
    required DateTime serverTime,
    required String storeCode,
    required String storeName,
    required String staffName,
    required int taskNumber,
  }) = _CaptureSessionModel;

  const new _();

  factory fromJson(Map<String, dynamic> json) =>
      _$CaptureSessionModelFromJson(json);

  CaptureSession toEntity() => CaptureSession(
    token: token,
    serverTime: serverTime,
    storeCode: storeCode,
    storeName: storeName,
    staffName: staffName,
    taskNumber: taskNumber,
  );
}
