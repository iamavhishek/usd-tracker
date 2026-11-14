import 'package:material_ui/material_ui.dart';

/// Every duration and curve in the app. Feedback is fast; story motion is
/// slower. `of` returns zero when the user asks for reduced motion.
abstract final class AppMotion {
  static const Duration instant = Duration(milliseconds: 100);
  static const Duration fast = Duration(milliseconds: 150);
  static const Duration base = Duration(milliseconds: 250);
  static const Duration slow = Duration(milliseconds: 400);
  static const Duration stagger = Duration(milliseconds: 60);
  static const Duration pulse = Duration(milliseconds: 1200);
  static const Duration toast = Duration(seconds: 4);

  static const Curve travel = Cubic(0.45, 0, 0.1, 1);
  static const Curve arrive = Cubic(0.25, 0.8, 0.25, 1);
  static const Curve feedback = Cubic(0.3, 0.75, 0.1, 1);

  static Duration of(BuildContext context, Duration duration) {
    return MediaQuery.disableAnimationsOf(context) ? Duration.zero : duration;
  }
}
