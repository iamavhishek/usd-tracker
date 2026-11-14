import 'package:material_ui/material_ui.dart';

import '../theme/app_sizes.dart';
import '../theme/context_x.dart';

class AppSpinner extends StatelessWidget {
  const AppSpinner({super.key, this.color, this.size = AppSizes.iconSm});

  final Color? color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: CircularProgressIndicator(
        strokeWidth: AppSizes.spinnerStroke,
        color: color ?? context.palette.accent,
      ),
    );
  }
}
