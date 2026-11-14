import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../data/models/rates_models.dart';

/// A quiet line-and-fill sparkline. Colours are passed in from the theme, so
/// this widget holds no palette values.
class RateSparkline extends StatelessWidget {
  const RateSparkline({
    super.key,
    required this.points,
    required this.lineColor,
    required this.fillColor,
    required this.gridColor,
  });

  final List<HistoryPointModel> points;
  final Color lineColor;
  final Color fillColor;
  final Color gridColor;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: SizedBox(
        height: AppSizes.chart,
        width: double.infinity,
        child: CustomPaint(
          painter: _SparklinePainter(
            points: points,
            lineColor: lineColor,
            fillColor: fillColor,
            gridColor: gridColor,
          ),
        ),
      ),
    );
  }
}

class _SparklinePainter extends CustomPainter {
  const _SparklinePainter({
    required this.points,
    required this.lineColor,
    required this.fillColor,
    required this.gridColor,
  });

  final List<HistoryPointModel> points;
  final Color lineColor;
  final Color fillColor;
  final Color gridColor;

  @override
  void paint(Canvas canvas, Size size) {
    if (size.width <= 0 || size.height <= 0) return;

    final Paint gridPaint = Paint()
      ..color = gridColor
      ..strokeWidth = AppSizes.hairline;
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      gridPaint,
    );

    if (points.isEmpty) return;

    double min = points.first.rate;
    double max = points.first.rate;
    for (final HistoryPointModel point in points) {
      min = math.min(min, point.rate);
      max = math.max(max, point.rate);
    }

    final double range = max - min;
    const double inset = AppSpacing.x2;
    final double drawableHeight = math.max(0, size.height - inset * 2);
    final double step = points.length > 1
        ? size.width / (points.length - 1)
        : 0;

    final Path line = Path();
    for (int index = 0; index < points.length; index++) {
      final double normalized = range == 0
          ? 0.5
          : (points[index].rate - min) / range;
      final double x = step * index;
      final double y = inset + drawableHeight * (1 - normalized);
      if (index == 0) {
        line.moveTo(x, y);
      } else {
        line.lineTo(x, y);
      }
    }

    final Path area = Path.from(line)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    canvas.drawPath(area, Paint()..color = fillColor);

    canvas.drawPath(
      line,
      Paint()
        ..color = lineColor
        ..style = PaintingStyle.stroke
        ..strokeWidth = AppSizes.chartStroke
        ..strokeCap = StrokeCap.round
        ..strokeJoin = StrokeJoin.round,
    );

    final Offset last = _pointAt(
      index: points.length - 1,
      step: step,
      inset: inset,
      drawableHeight: drawableHeight,
      min: min,
      range: range,
    );
    canvas.drawCircle(last, AppSizes.chartDot, Paint()..color = lineColor);
  }

  Offset _pointAt({
    required int index,
    required double step,
    required double inset,
    required double drawableHeight,
    required double min,
    required double range,
  }) {
    final double normalized = range == 0
        ? 0.5
        : (points[index].rate - min) / range;
    return Offset(step * index, inset + drawableHeight * (1 - normalized));
  }

  @override
  bool shouldRepaint(covariant _SparklinePainter oldDelegate) {
    return oldDelegate.points != points ||
        oldDelegate.lineColor != lineColor ||
        oldDelegate.fillColor != fillColor ||
        oldDelegate.gridColor != gridColor;
  }
}
