// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alerts_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AlertsState {

 ViewStatus get status; List<int> get ids; Map<int, AlertRuleModel> get byId; List<String> get quotes; Failure? get failure; AlertSubmitStatus get submitStatus; int? get busyId;
/// Create a copy of AlertsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertsStateCopyWith<AlertsState> get copyWith => _$AlertsStateCopyWithImpl<AlertsState>(this as AlertsState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as AlertsState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertsState&&(identical(other.status, _this.status) || other.status == _this.status)&&const DeepCollectionEquality().equals(other.ids, _this.ids)&&const DeepCollectionEquality().equals(other.byId, _this.byId)&&const DeepCollectionEquality().equals(other.quotes, _this.quotes)&&(identical(other.failure, _this.failure) || other.failure == _this.failure)&&(identical(other.submitStatus, _this.submitStatus) || other.submitStatus == _this.submitStatus)&&(identical(other.busyId, _this.busyId) || other.busyId == _this.busyId));
}


@override
int get hashCode {
  final _this = this as AlertsState;
  return Object.hash(runtimeType,_this.status,const DeepCollectionEquality().hash(_this.ids),const DeepCollectionEquality().hash(_this.byId),const DeepCollectionEquality().hash(_this.quotes),_this.failure,_this.submitStatus,_this.busyId);
}

@override
String toString() {
  final _this = this as AlertsState;
  return 'AlertsState(status: ${_this.status}, ids: ${_this.ids}, byId: ${_this.byId}, quotes: ${_this.quotes}, failure: ${_this.failure}, submitStatus: ${_this.submitStatus}, busyId: ${_this.busyId})';
}


}

/// @nodoc
abstract mixin class $AlertsStateCopyWith<$Res>  {
  factory $AlertsStateCopyWith(AlertsState value, $Res Function(AlertsState) _then) = _$AlertsStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, List<int> ids, Map<int, AlertRuleModel> byId, List<String> quotes, Failure? failure, AlertSubmitStatus submitStatus, int? busyId
});




}
/// @nodoc
class _$AlertsStateCopyWithImpl<$Res>
    implements $AlertsStateCopyWith<$Res> {
  _$AlertsStateCopyWithImpl(this._self, this._then);

  final AlertsState _self;
  final $Res Function(AlertsState) _then;

/// Create a copy of AlertsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? ids = null,Object? byId = null,Object? quotes = null,Object? failure = freezed,Object? submitStatus = null,Object? busyId = freezed,}) {
  return _then(AlertsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,ids: null == ids ? _self.ids : ids // ignore: cast_nullable_to_non_nullable
as List<int>,byId: null == byId ? _self.byId : byId // ignore: cast_nullable_to_non_nullable
as Map<int, AlertRuleModel>,quotes: null == quotes ? _self.quotes : quotes // ignore: cast_nullable_to_non_nullable
as List<String>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as AlertSubmitStatus,busyId: freezed == busyId ? _self.busyId : busyId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertsState].
extension AlertsStatePatterns on AlertsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertsState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertsState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertsState value)  $default,){
final _that = this;
switch (_that) {
case _AlertsState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertsState value)?  $default,){
final _that = this;
switch (_that) {
case _AlertsState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  List<int> ids,  Map<int, AlertRuleModel> byId,  List<String> quotes,  Failure? failure,  AlertSubmitStatus submitStatus,  int? busyId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertsState() when $default != null:
return $default(_that.status,_that.ids,_that.byId,_that.quotes,_that.failure,_that.submitStatus,_that.busyId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  List<int> ids,  Map<int, AlertRuleModel> byId,  List<String> quotes,  Failure? failure,  AlertSubmitStatus submitStatus,  int? busyId)  $default,) {final _that = this;
switch (_that) {
case _AlertsState():
return $default(_that.status,_that.ids,_that.byId,_that.quotes,_that.failure,_that.submitStatus,_that.busyId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  List<int> ids,  Map<int, AlertRuleModel> byId,  List<String> quotes,  Failure? failure,  AlertSubmitStatus submitStatus,  int? busyId)?  $default,) {final _that = this;
switch (_that) {
case _AlertsState() when $default != null:
return $default(_that.status,_that.ids,_that.byId,_that.quotes,_that.failure,_that.submitStatus,_that.busyId);case _:
  return null;

}
}

}

/// @nodoc


class _AlertsState extends AlertsState {
  const _AlertsState({this.status = ViewStatus.initial,  List<int> ids = const <int>[],  Map<int, AlertRuleModel> byId = const <int, AlertRuleModel>{},  List<String> quotes = const <String>[], this.failure, this.submitStatus = AlertSubmitStatus.idle, this.busyId}): _ids = ids,_byId = byId,_quotes = quotes,super._();
  

@override@JsonKey() final  ViewStatus status;
 final  List<int> _ids;
@override@JsonKey() List<int> get ids {
  if (_ids is EqualUnmodifiableListView) return _ids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ids);
}

 final  Map<int, AlertRuleModel> _byId;
@override@JsonKey() Map<int, AlertRuleModel> get byId {
  if (_byId is EqualUnmodifiableMapView) return _byId;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_byId);
}

 final  List<String> _quotes;
@override@JsonKey() List<String> get quotes {
  if (_quotes is EqualUnmodifiableListView) return _quotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quotes);
}

@override final  Failure? failure;
@override@JsonKey() final  AlertSubmitStatus submitStatus;
@override final  int? busyId;

/// Create a copy of AlertsState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertsStateCopyWith<_AlertsState> get copyWith => __$AlertsStateCopyWithImpl<_AlertsState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertsState&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.ids, _ids)&&const DeepCollectionEquality().equals(other.byId, _byId)&&const DeepCollectionEquality().equals(other.quotes, _quotes)&&(identical(other.failure, failure) || other.failure == failure)&&(identical(other.submitStatus, submitStatus) || other.submitStatus == submitStatus)&&(identical(other.busyId, busyId) || other.busyId == busyId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_ids),const DeepCollectionEquality().hash(_byId),const DeepCollectionEquality().hash(_quotes),failure,submitStatus,busyId);
}

@override
String toString() {
    return 'AlertsState(status: $status, ids: $ids, byId: $byId, quotes: $quotes, failure: $failure, submitStatus: $submitStatus, busyId: $busyId)';
}


}

/// @nodoc
abstract mixin class _$AlertsStateCopyWith<$Res> implements $AlertsStateCopyWith<$Res> {
  factory _$AlertsStateCopyWith(_AlertsState value, $Res Function(_AlertsState) _then) = __$AlertsStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, List<int> ids, Map<int, AlertRuleModel> byId, List<String> quotes, Failure? failure, AlertSubmitStatus submitStatus, int? busyId
});




}
/// @nodoc
class __$AlertsStateCopyWithImpl<$Res>
    implements _$AlertsStateCopyWith<$Res> {
  __$AlertsStateCopyWithImpl(this._self, this._then);

  final _AlertsState _self;
  final $Res Function(_AlertsState) _then;

/// Create a copy of AlertsState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? ids = null,Object? byId = null,Object? quotes = null,Object? failure = freezed,Object? submitStatus = null,Object? busyId = freezed,}) {
  return _then(_AlertsState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,ids: null == ids ? _self._ids : ids // ignore: cast_nullable_to_non_nullable
as List<int>,byId: null == byId ? _self._byId : byId // ignore: cast_nullable_to_non_nullable
as Map<int, AlertRuleModel>,quotes: null == quotes ? _self._quotes : quotes // ignore: cast_nullable_to_non_nullable
as List<String>,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,submitStatus: null == submitStatus ? _self.submitStatus : submitStatus // ignore: cast_nullable_to_non_nullable
as AlertSubmitStatus,busyId: freezed == busyId ? _self.busyId : busyId // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
