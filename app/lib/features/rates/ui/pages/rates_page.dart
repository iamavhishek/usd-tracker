import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/context_x.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../bloc/rates_cubit.dart';
import '../../bloc/rates_state.dart';
import '../../../../core/models/view_status.dart';
import '../widgets/details_section.dart';
import '../widgets/history_section.dart';
import '../widgets/rate_hero.dart';
import '../widgets/rates_skeleton.dart';

class RatesPage extends StatelessWidget {
  const RatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Rate',
      subtitle: 'Official reference · checked every minute',
      actions: <Widget>[_RefreshAction()],
      body: _RatesBody(),
    );
  }
}

class _RefreshAction extends StatelessWidget {
  const _RefreshAction();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RatesCubit, RatesState, bool>(
      selector: (RatesState state) =>
          state.status == ViewStatus.refreshing || state.isBackfilling,
      builder: (BuildContext context, bool busy) => AppIconButton(
        icon: AppIcons.refresh,
        tooltip: 'Check now',
        loading: busy,
        onPressed: busy ? null : () => context.read<RatesCubit>().refresh(),
      ),
    );
  }
}

class _RatesBody extends StatelessWidget {
  const _RatesBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<RatesCubit, RatesState>(
      listenWhen: (RatesState previous, RatesState next) =>
          next.failure != null &&
          next.failure != previous.failure &&
          next.hasRate,
      listener: (BuildContext context, RatesState state) {
        final Failure? failure = state.failure;
        if (failure != null) AppSnackBar.showFailure(context, failure);
      },
      child: BlocSelector<RatesCubit, RatesState, ViewStatus>(
        selector: (RatesState state) => state.status,
        builder: (BuildContext context, ViewStatus status) {
          return switch (status) {
            ViewStatus.initial || ViewStatus.loading => const RatesSkeleton(),
            ViewStatus.failure => const _RatesFailure(),
            ViewStatus.success ||
            ViewStatus.refreshing => const _RatesContent(),
          };
        },
      ),
    );
  }
}

class _RatesFailure extends StatelessWidget {
  const _RatesFailure();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<RatesCubit, RatesState, Failure?>(
      selector: (RatesState state) => state.failure,
      builder: (BuildContext context, Failure? failure) {
        if (failure == null) return const SizedBox.shrink();
        return AppErrorView.fromFailure(
          failure,
          onRetry: () => context.read<RatesCubit>().load(),
        );
      },
    );
  }
}

class _RatesContent extends StatelessWidget {
  const _RatesContent();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: context.palette.accent,
      backgroundColor: context.palette.surface,
      onRefresh: () => context.read<RatesCubit>().refresh(),
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.x4,
          AppSpacing.x2,
          AppSpacing.x4,
          AppSpacing.x8,
        ),
        physics: const AlwaysScrollableScrollPhysics(),
        children: const <Widget>[
          RateHero(),
          SizedBox(height: AppSpacing.x8),
          HistorySection(),
          SizedBox(height: AppSpacing.x8),
          DetailsSection(),
        ],
      ),
    );
  }
}
