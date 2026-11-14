import 'package:freezed_annotation/freezed_annotation.dart';

part 'push_status.freezed.dart';

enum PushState { unknown, unavailable, denied, notDetermined, ready }

/// Availability of push notifications in this build/device. Firebase is wired
/// in, but requires the project's native config files; until then the app
/// stays fully usable and Settings explains what is missing.
@freezed
abstract class PushStatus with _$PushStatus {
  const factory PushStatus({
    @Default(PushState.unknown) PushState state,
    String? reason,
  }) = _PushStatus;
}
