// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SettingsState {

 ViewStatus get status; HealthModel? get health; PushStatus get push; DeviceModel? get device; bool get isBusy; Failure? get failure; TestPushResultModel? get testResult; String get baseUrl; bool get hasApiKey; String get quote;
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SettingsStateCopyWith<SettingsState> get copyWith => _$SettingsStateCopyWithImpl<SettingsState>(this as SettingsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SettingsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SettingsState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.health, _this.health) || other.health == _this.health)&&(identical(other.push, _this.push) || other.push == _this.push)&&(identical(other.device, _this.device) || other.device == _this.device)&&(identical(other.isBusy, _this.isBusy) || other.isBusy == _this.isBusy)&&(identical(other.failure, _this.failure) || other.failure == _this.failure)&&(identical(other.testResult, _this.testResult) || other.testResult == _this.testResult)&&(identical(other.baseUrl, _this.baseUrl) || other.baseUrl == _this.baseUrl)&&(identical(other.hasApiKey, _this.hasApiKey) || other.hasApiKey == _this.hasApiKey)&&(identical(other.quote, _this.quote) || other.quote == _this.quote));
}


@override
int get hashCode {
  final _this = this as SettingsState;
  return Object.hash(runtimeType,_this.status,_this.health,_this.push,_this.device,_this.isBusy,_this.failure,_this.testResult,_this.baseUrl,_this.hasApiKey,_this.quote);
}

@override
String toString() {
  final _this = this as SettingsState;
  return 'SettingsState(status: ${_this.status}, health: ${_this.health}, push: ${_this.push}, device: ${_this.device}, isBusy: ${_this.isBusy}, failure: ${_this.failure}, testResult: ${_this.testResult}, baseUrl: ${_this.baseUrl}, hasApiKey: ${_this.hasApiKey}, quote: ${_this.quote})';
}


}

/// @nodoc
abstract mixin class $SettingsStateCopyWith<$Res>  {
  factory $SettingsStateCopyWith(SettingsState value, $Res Function(SettingsState) _then) = _$SettingsStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, HealthModel? health, PushStatus push, DeviceModel? device, bool isBusy, Failure? failure, TestPushResultModel? testResult, String baseUrl, bool hasApiKey, String quote
});


$HealthModelCopyWith<$Res>? get health;$PushStatusCopyWith<$Res> get push;$DeviceModelCopyWith<$Res>? get device;$TestPushResultModelCopyWith<$Res>? get testResult;

}
/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._self, this._then);

  final SettingsState _self;
  final $Res Function(SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? health = freezed,Object? push = null,Object? device = freezed,Object? isBusy = null,Object? failure = freezed,Object? testResult = freezed,Object? baseUrl = null,Object? hasApiKey = null,Object? quote = null,}) {
  return _then(SettingsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,health: freezed == health ? _self.health : health // ignore: cast_nullable_to_non_nullable
as HealthModel?,push: null == push ? _self.push : push // ignore: cast_nullable_to_non_nullable
as PushStatus,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceModel?,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,testResult: freezed == testResult ? _self.testResult : testResult // ignore: cast_nullable_to_non_nullable
as TestPushResultModel?,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,hasApiKey: null == hasApiKey ? _self.hasApiKey : hasApiKey // ignore: cast_nullable_to_non_nullable
as bool,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthModelCopyWith<$Res>? get health {
    if (_self.health == null) {
    return null;
  }

  return $HealthModelCopyWith<$Res>(_self.health!, (value) {
    return _then(_self.copyWith(health: value));
  });
}/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PushStatusCopyWith<$Res> get push {
  
  return $PushStatusCopyWith<$Res>(_self.push, (value) {
    return _then(_self.copyWith(push: value));
  });
}/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<$Res>? get device {
    if (_self.device == null) {
    return null;
  }

  return $DeviceModelCopyWith<$Res>(_self.device!, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestPushResultModelCopyWith<$Res>? get testResult {
    if (_self.testResult == null) {
    return null;
  }

  return $TestPushResultModelCopyWith<$Res>(_self.testResult!, (value) {
    return _then(_self.copyWith(testResult: value));
  });
}
}


/// Adds pattern-matching-related methods to [SettingsState].
extension SettingsStatePatterns on SettingsState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SettingsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SettingsState value)  $default,){
final _that = this;
switch (_that) {
case _SettingsState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SettingsState value)?  $default,){
final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  HealthModel? health,  PushStatus push,  DeviceModel? device,  bool isBusy,  Failure? failure,  TestPushResultModel? testResult,  String baseUrl,  bool hasApiKey,  String quote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.status,_that.health,_that.push,_that.device,_that.isBusy,_that.failure,_that.testResult,_that.baseUrl,_that.hasApiKey,_that.quote);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  HealthModel? health,  PushStatus push,  DeviceModel? device,  bool isBusy,  Failure? failure,  TestPushResultModel? testResult,  String baseUrl,  bool hasApiKey,  String quote)  $default,) {final _that = this;
switch (_that) {
case _SettingsState():
return $default(_that.status,_that.health,_that.push,_that.device,_that.isBusy,_that.failure,_that.testResult,_that.baseUrl,_that.hasApiKey,_that.quote);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  HealthModel? health,  PushStatus push,  DeviceModel? device,  bool isBusy,  Failure? failure,  TestPushResultModel? testResult,  String baseUrl,  bool hasApiKey,  String quote)?  $default,) {final _that = this;
switch (_that) {
case _SettingsState() when $default != null:
return $default(_that.status,_that.health,_that.push,_that.device,_that.isBusy,_that.failure,_that.testResult,_that.baseUrl,_that.hasApiKey,_that.quote);case _:
  return null;

}
}

}

/// @nodoc


class _SettingsState extends SettingsState {
  const _SettingsState({this.status = ViewStatus.initial, this.health, this.push = const PushStatus(), this.device, this.isBusy = false, this.failure, this.testResult, this.baseUrl = '', this.hasApiKey = false, this.quote = 'NPR'}): super._();
  

@override@JsonKey() final  ViewStatus status;
@override final  HealthModel? health;
@override@JsonKey() final  PushStatus push;
@override final  DeviceModel? device;
@override@JsonKey() final  bool isBusy;
@override final  Failure? failure;
@override final  TestPushResultModel? testResult;
@override@JsonKey() final  String baseUrl;
@override@JsonKey() final  bool hasApiKey;
@override@JsonKey() final  String quote;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SettingsStateCopyWith<_SettingsState> get copyWith => __$SettingsStateCopyWithImpl<_SettingsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SettingsState&&(identical(other.status, status) || other.status == status)&&(identical(other.health, health) || other.health == health)&&(identical(other.push, push) || other.push == push)&&(identical(other.device, device) || other.device == device)&&(identical(other.isBusy, isBusy) || other.isBusy == isBusy)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.testResult, testResult) || other.testResult == testResult)&&(identical(other.baseUrl, baseUrl) || other.baseUrl == baseUrl)&&(identical(other.hasApiKey, hasApiKey) || other.hasApiKey == hasApiKey)&&(identical(other.quote, quote) || other.quote == quote));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,health,push,device,isBusy,failure,testResult,baseUrl,hasApiKey,quote);
}

@override
String toString() {
    return 'SettingsState(status: $status, health: $health, push: $push, device: $device, isBusy: $isBusy, failure: $failure, testResult: $testResult, baseUrl: $baseUrl, hasApiKey: $hasApiKey, quote: $quote)';
}


}

/// @nodoc
abstract mixin class _$SettingsStateCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$SettingsStateCopyWith(_SettingsState value, $Res Function(_SettingsState) _then) = __$SettingsStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, HealthModel? health, PushStatus push, DeviceModel? device, bool isBusy, Failure? failure, TestPushResultModel? testResult, String baseUrl, bool hasApiKey, String quote
});


@override $HealthModelCopyWith<$Res>? get health;@override $PushStatusCopyWith<$Res> get push;@override $DeviceModelCopyWith<$Res>? get device;@override $TestPushResultModelCopyWith<$Res>? get testResult;

}
/// @nodoc
class __$SettingsStateCopyWithImpl<$Res>
    implements _$SettingsStateCopyWith<$Res> {
  __$SettingsStateCopyWithImpl(this._self, this._then);

  final _SettingsState _self;
  final $Res Function(_SettingsState) _then;

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? health = freezed,Object? push = null,Object? device = freezed,Object? isBusy = null,Object? failure = freezed,Object? testResult = freezed,Object? baseUrl = null,Object? hasApiKey = null,Object? quote = null,}) {
  return _then(_SettingsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,health: freezed == health ? _self.health : health // ignore: cast_nullable_to_non_nullable
as HealthModel?,push: null == push ? _self.push : push // ignore: cast_nullable_to_non_nullable
as PushStatus,device: freezed == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as DeviceModel?,isBusy: null == isBusy ? _self.isBusy : isBusy // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,testResult: freezed == testResult ? _self.testResult : testResult // ignore: cast_nullable_to_non_nullable
as TestPushResultModel?,baseUrl: null == baseUrl ? _self.baseUrl : baseUrl // ignore: cast_nullable_to_non_nullable
as String,hasApiKey: null == hasApiKey ? _self.hasApiKey : hasApiKey // ignore: cast_nullable_to_non_nullable
as bool,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthModelCopyWith<$Res>? get health {
    if (_self.health == null) {
    return null;
  }

  return $HealthModelCopyWith<$Res>(_self.health!, (value) {
    return _then(_self.copyWith(health: value));
  });
}/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PushStatusCopyWith<$Res> get push {
  
  return $PushStatusCopyWith<$Res>(_self.push, (value) {
    return _then(_self.copyWith(push: value));
  });
}/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<$Res>? get device {
    if (_self.device == null) {
    return null;
  }

  return $DeviceModelCopyWith<$Res>(_self.device!, (value) {
    return _then(_self.copyWith(device: value));
  });
}/// Create a copy of SettingsState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TestPushResultModelCopyWith<$Res>? get testResult {
    if (_self.testResult == null) {
    return null;
  }

  return $TestPushResultModelCopyWith<$Res>(_self.testResult!, (value) {
    return _then(_self.copyWith(testResult: value));
  });
}
}

// dart format on
