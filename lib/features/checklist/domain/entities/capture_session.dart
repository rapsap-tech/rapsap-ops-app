import 'package:equatable/equatable.dart';

/// Issued before the camera opens (CK-12): the stamp must use server time,
/// and [token] ties the upload to this capture.
class CaptureSession extends Equatable {
  const new({
    required this.token,
    required this.serverTime,
    required this.storeCode,
    required this.storeName,
    required this.staffName,
    required this.taskNumber,
  });

  final String token;
  final DateTime serverTime;
  final String storeCode;
  final String storeName;
  final String staffName;
  final int taskNumber;

  @override
  List<Object?> get props => [
    token,
    serverTime,
    storeCode,
    storeName,
    staffName,
    taskNumber,
  ];
}
