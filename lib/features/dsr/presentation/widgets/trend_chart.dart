import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:rapsap_ops_app/core/theme/app_colors.dart';
import 'package:rapsap_ops_app/core/theme/dimens.dart';
import 'package:rapsap_ops_app/features/dsr/domain/entities/sales_overview.dart';

/// This period (solid) vs the same days last period (dashed).
class TrendChart extends StatelessWidget {
  const new({required this.points, super.key});

  final List<TrendPoint> points;

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size.infinite,
    painter: _TrendPainter(points, Dimens.chartStroke, Dimens.chartDash),
  );
}

class _TrendPainter extends CustomPainter {
  new(this.points, this.stroke, this.dash);

  final List<TrendPoint> points;
  final double stroke;
  final double dash;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;
    final values = [
      for (final p in points) ...[p.current, ?p.previous],
    ];
    final maxV = values.reduce(math.max).toDouble();
    final minV = values.reduce(math.min).toDouble();
    final range = maxV - minV == 0 ? 1 : maxV - minV;
    Offset at(int i, num v) => Offset(
      size.width * i / (points.length - 1),
      size.height - size.height * (v - minV) / range,
    );
    Path line(num? Function(TrendPoint p) value) {
      final path = Path();
      var started = false;
      for (var i = 0; i < points.length; i++) {
        final v = value(points[i]);
        if (v == null) continue;
        final o = at(i, v);
        started ? path.lineTo(o.dx, o.dy) : path.moveTo(o.dx, o.dy);
        started = true;
      }
      return path;
    }

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round;
    canvas
      ..drawPath(
        _dashed(line((p) => p.previous)),
        paint..color = AppColors.disabled,
      )
      ..drawPath(line((p) => p.current), paint..color = AppColors.primary);
  }

  Path _dashed(Path source) {
    final out = Path();
    for (final metric in source.computeMetrics()) {
      for (double d = 0; d < metric.length; d += dash * 2) {
        out.addPath(metric.extractPath(d, d + dash), Offset.zero);
      }
    }
    return out;
  }

  @override
  bool shouldRepaint(_TrendPainter old) => old.points != points;
}
