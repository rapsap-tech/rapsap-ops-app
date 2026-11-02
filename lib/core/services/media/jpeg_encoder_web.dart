import 'dart:async';
import 'dart:js_interop';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:web/web.dart' as web;

/// Uses the browser's own JPEG encoder via an offscreen canvas.
Future<Uint8List> encodeJpeg(ui.Image image, int quality) async {
  final rgba = await image.toByteData();
  if (rgba == null) throw StateError('Could not read photo pixels');
  final canvas = web.HTMLCanvasElement()
    ..width = image.width
    ..height = image.height;
  final context = canvas.getContext('2d')! as web.CanvasRenderingContext2D;
  final pixels = web.ImageData(
    Uint8ClampedList.view(rgba.buffer).toJS,
    image.width,
  );
  context.putImageData(pixels, 0, 0);
  final completer = Completer<web.Blob?>();
  // A typed local function: a tear-off of complete() can't cross into JS.
  void onBlob(web.Blob? blob) => completer.complete(blob);
  canvas.toBlob(onBlob.toJS, 'image/jpeg', (quality / 100).toJS);
  final blob = await completer.future;
  if (blob == null) throw StateError('JPEG encoding failed');
  final buffer = await blob.arrayBuffer().toDart;
  return buffer.toDart.asUint8List();
}
