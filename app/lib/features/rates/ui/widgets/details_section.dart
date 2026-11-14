import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_typography.dart';
import '../../../../core/theme/context_x.dart';
import '../../../../core/utils/formatters.dart';
import '../../bloc/rates_cubit.dart';

class DetailsSection extends StatelessWidget {
  const DetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final ({double? previousRate, double? changePercent, String? provider})
    data = context.select((RatesCubit cubit) {
      return (
        previousRate: cubit.state.rate?.previousRate,
        changePercent: cubit.state.rate?.changePercent,
        provider: cubit.state.rate?.provider,
      );
    });

    final AppPalette palette = context.palette;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(height: AppSizes.hairline, color: palette.line),
        const SizedBox(height: AppSpacing.x6),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: _Stat(
                label: 'Previous',
                value: AppFormatters.rate(data.previousRate),
              ),
            ),
            const SizedBox(width: AppSpacing.x4),
            Expanded(
              child: _Stat(
                label: 'Change',
                value: AppFormatters.percent(data.changePercent),
              ),
            ),
            const SizedBox(width: AppSpacing.x4),
            Expanded(
              child: _Stat(
                label: 'Source',
                value: AppFormatters.capitalise(data.provider),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.x3),
        Text(
          'Official reference rates from Frankfurter. Values are checked every '
          'minute and published once per business day.',
          style: context.text.bodySmall,
        ),
      ],
    );
  }
}

class _Stat extends StatelessWidget {
  const _Stat({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(label, style: context.text.bodySmall),
        const SizedBox(height: AppSpacing.x1),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: context.text.titleMedium?.tabular,
        ),
      ],
    );
  }
}
