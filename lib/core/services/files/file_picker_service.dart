import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:injectable/injectable.dart';

class PickedFile extends Equatable {
  const new({required this.name, required this.bytes});

  final String name;
  final Uint8List bytes;

  int get size => bytes.length;

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
    return PickedFile(name: file.name, bytes: await file.readAsBytes());
  }
}
