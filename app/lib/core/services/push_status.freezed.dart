// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'push_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PushStatus {

 PushState get state; String? get reason;
/// Create a copy of PushStatus
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PushStatusCopyWith<PushStatus> get copyWith => _$PushStatusCopyWithImpl<PushStatus>(this as PushStatus, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as PushStatus;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PushStatus&&(identical(other.state, _this.state) || other.state == _this.state)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}


@override
int get hashCode {
  final _this = this as PushStatus;
  return Object.hash(runtimeType,_this.state,_this.reason);
}

@override
String toString() {
  final _this = this as PushStatus;
  return 'PushStatus(state: ${_this.state}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $PushStatusCopyWith<$Res>  {
  factory $PushStatusCopyWith(PushStatus value, $Res Function(PushStatus) _then) = _$PushStatusCopyWithImpl;
@useResult
$Res call({
 PushState state, String? reason
});




}
/// @nodoc
class _$PushStatusCopyWithImpl<$Res>
    implements $PushStatusCopyWith<$Res> {
  _$PushStatusCopyWithImpl(this._self, this._then);

  final PushStatus _self;
  final $Res Function(PushStatus) _then;

/// Create a copy of PushStatus
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? reason = freezed,}) {
  return _then(PushStatus(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as PushState,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PushStatus].
extension PushStatusPatterns on PushStatus {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PushStatus value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PushStatus() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PushStatus value)  $default,){
final _that = this;
switch (_that) {
case _PushStatus():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PushStatus value)?  $default,){
final _that = this;
switch (_that) {
case _PushStatus() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PushState state,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PushStatus() when $default != null:
return $default(_that.state,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PushState state,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _PushStatus():
return $default(_that.state,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PushState state,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _PushStatus() when $default != null:
return $default(_that.state,_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class _PushStatus implements PushStatus {
  const _PushStatus({this.state = PushState.unknown, this.reason});
  

@override@JsonKey() final  PushState state;
@override final  String? reason;

/// Create a copy of PushStatus
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PushStatusCopyWith<_PushStatus> get copyWith => __$PushStatusCopyWithImpl<_PushStatus>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PushStatus&&(identical(other.state, state) || other.state == state)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode {
    return Object.hash(runtimeType,state,reason);
}

@override
String toString() {
    return 'PushStatus(state: $state, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$PushStatusCopyWith<$Res> implements $PushStatusCopyWith<$Res> {
  factory _$PushStatusCopyWith(_PushStatus value, $Res Function(_PushStatus) _then) = __$PushStatusCopyWithImpl;
@override @useResult
$Res call({
 PushState state, String? reason
});




}
/// @nodoc
class __$PushStatusCopyWithImpl<$Res>
    implements _$PushStatusCopyWith<$Res> {
  __$PushStatusCopyWithImpl(this._self, this._then);

  final _PushStatus _self;
  final $Res Function(_PushStatus) _then;

/// Create a copy of PushStatus
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? reason = freezed,}) {
  return _then(_PushStatus(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as PushState,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
