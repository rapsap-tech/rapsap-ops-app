import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:injectable/injectable.dart';
import 'package:rapsap_ops_app/core/constants/app_constants.dart';
import 'package:rapsap_ops_app/core/services/media/jpeg_encoder_stub.dart'
    if (dart.library.js_interop) 'package:rapsap_ops_app/core/services/media/jpeg_encoder_web.dart'
    if (dart.library.io) 'package:rapsap_ops_app/core/services/media/jpeg_encoder_mobile.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/gen/fonts.gen.dart';

/// Proof photo pipeline (CK-12, CK-15): resize to 1280 px, burn in the
/// stamp, then JPEG-encode down to ~300 KB.
@lazySingleton
class PhotoProcessor {
  static const double _stampFontRatio = 0.022;
  static const double _stampPaddingRatio = 0.5;
  static const double _stampMarginRatio = 1;

  Future<Uint8List> stampAndCompress(Uint8List raw, List<String> stamp) async {
    final codec = await ui.instantiateImageCodec(raw);
    final source = (await codec.getNextFrame()).image;
    final size = fitWithin(
      source.width,
      source.height,
      AppConstants.photoMaxSide,
    );
    final recorder = ui.PictureRecorder();
    final canvas = ui.Canvas(recorder)
      ..drawImageRect(
        source,
        ui.Rect.fromLTWH(
          0,
          0,
          source.width.toDouble(),
          source.height.toDouble(),
        ),
        ui.Rect.fromLTWH(0, 0, size.width, size.height),
        ui.Paint()..filterQuality = ui.FilterQuality.high,
      );
    if (stamp.isNotEmpty) _drawStamp(canvas, size, stamp);
    final stamped = await recorder.endRecording().toImage(
      size.width.round(),
      size.height.round(),
    );
    source.dispose();
    try {
      var bytes = Uint8List(0);
      for (final quality in AppConstants.photoJpegQualities) {
        bytes = await encodeJpeg(stamped, quality);
        if (bytes.length <= AppConstants.photoMaxBytes) break;
      }
      return bytes;
    } finally {
      stamped.dispose();
    }
  }

  /// Scales so the longest side is at most [maxSide]; never upscales.
  static ui.Size fitWithin(int width, int height, int maxSide) {
    final scale = math.min(1, maxSide / math.max(width, height));
    return ui.Size(
      (width * scale).roundToDouble(),
      (height * scale).roundToDouble(),
    );
  }

  void _drawStamp(ui.Canvas canvas, ui.Size size, List<String> lines) {
    final fontSize = size.shortestSide * _stampFontRatio;
    final padding = fontSize * _stampPaddingRatio;
    final margin = fontSize * _stampMarginRatio;
    final builder =
        ui.ParagraphBuilder(
            ui.ParagraphStyle(
              fontFamily: FontFamily.dMSans,
              fontSize: fontSize,
            ),
          )
          ..pushStyle(ui.TextStyle(color: AppColors.onPrimary))
          ..addText(lines.join('\n'));
    final paragraph = builder.build()
      ..layout(ui.ParagraphConstraints(width: size.width - margin * 4));
    final box = ui.Rect.fromLTWH(
      margin,
      size.height - margin - paragraph.height - padding * 2,
      paragraph.longestLine + padding * 2,
      paragraph.height + padding * 2,
    );
    canvas
      ..drawRRect(
        ui.RRect.fromRectAndRadius(box, ui.Radius.circular(padding)),
        ui.Paint()..color = AppColors.stampBackground,
      )
      ..drawParagraph(paragraph, box.topLeft.translate(padding, padding));
  }
}
