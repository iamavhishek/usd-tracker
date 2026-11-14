import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/icons/app_icons.dart';
import '../../../../core/models/view_status.dart';
import '../../../../core/services/push_status.dart';
import '../../../../core/theme/app_motion.dart';
import '../../../../core/theme/app_palette.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_sizes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/context_x.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_error_view.dart';
import '../../../../core/widgets/app_icon_button.dart';
import '../../../../core/widgets/app_scaffold.dart';
import '../../../../core/widgets/app_section_header.dart';
import '../../../../core/widgets/app_skeleton.dart';
import '../../../../core/widgets/app_snackbar.dart';
import '../../../../core/widgets/app_status_pill.dart';
import '../../bloc/settings_cubit.dart';
import '../../bloc/settings_state.dart';
import '../../data/models/settings_models.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'Settings',
      subtitle: 'Connection and notifications',
      actions: <Widget>[_RefreshAction()],
      body: _SettingsBody(),
    );
  }
}

class _RefreshAction extends StatelessWidget {
  const _RefreshAction();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsCubit, SettingsState, bool>(
      selector: (SettingsState state) => state.status == ViewStatus.refreshing,
      builder: (BuildContext context, bool busy) => AppIconButton(
        icon: AppIcons.refresh,
        tooltip: 'Refresh status',
        loading: busy,
        onPressed: busy ? null : () => context.read<SettingsCubit>().load(),
      ),
    );
  }
}

class _SettingsBody extends StatelessWidget {
  const _SettingsBody();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SettingsCubit, SettingsState>(
      listenWhen: (SettingsState previous, SettingsState next) =>
          next.failure != null &&
          next.failure != previous.failure &&
          next.health != null,
      listener: (BuildContext context, SettingsState state) {
        final Failure? failure = state.failure;
        if (failure != null) AppSnackBar.showFailure(context, failure);
      },
      child: BlocSelector<SettingsCubit, SettingsState, ViewStatus>(
        selector: (SettingsState state) => state.status,
        builder: (BuildContext context, ViewStatus status) {
          return switch (status) {
            ViewStatus.initial ||
            ViewStatus.loading => const _SettingsSkeleton(),
            ViewStatus.failure => const _SettingsFailure(),
            ViewStatus.success ||
            ViewStatus.refreshing => const _SettingsContent(),
          };
        },
      ),
    );
  }
}

class _SettingsFailure extends StatelessWidget {
  const _SettingsFailure();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsCubit, SettingsState, Failure?>(
      selector: (SettingsState state) => state.failure,
      builder: (BuildContext context, Failure? failure) {
        if (failure == null) return const SizedBox.shrink();
        return AppErrorView.fromFailure(
          failure,
          onRetry: () => context.read<SettingsCubit>().load(),
        );
      },
    );
  }
}

class _SettingsContent extends StatelessWidget {
  const _SettingsContent();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: context.palette.accent,
      backgroundColor: context.palette.surface,
      onRefresh: () => context.read<SettingsCubit>().load(),
      child: ListView(
        physics: const AlwaysScrollableScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.x4,
          AppSpacing.x2,
          AppSpacing.x4,
          AppSpacing.x8,
        ),
        children: const <Widget>[
          _ConnectionSection(),
          SizedBox(height: AppSpacing.x8),
          _NotificationsSection(),
          SizedBox(height: AppSpacing.x8),
          _AboutSection(),
        ],
      ),
    );
  }
}

class _ConnectionSection extends StatelessWidget {
  const _ConnectionSection();

  @override
  Widget build(BuildContext context) {
    final ({HealthModel? health, String baseUrl, bool hasApiKey}) data = context
        .select((SettingsCubit cubit) {
          return (
            health: cubit.state.health,
            baseUrl: cubit.state.baseUrl,
            hasApiKey: cubit.state.hasApiKey,
          );
        });
    final HealthModel? health = data.health;
    if (health == null) return const SizedBox.shrink();

    final AppPalette palette = context.palette;
    final bool databaseOk = health.database.ok;
    final String statusLabel = !databaseOk
        ? 'Unreachable'
        : health.status == 'ok'
        ? 'Connected'
        : 'Degraded';
    final AppPillTone tone = !databaseOk
        ? AppPillTone.danger
        : health.status == 'ok'
        ? AppPillTone.success
        : AppPillTone.accent;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const AppSectionHeader(title: 'Connection'),
        Row(
          children: <Widget>[
            AppStatusPill(
              label: statusLabel,
              tone: tone,
              icon: databaseOk ? AppIcons.check : AppIcons.offline,
            ),
            const Spacer(),
            Text(
              'Checked ${AppFormatters.relative(health.rate.lastPoll?.finishedAt)}',
              style: context.text.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.x4),
        _InfoRow(label: 'Backend', value: data.baseUrl, multiline: true),
        const SizedBox(height: AppSpacing.x3),
        _InfoRow(
          label: 'API key',
          value: data.hasApiKey ? 'Set for this build' : 'Missing',
          tone: data.hasApiKey ? palette.ink : palette.danger,
        ),
        const SizedBox(height: AppSpacing.x3),
        _InfoRow(
          label: 'Server push',
          value: health.fcm.configured ? 'Configured' : 'Not configured',
        ),
        const SizedBox(height: AppSpacing.x3),
        _InfoRow(label: 'Devices', value: '${health.devices.active} active'),
      ],
    );
  }
}

class _NotificationsSection extends StatefulWidget {
  const _NotificationsSection();

  @override
  State<_NotificationsSection> createState() => _NotificationsSectionState();
}

class _NotificationsSectionState extends State<_NotificationsSection> {
  bool _confirmingStop = false;

  @override
  Widget build(BuildContext context) {
    final ({
      PushStatus push,
      DeviceModel? device,
      bool isBusy,
      TestPushResultModel? testResult,
      String quote,
    })
    data = context.select((SettingsCubit cubit) {
      return (
        push: cubit.state.push,
        device: cubit.state.device,
        isBusy: cubit.state.isBusy,
        testResult: cubit.state.testResult,
        quote: cubit.state.quote,
      );
    });

    final AppPalette palette = context.palette;
    final PushStatus push = data.push;
    final DeviceModel? device = data.device;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const AppSectionHeader(title: 'Notifications'),
        _PushStatusLine(push: push),
        if (push.state == PushState.unavailable) ...<Widget>[
          const SizedBox(height: AppSpacing.x3),
          _SetupNote(reason: push.reason),
        ] else ...<Widget>[
          const SizedBox(height: AppSpacing.x2),
          Text(_statusDescription(push), style: context.text.bodySmall),
        ],
        if (device != null) ...<Widget>[
          const SizedBox(height: AppSpacing.x3),
          Container(
            padding: const EdgeInsets.all(AppSpacing.x3),
            decoration: BoxDecoration(
              color: palette.surface,
              borderRadius: BorderRadius.circular(AppRadius.md),
              border: Border.fromBorderSide(
                BorderSide(color: palette.line, width: AppSizes.hairline),
              ),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  AppIcons.device,
                  size: AppSizes.icon,
                  color: palette.inkMuted,
                ),
                const SizedBox(width: AppSpacing.x3),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'This device is registered',
                        style: context.text.bodyMedium?.copyWith(
                          color: palette.ink,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.x1),
                      Text(
                        '${device.platform} · USD/${device.quote} · '
                        '${device.tokenPreview}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.text.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: AppSpacing.x4),
        if (push.state == PushState.unavailable) ...<Widget>[
          // Setup guidance is already shown above the device card.
        ] else if (device == null) ...<Widget>[
          AppButton(
            label: push.state == PushState.ready
                ? 'Register this device'
                : 'Enable notifications',
            expand: true,
            loading: data.isBusy,
            onPressed: data.isBusy
                ? null
                : () => context.read<SettingsCubit>().enablePush(),
          ),
        ] else ...<Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: AppButton(
                  label: 'Send test',
                  variant: AppButtonVariant.secondary,
                  loading: data.isBusy,
                  onPressed: data.isBusy
                      ? null
                      : () => context.read<SettingsCubit>().sendTest(),
                ),
              ),
              const SizedBox(width: AppSpacing.x2),
              Expanded(
                child: AppButton(
                  label: 'Stop',
                  variant: AppButtonVariant.quiet,
                  onPressed: data.isBusy
                      ? null
                      : () => setState(() => _confirmingStop = true),
                ),
              ),
            ],
          ),
          AnimatedSize(
            duration: AppMotion.of(context, AppMotion.base),
            curve: AppMotion.travel,
            alignment: Alignment.topCenter,
            child: _confirmingStop
                ? _StopConfirmation(
                    busy: data.isBusy,
                    onCancel: () => setState(() => _confirmingStop = false),
                    onConfirm: () {
                      setState(() => _confirmingStop = false);
                      context.read<SettingsCubit>().disablePush();
                    },
                  )
                : const SizedBox.shrink(),
          ),
        ],
        if (data.testResult != null) ...<Widget>[
          const SizedBox(height: AppSpacing.x3),
          Text(
            _testResultCopy(data.testResult!),
            style: context.text.bodySmall?.copyWith(
              color: data.testResult!.skipped
                  ? palette.danger
                  : palette.success,
            ),
          ),
        ],
      ],
    );
  }

  String _statusDescription(PushStatus push) {
    return switch (push.state) {
      PushState.ready => 'Alert pushes can reach this device. Registration stores only the FCM token and your currency.',
      PushState.notDetermined => 'Notifications are off. Enable them to get a push when your threshold is crossed.',
      PushState.denied => 'Notifications are blocked in system settings. Allow them, then try again.',
      PushState.unavailable => push.reason ?? 'Push is not available in this build. The rest of the app still works.',
      PushState.unknown => 'Checking notification availability…',
    };
  }

  String _testResultCopy(TestPushResultModel result) {
    if (result.skipped) {
      return switch (result.skippedReason) {
        'no-devices' => 'No devices are registered on the server yet.',
        'firebase-not-configured' =>
          'The server has no Firebase credentials yet, so nothing was sent.',
        final String? reason => 'Push skipped: ${reason ?? 'unknown reason'}.',
      };
    }
    return 'Sent to ${result.successCount}/${result.deviceCount} device(s).';
  }
}

class _PushStatusLine extends StatelessWidget {
  const _PushStatusLine({required this.push});

  final PushStatus push;

  @override
  Widget build(BuildContext context) {
    final ({String label, AppPillTone tone}) status = switch (push.state) {
      PushState.ready => (label: 'On', tone: AppPillTone.success),
      PushState.notDetermined => (label: 'Off', tone: AppPillTone.neutral),
      PushState.denied => (label: 'Blocked', tone: AppPillTone.danger),
      PushState.unavailable => (
        label: 'Unavailable',
        tone: AppPillTone.neutral,
      ),
      PushState.unknown => (label: 'Checking', tone: AppPillTone.neutral),
    };

    return AppStatusPill(
      label: status.label,
      tone: status.tone,
      icon: push.state == PushState.ready
          ? AppIcons.alertsActive
          : AppIcons.alerts,
    );
  }
}

class _StopConfirmation extends StatelessWidget {
  const _StopConfirmation({
    required this.busy,
    required this.onCancel,
    required this.onConfirm,
  });

  final bool busy;
  final VoidCallback onCancel;
  final VoidCallback onConfirm;

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
            'Stop notifications on this device?',
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
                  label: 'Stop',
                  variant: AppButtonVariant.danger,
                  loading: busy,
                  onPressed: busy ? null : onConfirm,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SetupNote extends StatelessWidget {
  const _SetupNote({required this.reason});

  final String? reason;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.x3),
      decoration: BoxDecoration(
        color: palette.accent.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(AppRadius.md),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(AppIcons.info, size: AppSizes.iconSm, color: palette.accent),
          const SizedBox(width: AppSpacing.x2),
          Expanded(
            child: Text(
              reason ?? 'Add the Firebase project files, then rebuild to enable push.',
              style: context.text.bodySmall?.copyWith(color: palette.ink),
            ),
          ),
        ],
      ),
    );
  }
}

class _AboutSection extends StatelessWidget {
  const _AboutSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const AppSectionHeader(title: 'About'),
        const _InfoRow(label: 'App', value: 'USD Tracker 1.0.0'),
        const SizedBox(height: AppSpacing.x3),
        const _InfoRow(label: 'Rate source', value: 'Frankfurter'),
        const SizedBox(height: AppSpacing.x3),
        const _InfoRow(label: 'Checks', value: 'Every minute'),
        const SizedBox(height: AppSpacing.x3),
        Text(
          'Rates are official daily reference values. The backend checks them '
          'every minute and sends a push only when your alert crosses.',
          style: context.text.bodySmall,
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.value,
    this.multiline = false,
    this.tone,
  });

  final String label;
  final String value;
  final bool multiline;
  final Color? tone;

  @override
  Widget build(BuildContext context) {
    final AppPalette palette = context.palette;

    if (multiline) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(label, style: context.text.bodySmall),
          const SizedBox(height: AppSpacing.x1),
          Text(
            value,
            style: context.text.bodyMedium?.copyWith(
              color: tone ?? palette.ink,
            ),
          ),
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: AppSizes.labelColumn,
          child: Text(label, style: context.text.bodySmall),
        ),
        const SizedBox(width: AppSpacing.x3),
        Expanded(
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: context.text.bodyMedium?.copyWith(
              color: tone ?? palette.ink,
            ),
          ),
        ),
      ],
    );
  }
}

class _SettingsSkeleton extends StatelessWidget {
  const _SettingsSkeleton();

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
          const AppSkeletonLine(
            widthFactor: 0.3,
            height: AppSizes.skeletonValue,
          ),
          const SizedBox(height: AppSpacing.x4),
          for (int index = 0; index < 4; index++) ...<Widget>[
            const AppSkeletonLine(widthFactor: 0.55),
            const SizedBox(height: AppSpacing.x3),
          ],
          const SizedBox(height: AppSpacing.x8),
          const AppSkeletonLine(
            widthFactor: 0.35,
            height: AppSizes.skeletonValue,
          ),
          const SizedBox(height: AppSpacing.x4),
          const AppSkeletonBox(height: AppSizes.control),
          const SizedBox(height: AppSpacing.x3),
          const AppSkeletonLine(widthFactor: 0.7),
        ],
      ),
    );
  }
}
