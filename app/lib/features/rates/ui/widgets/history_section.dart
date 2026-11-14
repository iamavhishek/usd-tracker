import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/context_x.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_empty_view.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../../core/widgets/app_section_header.dart';
import '../../data/models/rates_models.dart';
import '../../bloc/rates_cubit.dart';
import '../../bloc/rates_state.dart';
import 'rate_sparkline.dart';

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final ({List<HistoryPointModel> points, double low, double high}) data =
        context.select((RatesCubit cubit) {
          final List<HistoryPointModel> points = cubit.state.history;
          if (points.isEmpty) {
            return (points: points, low: 0.0, high: 0.0);
          }

          double low = points.first.rate;
          double high = points.first.rate;
          for (final HistoryPointModel point in points) {
            if (point.rate < low) low = point.rate;
            if (point.rate > high) high = point.rate;
          }
          return (points: points, low: low, high: high);
        });

    final AppPalette palette = context.palette;

    if (data.points.isEmpty) {
      return const AppEmptyView(
        dense: true,
        icon: AppIcons.history,
        title: 'No history yet',
        message: 'Import the last 7 days to see how this rate has moved.',
        action: _ImportButton(label: 'Import 7 days'),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        AppSectionHeader(
          title: 'History',
          trailing: Text(
            '${data.points.length} '
            '${data.points.length == 1 ? 'reading' : 'readings'}',
            style: context.text.bodySmall,
          ),
        ),
        RateSparkline(
          points: data.points,
          lineColor: palette.accent,
          fillColor: palette.accent.withValues(alpha: 0.08),
          gridColor: palette.line,
        ),
        const SizedBox(height: AppSpacing.x2),
        Row(
          children: <Widget>[
            Text(
              'Low ${AppFormatters.rate(data.low)}',
              style: context.text.bodySmall,
            ),
            const Spacer(),
            Text(
              'High ${AppFormatters.rate(data.high)}',
              style: context.text.bodySmall,
            ),
          ],
        ),
        if (data.points.length < 5) ...<Widget>[
          const SizedBox(height: AppSpacing.x4),
          const _ImportButton(label: 'Import 7 days'),
        ],
      ],
    );
  }
}

class _ImportButton extends StatelessWidget {
  const _ImportButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RatesCubit, RatesState, bool>(
      selector: (RatesState state) => state.isBackfilling,
      builder: (BuildContext context, bool busy) => AppButton(
        label: label,
        variant: AppButtonVariant.secondary,
        loading: busy,
        onPressed: busy ? null : () => context.read<RatesCubit>().backfill(),
      ),
    );
  }
}
