import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_skeleton.dart';

class RatesSkeleton extends StatelessWidget {
  const RatesSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.x4,
        AppSpacing.x2,
        AppSpacing.x4,
        AppSpacing.x8,
      ),
      physics: const NeverScrollableScrollPhysics(),
      children: <Widget>[
        AppSkeleton(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const AppSkeletonLine(widthFactor: 0.32),
              const SizedBox(height: AppSpacing.x4),
              const AppSkeletonLine(
                widthFactor: 0.62,
                height: AppSizes.skeletonHero,
              ),
              const SizedBox(height: AppSpacing.x3),
              const FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: 0.42,
                child: AppSkeletonBox(height: 24),
              ),
              const SizedBox(height: AppSpacing.x2),
              const AppSkeletonLine(widthFactor: 0.55),
              const SizedBox(height: AppSpacing.x8),
              const AppSkeletonBox(height: AppSizes.chart),
              const SizedBox(height: AppSpacing.x2),
              const Row(
                children: <Widget>[
                  Expanded(child: AppSkeletonBox(height: AppSpacing.x3)),
                  SizedBox(width: AppSpacing.x8),
                  Expanded(child: AppSkeletonBox(height: AppSpacing.x3)),
                ],
              ),
              const SizedBox(height: AppSpacing.x8),
              Row(
                children: <Widget>[
                  for (int index = 0; index < 3; index++) ...<Widget>[
                    if (index > 0) const SizedBox(width: AppSpacing.x4),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          AppSkeletonLine(
                            widthFactor: 0.7,
                            height: AppSizes.skeletonLabel,
                          ),
                          SizedBox(height: AppSpacing.x2),
                          AppSkeletonLine(
                            widthFactor: 0.9,
                            height: AppSizes.skeletonValue,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
