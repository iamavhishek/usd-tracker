import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import '../theme/app_palette.dart';
import '../theme/app_sizes.dart';
import '../theme/app_spacing.dart';
import '../theme/context_x.dart';
import 'app_icon_button.dart';

/// Shared page chrome: a quiet custom header (no stock Material app bar) and a
/// body constrained to a readable width on tablets.
class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    required this.body,
    this.subtitle,
    this.actions = const <Widget>[],
    this.onBack,
  });

  final String title;
  final String? subtitle;
  final List<Widget> actions;
  final Widget body;
  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: palette.canvas,
        statusBarIconBrightness: context.isDark
            ? Brightness.light
            : Brightness.dark,
        systemNavigationBarColor: palette.surface,
        systemNavigationBarIconBrightness: context.isDark
            ? Brightness.light
            : Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: palette.canvas,
        body: SafeArea(
          bottom: false,
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: AppSizes.maxContentWidth,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(
                      AppSpacing.x4,
                      AppSpacing.x3,
                      AppSpacing.x4,
                      AppSpacing.x3,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (onBack != null) ...<Widget>[
                          AppIconButton(
                            icon: Icons.arrow_back_rounded,
                            tooltip: 'Back',
                            onPressed: onBack,
                          ),
                          const SizedBox(width: AppSpacing.x1),
                        ],
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(title, style: context.text.titleLarge),
                              if (subtitle != null) ...<Widget>[
                                const SizedBox(height: AppSpacing.x1),
                                Text(subtitle!, style: context.text.bodySmall),
                              ],
                            ],
                          ),
                        ),
                        if (actions.isNotEmpty)
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              for (
                                int index = 0;
                                index < actions.length;
                                index++
                              ) ...<Widget>[
                                if (index > 0)
                                  const SizedBox(width: AppSpacing.x1),
                                actions[index],
                              ],
                            ],
                          ),
                      ],
                    ),
                  ),
                  Expanded(child: body),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
