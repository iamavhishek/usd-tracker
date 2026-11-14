import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/models/view_status.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/context_x.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_empty_view.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_skeleton.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../bloc/alerts_cubit.dart';
import '../../bloc/alerts_state.dart';
import '../widgets/alert_row.dart';
import 'alert_form_view.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  bool _creating = const bool.fromEnvironment('OPEN_ALERT_FORM');

  void _openForm() => setState(() => _creating = true);

  void _closeForm() {
    context.read<AlertsCubit>().resetSubmitStatus();
    setState(() => _creating = false);
  }

  @override
  Widget build(BuildContext context) {
    if (_creating) {
      return AlertFormView(onClose: _closeForm);
    }

    return AppScaffold(
      title: 'Alerts',
      subtitle: 'One push when the rate crosses your line',
      actions: <Widget>[_AddAction(onPressed: _openForm)],
      body: _AlertsBody(onCreate: _openForm),
    );
  }
}

class _AddAction extends StatelessWidget {
  const _AddAction({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      icon: AppIcons.add,
      tooltip: 'New alert',
      onPressed: onPressed,
    );
  }
}

class _AlertsBody extends StatelessWidget {
  const _AlertsBody({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AlertsCubit, AlertsState>(
      listenWhen: (AlertsState previous, AlertsState next) =>
          next.failure != null && next.failure != previous.failure,
      listener: (BuildContext context, AlertsState state) {
        final Failure? failure = state.failure;
        if (failure != null) AppSnackBar.showFailure(context, failure);
      },
      child: BlocSelector<AlertsCubit, AlertsState, ViewStatus>(
        selector: (AlertsState state) => state.status,
        builder: (BuildContext context, ViewStatus status) {
          return switch (status) {
            ViewStatus.initial || ViewStatus.loading => const _AlertsSkeleton(),
            ViewStatus.failure => const _AlertsFailure(),
            ViewStatus.success ||
            ViewStatus.refreshing => _AlertsContent(onCreate: onCreate),
          };
        },
      ),
    );
  }
}

class _AlertsFailure extends StatelessWidget {
  const _AlertsFailure();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AlertsCubit, AlertsState, Failure?>(
      selector: (AlertsState state) => state.failure,
      builder: (BuildContext context, Failure? failure) {
        if (failure == null) return const SizedBox.shrink();
        return AppErrorView.fromFailure(
          failure,
          onRetry: () => context.read<AlertsCubit>().load(),
        );
      },
    );
  }
}

class _AlertsContent extends StatelessWidget {
  const _AlertsContent({required this.onCreate});

  final VoidCallback onCreate;

  @override
  Widget build(BuildContext context) {
    final List<int> ids = context.select(
      (AlertsCubit cubit) => cubit.state.ids,
    );

    return RefreshIndicator(
      color: context.palette.accent,
      backgroundColor: context.palette.surface,
      onRefresh: () => context.read<AlertsCubit>().refresh(),
      child: ids.isEmpty
          ? ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.x4,
                AppSpacing.x8,
                AppSpacing.x4,
                AppSpacing.x8,
              ),
              children: <Widget>[
                AppEmptyView(
                  title: 'No alerts yet',
                  message:
                      'Get a push when USD/NPR crosses a rate you care about.',
                  icon: AppIcons.alerts,
                  action: AppButton(
                    label: 'Create an alert',
                    onPressed: onCreate,
                  ),
                ),
              ],
            )
          : ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(
                AppSpacing.x4,
                AppSpacing.x2,
                AppSpacing.x4,
                AppSpacing.x8,
              ),
              itemCount: ids.length + 1,
              itemBuilder: (BuildContext context, int index) {
                if (index == ids.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: AppSpacing.x6),
                    child: Text(
                      'Alerts fire once per crossing. A 6 h cooldown keeps a '
                      'flapping rate from spamming you.',
                      style: context.text.bodySmall,
                    ),
                  );
                }

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (index > 0)
                      Divider(
                        height: AppSpacing.x6,
                        color: context.palette.line,
                      ),
                    AlertRow(key: ValueKey<int>(ids[index]), id: ids[index]),
                  ],
                );
              },
            ),
    );
  }
}

class _AlertsSkeleton extends StatelessWidget {
  const _AlertsSkeleton();

  @override
  Widget build(BuildContext context) {
    return AppSkeleton(
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.x4,
          AppSpacing.x2,
          AppSpacing.x4,
          AppSpacing.x8,
        ),
        children: <Widget>[
          for (int index = 0; index < 4; index++)
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.x6),
              child: Row(
                children: <Widget>[
                  const AppSkeletonBox(
                    width: AppSizes.rowLeading,
                    height: AppSizes.rowLeading,
                    radius: AppRadius.md,
                  ),
                  const SizedBox(width: AppSpacing.x3),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        AppSkeletonLine(
                          widthFactor: index.isEven ? 0.55 : 0.42,
                          height: AppSizes.skeletonValue,
                        ),
                        const SizedBox(height: AppSpacing.x2),
                        AppSkeletonLine(
                          widthFactor: index.isEven ? 0.35 : 0.5,
                          height: AppSizes.skeletonLabel,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.x3),
                  const AppSkeletonBox(
                    width: AppSizes.iconLg,
                    height: AppSizes.iconSm,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
