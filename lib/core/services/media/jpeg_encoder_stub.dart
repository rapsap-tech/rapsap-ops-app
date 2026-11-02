import 'dart:typed_data';
import 'dart:ui' as ui;

Future<Uint8List> encodeJpeg(ui.Image image, int quality) =>
    throw UnsupportedError('No JPEG encoder for this platform');
