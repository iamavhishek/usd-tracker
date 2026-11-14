import 'package:material_ui/material_ui.dart';

import '../icons/app_icons.dart';
import '../theme/app_palette.dart';
import '../theme/app_motion.dart';
import '../theme/app_radius.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import '../theme/context_x.dart';
import 'app_pressable.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onSelected,
  });

  final int currentIndex;
  final ValueChanged<int> onSelected;

  static const List<({IconData icon, IconData selectedIcon, String label})>
  _items = <({IconData icon, IconData selectedIcon, String label})>[
    (icon: AppIcons.rates, selectedIcon: AppIcons.rates, label: 'Rate'),
    (
      icon: AppIcons.alerts,
      selectedIcon: AppIcons.alertsActive,
      label: 'Alerts',
    ),
    (
      icon: AppIcons.settings,
      selectedIcon: AppIcons.settings,
      label: 'Settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return Container(
      decoration: BoxDecoration(
        color: palette.surface,
        border: Border(
          top: BorderSide(color: palette.line, width: AppSizes.hairline),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: AppSizes.navBar,
          child: Row(
            children: <Widget>[
              for (int index = 0; index < _items.length; index++)
                Expanded(
                  child: _NavItem(
                    icon: index == currentIndex
                        ? _items[index].selectedIcon
                        : _items[index].icon,
                    label: _items[index].label,
                    selected: index == currentIndex,
                    onPressed: () => onSelected(index),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onPressed,
  });

  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;
    final Color color = selected ? palette.accent : palette.inkMuted;

    return AppPressable(
      onPressed: onPressed,
      semanticLabel: label,
      borderRadius: AppRadius.pill,
      pressedColor: palette.line,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          AnimatedContainer(
            duration: AppMotion.of(context, AppMotion.fast),
            curve: AppMotion.feedback,
            width: AppSizes.navIndicatorWidth,
            height: AppSizes.navIndicatorHeight,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: selected
                  ? palette.accent.withValues(alpha: 0.12)
                  : palette.canvas.withValues(alpha: 0),
              borderRadius: BorderRadius.circular(AppRadius.pill),
            ),
            child: Icon(icon, size: AppSizes.icon, color: color),
          ),
          const SizedBox(height: AppSpacing.x1),
          Text(label, style: context.text.labelMedium?.copyWith(color: color)),
        ],
      ),
    );
  }
}
