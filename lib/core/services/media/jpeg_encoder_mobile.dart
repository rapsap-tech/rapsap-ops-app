import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:flutter_image_compress/flutter_image_compress.dart';

Future<Uint8List> encodeJpeg(ui.Image image, int quality) async {
  final png = await image.toByteData(format: ui.ImageByteFormat.png);
  if (png == null) throw StateError('Could not read photo pixels');
  return await FlutterImageCompress.compressWithList(
    png.buffer.asUint8List(),
    minWidth: image.width,
    minHeight: image.height,
    quality: quality,
  );
}
