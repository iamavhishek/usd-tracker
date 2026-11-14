// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rates_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RatesState {

 ViewStatus get status; RateModel? get rate; List<HistoryPointModel> get history; bool get isStale; bool get isBackfilling; Failure? get failure;
/// Create a copy of RatesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatesStateCopyWith<RatesState> get copyWith => _$RatesStateCopyWithImpl<RatesState>(this as RatesState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RatesState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatesState&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&const DeepCollectionEquality().equals(other.history, _this.history)&&(identical(other.isStale, _this.isStale) || other.isStale == _this.isStale)&&(identical(other.isBackfilling, _this.isBackfilling) || other.isBackfilling == _this.isBackfilling)&&(identical(other.failure, _this.failure) || other.failure == _this.failure));
}


@override
int get hashCode {
  final _this = this as RatesState;
  return Object.hash(runtimeType,_this.status,_this.rate,const DeepCollectionEquality().hash(_this.history),_this.isStale,_this.isBackfilling,_this.failure);
}

@override
String toString() {
  final _this = this as RatesState;
  return 'RatesState(status: ${_this.status}, rate: ${_this.rate}, history: ${_this.history}, isStale: ${_this.isStale}, isBackfilling: ${_this.isBackfilling}, failure: ${_this.failure})';
}


}

/// @nodoc
abstract mixin class $RatesStateCopyWith<$Res>  {
  factory $RatesStateCopyWith(RatesState value, $Res Function(RatesState) _then) = _$RatesStateCopyWithImpl;
@useResult
$Res call({
 ViewStatus status, RateModel? rate, List<HistoryPointModel> history, bool isStale, bool isBackfilling, Failure? failure
});


$RateModelCopyWith<$Res>? get rate;

}
/// @nodoc
class _$RatesStateCopyWithImpl<$Res>
    implements $RatesStateCopyWith<$Res> {
  _$RatesStateCopyWithImpl(this._self, this._then);

  final RatesState _self;
  final $Res Function(RatesState) _then;

/// Create a copy of RatesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? rate = freezed,Object? history = null,Object? isStale = null,Object? isBackfilling = null,Object? failure = freezed,}) {
  return _then(RatesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as RateModel?,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<HistoryPointModel>,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,isBackfilling: null == isBackfilling ? _self.isBackfilling : isBackfilling // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}
/// Create a copy of RatesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateModelCopyWith<$Res>? get rate {
    if (_self.rate == null) {
    return null;
  }

  return $RateModelCopyWith<$Res>(_self.rate!, (value) {
    return _then(_self.copyWith(rate: value));
  });
}
}


/// Adds pattern-matching-related methods to [RatesState].
extension RatesStatePatterns on RatesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatesState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatesState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatesState value)  $default,){
final _that = this;
switch (_that) {
case _RatesState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatesState value)?  $default,){
final _that = this;
switch (_that) {
case _RatesState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ViewStatus status,  RateModel? rate,  List<HistoryPointModel> history,  bool isStale,  bool isBackfilling,  Failure? failure)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatesState() when $default != null:
return $default(_that.status,_that.rate,_that.history,_that.isStale,_that.isBackfilling,_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ViewStatus status,  RateModel? rate,  List<HistoryPointModel> history,  bool isStale,  bool isBackfilling,  Failure? failure)  $default,) {final _that = this;
switch (_that) {
case _RatesState():
return $default(_that.status,_that.rate,_that.history,_that.isStale,_that.isBackfilling,_that.failure);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ViewStatus status,  RateModel? rate,  List<HistoryPointModel> history,  bool isStale,  bool isBackfilling,  Failure? failure)?  $default,) {final _that = this;
switch (_that) {
case _RatesState() when $default != null:
return $default(_that.status,_that.rate,_that.history,_that.isStale,_that.isBackfilling,_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class _RatesState extends RatesState {
  const _RatesState({this.status = ViewStatus.initial, this.rate,  List<HistoryPointModel> history = const <HistoryPointModel>[], this.isStale = false, this.isBackfilling = false, this.failure}): _history = history,super._();
  

@override@JsonKey() final  ViewStatus status;
@override final  RateModel? rate;
 final  List<HistoryPointModel> _history;
@override@JsonKey() List<HistoryPointModel> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override@JsonKey() final  bool isStale;
@override@JsonKey() final  bool isBackfilling;
@override final  Failure? failure;

/// Create a copy of RatesState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatesStateCopyWith<_RatesState> get copyWith => __$RatesStateCopyWithImpl<_RatesState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatesState&&(identical(other.status, status) || other.status == status)&&(identical(other.rate, rate) || other.rate == rate)&&const DeepCollectionEquality().equals(other.history, _history)&&(identical(other.isStale, isStale) || other.isStale == isStale)&&(identical(other.isBackfilling, isBackfilling) || other.isBackfilling == isBackfilling)&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode {
    return Object.hash(runtimeType,status,rate,const DeepCollectionEquality().hash(_history),isStale,isBackfilling,failure);
}

@override
String toString() {
    return 'RatesState(status: $status, rate: $rate, history: $history, isStale: $isStale, isBackfilling: $isBackfilling, failure: $failure)';
}


}

/// @nodoc
abstract mixin class _$RatesStateCopyWith<$Res> implements $RatesStateCopyWith<$Res> {
  factory _$RatesStateCopyWith(_RatesState value, $Res Function(_RatesState) _then) = __$RatesStateCopyWithImpl;
@override @useResult
$Res call({
 ViewStatus status, RateModel? rate, List<HistoryPointModel> history, bool isStale, bool isBackfilling, Failure? failure
});


@override $RateModelCopyWith<$Res>? get rate;

}
/// @nodoc
class __$RatesStateCopyWithImpl<$Res>
    implements _$RatesStateCopyWith<$Res> {
  __$RatesStateCopyWithImpl(this._self, this._then);

  final _RatesState _self;
  final $Res Function(_RatesState) _then;

/// Create a copy of RatesState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? rate = freezed,Object? history = null,Object? isStale = null,Object? isBackfilling = null,Object? failure = freezed,}) {
  return _then(_RatesState(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as ViewStatus,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as RateModel?,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<HistoryPointModel>,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,isBackfilling: null == isBackfilling ? _self.isBackfilling : isBackfilling // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,
  ));
}

/// Create a copy of RatesState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateModelCopyWith<$Res>? get rate {
    if (_self.rate == null) {
    return null;
  }

  return $RateModelCopyWith<$Res>(_self.rate!, (value) {
    return _then(_self.copyWith(rate: value));
  });
}
}

// dart format on
