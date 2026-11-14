import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/icons/app_icons.dart';
import '../../../../core/theme/app_motion.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/context_x.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_status_pill.dart';
import '../../data/models/rates_models.dart';
import '../../bloc/rates_cubit.dart';

class RateHero extends StatelessWidget {
  const RateHero({super.key});

  @override
  Widget build(BuildContext context) {
    final ({RateModel? rate, bool isStale}) selection = context.select(
      (RatesCubit cubit) =>
          (rate: cubit.state.rate, isStale: cubit.state.isStale),
    );
    final RateModel? rate = selection.rate;

    if (rate == null) return const SizedBox.shrink();

    final AppPalette palette = context.palette;
    final ({AppPillTone tone, IconData icon})? changeStyle = _changeStyle(rate);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('1 ${rate.base} equals', style: context.text.labelMedium),
            const Spacer(),
            if (selection.isStale)
              const AppStatusPill(label: 'Cached', icon: AppIcons.offline),
          ],
        ),
        const SizedBox(height: AppSpacing.x2),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Flexible(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                alignment: Alignment.centerLeft,
                child: Text(
                  AppFormatters.rate(rate.rate),
                  maxLines: 1,
                  style: context.text.displayLarge?.tabular,
                ),
              ),
            ),
            const SizedBox(width: AppSpacing.x2),
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.x1),
              child: Text(
                rate.quote,
                style: context.text.titleMedium?.copyWith(
                  color: palette.inkMuted,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.x3),
        AnimatedSwitcher(
          duration: AppMotion.of(context, AppMotion.fast),
          child: changeStyle == null
              ? Text(
                  'No previous reading yet',
                  key: const ValueKey<String>('no-change'),
                  style: context.text.bodySmall,
                )
              : Row(
                  key: const ValueKey<String>('change'),
                  children: <Widget>[
                    AppStatusPill(
                      label:
                          '${AppFormatters.signed(rate.change)} · '
                          '${AppFormatters.percent(rate.changePercent)}',
                      tone: changeStyle.tone,
                      icon: changeStyle.icon,
                    ),
                    if (rate.rateDate != null) ...<Widget>[
                      const SizedBox(width: AppSpacing.x2),
                      Text(
                        AppFormatters.day(rate.rateDate),
                        style: context.text.bodySmall,
                      ),
                    ],
                  ],
                ),
        ),
        const SizedBox(height: AppSpacing.x2),
        Text(
          'Updated ${AppFormatters.dateTime(rate.fetchedAt)}'
          '${rate.provider == null ? '' : ' · ${AppFormatters.capitalise(rate.provider)}'}',
          style: context.text.bodySmall,
        ),
      ],
    );
  }

  ({AppPillTone tone, IconData icon})? _changeStyle(RateModel rate) {
    switch (rate.direction) {
      case RateDirection.up:
        return (tone: AppPillTone.success, icon: AppIcons.up);
      case RateDirection.down:
        return (tone: AppPillTone.danger, icon: AppIcons.down);
      case RateDirection.flat:
        return (tone: AppPillTone.neutral, icon: AppIcons.flat);
      case null:
        return rate.change == null
            ? null
            : (
                tone: (rate.change ?? 0) >= 0
                    ? AppPillTone.success
                    : AppPillTone.danger,
                icon: (rate.change ?? 0) >= 0 ? AppIcons.up : AppIcons.down,
              );
    }
  }
}
