import 'dart:math' as math;

/// Shape tokens. Nested shapes: outer radius = inner radius + the padding
/// between them.
abstract final class AppRadius {
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double lg = 18.0;
  static const double pill = 999.0;

  static double inner(double outer, double padding) =>
      math.max(0, outer - padding);
}
