import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';

class PickedFile extends Equatable {
  const new({required this.name, required this.bytes, this.skippedSize});

  final String name;

  /// Empty when the file is over the DSR limit, so it is never read.
  final Uint8List bytes;

  /// The real size when [bytes] were skipped for being too large.
  final int? skippedSize;

  int get size => skippedSize ?? bytes.length;

  @override
  List<Object?> get props => [name, bytes.length];
}

/// Document picker (DSR Excel). Photos never come from here (camera only).
@lazySingleton
class FilePickerService {
  static const List<String> _excel = ['xlsx'];

  /// Null when the user cancels.
  Future<PickedFile?> pickExcel() async {
    final files = await FilePicker.pickFiles(
      type: FileType.custom,
      allowedExtensions: _excel,
    );
    if (files.isEmpty) return null;
    final file = files.first;
    final size = await file.length();
    if (size != null &&
        size > AppConstants.dsrMaxUploadMb * AppConstants.bytesPerMb) {
      return PickedFile(
        name: file.name,
        bytes: Uint8List(0),
        skippedSize: size,
      );
    }
    return PickedFile(name: file.name, bytes: await file.readAsBytes());
  }
}
