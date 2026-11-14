import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/icons/app_icons.dart';
import '../../../../core/theme/app_motion.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/context_x.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_button.dart';
import '../../data/models/alert_models.dart';
import '../../bloc/alerts_cubit.dart';

enum _AlertMenuAction { remove }

class AlertRow extends StatefulWidget {
  const AlertRow({super.key, required this.id, this.onBuild});

  final int id;

  /// Test hook used by the rebuild-isolation test.
  @visibleForTesting
  final VoidCallback? onBuild;

  @override
  State<AlertRow> createState() => _AlertRowState();
}

class _AlertRowState extends State<AlertRow> {
  bool _confirming = false;

  @override
  Widget build(BuildContext context) {
    widget.onBuild?.call();
    final AlertRuleModel? rule = context.select(
      (AlertsCubit cubit) => cubit.state.byId[widget.id],
    );
    final bool busy = context.select(
      (AlertsCubit cubit) => cubit.state.busyId == widget.id,
    );

    if (rule == null) return const SizedBox.shrink();

    final AppPalette palette = context.palette;
    final bool above = rule.condition == AlertCondition.above;
    final Color markColor = above ? palette.success : palette.danger;
    final IconData markIcon = above ? AppIcons.up : AppIcons.down;
    final String title = rule.name != null && rule.name!.trim().isNotEmpty
        ? rule.name!
        : '${above ? 'Above' : 'Below'} '
              '${AppFormatters.rate(rule.threshold)}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: AppSizes.rowLeading,
              height: AppSizes.rowLeading,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: markColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(AppRadius.md),
              ),
              child: Icon(markIcon, size: AppSizes.iconSm, color: markColor),
            ),
            const SizedBox(width: AppSpacing.x3),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.titleMedium,
                  ),
                  const SizedBox(height: AppSpacing.x1),
                  Text(
                    '${rule.base}/${rule.quote} · '
                    '${AppFormatters.cooldown(rule.cooldownSeconds)} cooldown',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.text.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSpacing.x2),
            Switch(
              value: rule.enabled,
              onChanged: busy
                  ? null
                  : (bool value) => context.read<AlertsCubit>().toggle(rule.id),
            ),
            PopupMenuButton<_AlertMenuAction>(
              tooltip: 'Alert actions',
              icon: Icon(
                AppIcons.more,
                size: AppSizes.icon,
                color: palette.inkMuted,
              ),
              color: palette.raised,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.md),
                side: BorderSide(color: palette.line, width: AppSizes.hairline),
              ),
              onSelected: (_AlertMenuAction _) {
                setState(() => _confirming = true);
              },
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<_AlertMenuAction>>[
                    PopupMenuItem<_AlertMenuAction>(
                      value: _AlertMenuAction.remove,
                      child: Row(
                        children: <Widget>[
                          Icon(
                            AppIcons.delete,
                            size: AppSizes.iconSm,
                            color: palette.danger,
                          ),
                          const SizedBox(width: AppSpacing.x2),
                          Text(
                            'Delete',
                            style: context.text.bodyMedium?.copyWith(
                              color: palette.danger,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
            ),
          ],
        ),
        AnimatedSize(
          duration: AppMotion.of(context, AppMotion.base),
          curve: AppMotion.travel,
          alignment: Alignment.topCenter,
          child: _confirming
              ? _DeleteConfirmation(
                  busy: busy,
                  onCancel: () => setState(() => _confirming = false),
                  onDelete: () => context.read<AlertsCubit>().delete(rule.id),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class _DeleteConfirmation extends StatelessWidget {
  const _DeleteConfirmation({
    required this.busy,
    required this.onCancel,
    required this.onDelete,
  });

  final bool busy;
  final VoidCallback onCancel;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return Container(
      margin: const EdgeInsets.only(top: AppSpacing.x3),
      padding: const EdgeInsets.all(AppSpacing.x3),
      decoration: BoxDecoration(
        color: palette.danger.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Delete this alert?',
            style: context.text.bodySmall?.copyWith(color: palette.ink),
          ),
          const SizedBox(height: AppSpacing.x3),
          Row(
            children: <Widget>[
              Expanded(
                child: AppButton(
                  label: 'Keep',
                  variant: AppButtonVariant.secondary,
                  onPressed: busy ? null : onCancel,
                ),
              ),
              const SizedBox(width: AppSpacing.x2),
              Expanded(
                child: AppButton(
                  label: 'Delete',
                  variant: AppButtonVariant.danger,
                  loading: busy,
                  onPressed: busy ? null : onDelete,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
