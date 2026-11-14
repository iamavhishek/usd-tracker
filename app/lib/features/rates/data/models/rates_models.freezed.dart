// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rates_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RateModel {

 String get base; String get quote; double? get rate; String? get rateDate; String? get fetchedAt; String? get provider; double? get previousRate; double? get change; double? get changePercent; RateDirection? get direction;
/// Create a copy of RateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateModelCopyWith<RateModel> get copyWith => _$RateModelCopyWithImpl<RateModel>(this as RateModel, _$identity);

  /// Serializes this RateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RateModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateModel&&(identical(other.base, _this.base) || other.base == _this.base)&&(identical(other.quote, _this.quote) || other.quote == _this.quote)&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.rateDate, _this.rateDate) || other.rateDate == _this.rateDate)&&(identical(other.fetchedAt, _this.fetchedAt) || other.fetchedAt == _this.fetchedAt)&&(identical(other.provider, _this.provider) || other.provider == _this.provider)&&(identical(other.previousRate, _this.previousRate) || other.previousRate == _this.previousRate)&&(identical(other.change, _this.change) || other.change == _this.change)&&(identical(other.changePercent, _this.changePercent) || other.changePercent == _this.changePercent)&&(identical(other.direction, _this.direction) || other.direction == _this.direction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RateModel;
  return Object.hash(runtimeType,_this.base,_this.quote,_this.rate,_this.rateDate,_this.fetchedAt,_this.provider,_this.previousRate,_this.change,_this.changePercent,_this.direction);
}

@override
String toString() {
  final _this = this as RateModel;
  return 'RateModel(base: ${_this.base}, quote: ${_this.quote}, rate: ${_this.rate}, rateDate: ${_this.rateDate}, fetchedAt: ${_this.fetchedAt}, provider: ${_this.provider}, previousRate: ${_this.previousRate}, change: ${_this.change}, changePercent: ${_this.changePercent}, direction: ${_this.direction})';
}


}

/// @nodoc
abstract mixin class $RateModelCopyWith<$Res>  {
  factory $RateModelCopyWith(RateModel value, $Res Function(RateModel) _then) = _$RateModelCopyWithImpl;
@useResult
$Res call({
 String base, String quote, double? rate, String? rateDate, String? fetchedAt, String? provider, double? previousRate, double? change, double? changePercent, RateDirection? direction
});




}
/// @nodoc
class _$RateModelCopyWithImpl<$Res>
    implements $RateModelCopyWith<$Res> {
  _$RateModelCopyWithImpl(this._self, this._then);

  final RateModel _self;
  final $Res Function(RateModel) _then;

/// Create a copy of RateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? base = null,Object? quote = null,Object? rate = freezed,Object? rateDate = freezed,Object? fetchedAt = freezed,Object? provider = freezed,Object? previousRate = freezed,Object? change = freezed,Object? changePercent = freezed,Object? direction = freezed,}) {
  return _then(RateModel(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,rateDate: freezed == rateDate ? _self.rateDate : rateDate // ignore: cast_nullable_to_non_nullable
as String?,fetchedAt: freezed == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,previousRate: freezed == previousRate ? _self.previousRate : previousRate // ignore: cast_nullable_to_non_nullable
as double?,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as double?,changePercent: freezed == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as double?,direction: freezed == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as RateDirection?,
  ));
}

}


/// Adds pattern-matching-related methods to [RateModel].
extension RateModelPatterns on RateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RateModel value)  $default,){
final _that = this;
switch (_that) {
case _RateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RateModel value)?  $default,){
final _that = this;
switch (_that) {
case _RateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String base,  String quote,  double? rate,  String? rateDate,  String? fetchedAt,  String? provider,  double? previousRate,  double? change,  double? changePercent,  RateDirection? direction)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RateModel() when $default != null:
return $default(_that.base,_that.quote,_that.rate,_that.rateDate,_that.fetchedAt,_that.provider,_that.previousRate,_that.change,_that.changePercent,_that.direction);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String base,  String quote,  double? rate,  String? rateDate,  String? fetchedAt,  String? provider,  double? previousRate,  double? change,  double? changePercent,  RateDirection? direction)  $default,) {final _that = this;
switch (_that) {
case _RateModel():
return $default(_that.base,_that.quote,_that.rate,_that.rateDate,_that.fetchedAt,_that.provider,_that.previousRate,_that.change,_that.changePercent,_that.direction);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String base,  String quote,  double? rate,  String? rateDate,  String? fetchedAt,  String? provider,  double? previousRate,  double? change,  double? changePercent,  RateDirection? direction)?  $default,) {final _that = this;
switch (_that) {
case _RateModel() when $default != null:
return $default(_that.base,_that.quote,_that.rate,_that.rateDate,_that.fetchedAt,_that.provider,_that.previousRate,_that.change,_that.changePercent,_that.direction);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RateModel implements RateModel {
  const _RateModel({required this.base, required this.quote, this.rate, this.rateDate, this.fetchedAt, this.provider, this.previousRate, this.change, this.changePercent, this.direction});
  factory _RateModel.fromJson(Map<String, dynamic> json) => _$RateModelFromJson(json);

@override final  String base;
@override final  String quote;
@override final  double? rate;
@override final  String? rateDate;
@override final  String? fetchedAt;
@override final  String? provider;
@override final  double? previousRate;
@override final  double? change;
@override final  double? changePercent;
@override final  RateDirection? direction;

/// Create a copy of RateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateModelCopyWith<_RateModel> get copyWith => __$RateModelCopyWithImpl<_RateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateModel&&(identical(other.base, base) || other.base == base)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.rateDate, rateDate) || other.rateDate == rateDate)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.previousRate, previousRate) || other.previousRate == previousRate)&&(identical(other.change, change) || other.change == change)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&(identical(other.direction, direction) || other.direction == direction));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,base,quote,rate,rateDate,fetchedAt,provider,previousRate,change,changePercent,direction);
}

@override
String toString() {
    return 'RateModel(base: $base, quote: $quote, rate: $rate, rateDate: $rateDate, fetchedAt: $fetchedAt, provider: $provider, previousRate: $previousRate, change: $change, changePercent: $changePercent, direction: $direction)';
}


}

/// @nodoc
abstract mixin class _$RateModelCopyWith<$Res> implements $RateModelCopyWith<$Res> {
  factory _$RateModelCopyWith(_RateModel value, $Res Function(_RateModel) _then) = __$RateModelCopyWithImpl;
@override @useResult
$Res call({
 String base, String quote, double? rate, String? rateDate, String? fetchedAt, String? provider, double? previousRate, double? change, double? changePercent, RateDirection? direction
});




}
/// @nodoc
class __$RateModelCopyWithImpl<$Res>
    implements _$RateModelCopyWith<$Res> {
  __$RateModelCopyWithImpl(this._self, this._then);

  final _RateModel _self;
  final $Res Function(_RateModel) _then;

/// Create a copy of RateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? base = null,Object? quote = null,Object? rate = freezed,Object? rateDate = freezed,Object? fetchedAt = freezed,Object? provider = freezed,Object? previousRate = freezed,Object? change = freezed,Object? changePercent = freezed,Object? direction = freezed,}) {
  return _then(_RateModel(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,rate: freezed == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double?,rateDate: freezed == rateDate ? _self.rateDate : rateDate // ignore: cast_nullable_to_non_nullable
as String?,fetchedAt: freezed == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,previousRate: freezed == previousRate ? _self.previousRate : previousRate // ignore: cast_nullable_to_non_nullable
as double?,change: freezed == change ? _self.change : change // ignore: cast_nullable_to_non_nullable
as double?,changePercent: freezed == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as double?,direction: freezed == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as RateDirection?,
  ));
}


}


/// @nodoc
mixin _$PollSummaryModel {

 String? get status; String? get trigger; String? get at; String? get finishedAt; int? get durationMs;
/// Create a copy of PollSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PollSummaryModelCopyWith<PollSummaryModel> get copyWith => _$PollSummaryModelCopyWithImpl<PollSummaryModel>(this as PollSummaryModel, _$identity);

  /// Serializes this PollSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PollSummaryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PollSummaryModel&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.trigger, _this.trigger) || other.trigger == _this.trigger)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.finishedAt, _this.finishedAt) || other.finishedAt == _this.finishedAt)&&(identical(other.durationMs, _this.durationMs) || other.durationMs == _this.durationMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PollSummaryModel;
  return Object.hash(runtimeType,_this.status,_this.trigger,_this.at,_this.finishedAt,_this.durationMs);
}

@override
String toString() {
  final _this = this as PollSummaryModel;
  return 'PollSummaryModel(status: ${_this.status}, trigger: ${_this.trigger}, at: ${_this.at}, finishedAt: ${_this.finishedAt}, durationMs: ${_this.durationMs})';
}


}

/// @nodoc
abstract mixin class $PollSummaryModelCopyWith<$Res>  {
  factory $PollSummaryModelCopyWith(PollSummaryModel value, $Res Function(PollSummaryModel) _then) = _$PollSummaryModelCopyWithImpl;
@useResult
$Res call({
 String? status, String? trigger, String? at, String? finishedAt, int? durationMs
});




}
/// @nodoc
class _$PollSummaryModelCopyWithImpl<$Res>
    implements $PollSummaryModelCopyWith<$Res> {
  _$PollSummaryModelCopyWithImpl(this._self, this._then);

  final PollSummaryModel _self;
  final $Res Function(PollSummaryModel) _then;

/// Create a copy of PollSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? trigger = freezed,Object? at = freezed,Object? finishedAt = freezed,Object? durationMs = freezed,}) {
  return _then(PollSummaryModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,trigger: freezed == trigger ? _self.trigger : trigger // ignore: cast_nullable_to_non_nullable
as String?,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as String?,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [PollSummaryModel].
extension PollSummaryModelPatterns on PollSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PollSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PollSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PollSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _PollSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PollSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PollSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? status,  String? trigger,  String? at,  String? finishedAt,  int? durationMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PollSummaryModel() when $default != null:
return $default(_that.status,_that.trigger,_that.at,_that.finishedAt,_that.durationMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? status,  String? trigger,  String? at,  String? finishedAt,  int? durationMs)  $default,) {final _that = this;
switch (_that) {
case _PollSummaryModel():
return $default(_that.status,_that.trigger,_that.at,_that.finishedAt,_that.durationMs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? status,  String? trigger,  String? at,  String? finishedAt,  int? durationMs)?  $default,) {final _that = this;
switch (_that) {
case _PollSummaryModel() when $default != null:
return $default(_that.status,_that.trigger,_that.at,_that.finishedAt,_that.durationMs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PollSummaryModel implements PollSummaryModel {
  const _PollSummaryModel({this.status, this.trigger, this.at, this.finishedAt, this.durationMs});
  factory _PollSummaryModel.fromJson(Map<String, dynamic> json) => _$PollSummaryModelFromJson(json);

@override final  String? status;
@override final  String? trigger;
@override final  String? at;
@override final  String? finishedAt;
@override final  int? durationMs;

/// Create a copy of PollSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PollSummaryModelCopyWith<_PollSummaryModel> get copyWith => __$PollSummaryModelCopyWithImpl<_PollSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PollSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PollSummaryModel&&(identical(other.status, status) || other.status == status)&&(identical(other.trigger, trigger) || other.trigger == trigger)&&(identical(other.at, at) || other.at == at)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.durationMs, durationMs) || other.durationMs == durationMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,trigger,at,finishedAt,durationMs);
}

@override
String toString() {
    return 'PollSummaryModel(status: $status, trigger: $trigger, at: $at, finishedAt: $finishedAt, durationMs: $durationMs)';
}


}

/// @nodoc
abstract mixin class _$PollSummaryModelCopyWith<$Res> implements $PollSummaryModelCopyWith<$Res> {
  factory _$PollSummaryModelCopyWith(_PollSummaryModel value, $Res Function(_PollSummaryModel) _then) = __$PollSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 String? status, String? trigger, String? at, String? finishedAt, int? durationMs
});




}
/// @nodoc
class __$PollSummaryModelCopyWithImpl<$Res>
    implements _$PollSummaryModelCopyWith<$Res> {
  __$PollSummaryModelCopyWithImpl(this._self, this._then);

  final _PollSummaryModel _self;
  final $Res Function(_PollSummaryModel) _then;

/// Create a copy of PollSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? trigger = freezed,Object? at = freezed,Object? finishedAt = freezed,Object? durationMs = freezed,}) {
  return _then(_PollSummaryModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,trigger: freezed == trigger ? _self.trigger : trigger // ignore: cast_nullable_to_non_nullable
as String?,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as String?,durationMs: freezed == durationMs ? _self.durationMs : durationMs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$RateOverviewModel {

 String get base; List<RateModel> get rates; PollSummaryModel? get lastPoll;
/// Create a copy of RateOverviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateOverviewModelCopyWith<RateOverviewModel> get copyWith => _$RateOverviewModelCopyWithImpl<RateOverviewModel>(this as RateOverviewModel, _$identity);

  /// Serializes this RateOverviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RateOverviewModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateOverviewModel&&(identical(other.base, _this.base) || other.base == _this.base)&&const DeepCollectionEquality().equals(other.rates, _this.rates)&&(identical(other.lastPoll, _this.lastPoll) || other.lastPoll == _this.lastPoll));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RateOverviewModel;
  return Object.hash(runtimeType,_this.base,const DeepCollectionEquality().hash(_this.rates),_this.lastPoll);
}

@override
String toString() {
  final _this = this as RateOverviewModel;
  return 'RateOverviewModel(base: ${_this.base}, rates: ${_this.rates}, lastPoll: ${_this.lastPoll})';
}


}

/// @nodoc
abstract mixin class $RateOverviewModelCopyWith<$Res>  {
  factory $RateOverviewModelCopyWith(RateOverviewModel value, $Res Function(RateOverviewModel) _then) = _$RateOverviewModelCopyWithImpl;
@useResult
$Res call({
 String base, List<RateModel> rates, PollSummaryModel? lastPoll
});


$PollSummaryModelCopyWith<$Res>? get lastPoll;

}
/// @nodoc
class _$RateOverviewModelCopyWithImpl<$Res>
    implements $RateOverviewModelCopyWith<$Res> {
  _$RateOverviewModelCopyWithImpl(this._self, this._then);

  final RateOverviewModel _self;
  final $Res Function(RateOverviewModel) _then;

/// Create a copy of RateOverviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? base = null,Object? rates = null,Object? lastPoll = freezed,}) {
  return _then(RateOverviewModel(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,rates: null == rates ? _self.rates : rates // ignore: cast_nullable_to_non_nullable
as List<RateModel>,lastPoll: freezed == lastPoll ? _self.lastPoll : lastPoll // ignore: cast_nullable_to_non_nullable
as PollSummaryModel?,
  ));
}
/// Create a copy of RateOverviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollSummaryModelCopyWith<$Res>? get lastPoll {
    if (_self.lastPoll == null) {
    return null;
  }

  return $PollSummaryModelCopyWith<$Res>(_self.lastPoll!, (value) {
    return _then(_self.copyWith(lastPoll: value));
  });
}
}


/// Adds pattern-matching-related methods to [RateOverviewModel].
extension RateOverviewModelPatterns on RateOverviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RateOverviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RateOverviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RateOverviewModel value)  $default,){
final _that = this;
switch (_that) {
case _RateOverviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RateOverviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _RateOverviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String base,  List<RateModel> rates,  PollSummaryModel? lastPoll)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RateOverviewModel() when $default != null:
return $default(_that.base,_that.rates,_that.lastPoll);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String base,  List<RateModel> rates,  PollSummaryModel? lastPoll)  $default,) {final _that = this;
switch (_that) {
case _RateOverviewModel():
return $default(_that.base,_that.rates,_that.lastPoll);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String base,  List<RateModel> rates,  PollSummaryModel? lastPoll)?  $default,) {final _that = this;
switch (_that) {
case _RateOverviewModel() when $default != null:
return $default(_that.base,_that.rates,_that.lastPoll);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RateOverviewModel implements RateOverviewModel {
  const _RateOverviewModel({required this.base,  List<RateModel> rates = const <RateModel>[], this.lastPoll}): _rates = rates;
  factory _RateOverviewModel.fromJson(Map<String, dynamic> json) => _$RateOverviewModelFromJson(json);

@override final  String base;
 final  List<RateModel> _rates;
@override@JsonKey() List<RateModel> get rates {
  if (_rates is EqualUnmodifiableListView) return _rates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_rates);
}

@override final  PollSummaryModel? lastPoll;

/// Create a copy of RateOverviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateOverviewModelCopyWith<_RateOverviewModel> get copyWith => __$RateOverviewModelCopyWithImpl<_RateOverviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateOverviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateOverviewModel&&(identical(other.base, base) || other.base == base)&&const DeepCollectionEquality().equals(other.rates, _rates)&&(identical(other.lastPoll, lastPoll) || other.lastPoll == lastPoll));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,base,const DeepCollectionEquality().hash(_rates),lastPoll);
}

@override
String toString() {
    return 'RateOverviewModel(base: $base, rates: $rates, lastPoll: $lastPoll)';
}


}

/// @nodoc
abstract mixin class _$RateOverviewModelCopyWith<$Res> implements $RateOverviewModelCopyWith<$Res> {
  factory _$RateOverviewModelCopyWith(_RateOverviewModel value, $Res Function(_RateOverviewModel) _then) = __$RateOverviewModelCopyWithImpl;
@override @useResult
$Res call({
 String base, List<RateModel> rates, PollSummaryModel? lastPoll
});


@override $PollSummaryModelCopyWith<$Res>? get lastPoll;

}
/// @nodoc
class __$RateOverviewModelCopyWithImpl<$Res>
    implements _$RateOverviewModelCopyWith<$Res> {
  __$RateOverviewModelCopyWithImpl(this._self, this._then);

  final _RateOverviewModel _self;
  final $Res Function(_RateOverviewModel) _then;

/// Create a copy of RateOverviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? base = null,Object? rates = null,Object? lastPoll = freezed,}) {
  return _then(_RateOverviewModel(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,rates: null == rates ? _self._rates : rates // ignore: cast_nullable_to_non_nullable
as List<RateModel>,lastPoll: freezed == lastPoll ? _self.lastPoll : lastPoll // ignore: cast_nullable_to_non_nullable
as PollSummaryModel?,
  ));
}

/// Create a copy of RateOverviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PollSummaryModelCopyWith<$Res>? get lastPoll {
    if (_self.lastPoll == null) {
    return null;
  }

  return $PollSummaryModelCopyWith<$Res>(_self.lastPoll!, (value) {
    return _then(_self.copyWith(lastPoll: value));
  });
}
}


/// @nodoc
mixin _$HistoryPointModel {

 double get rate; String get rateDate; String get fetchedAt;
/// Create a copy of HistoryPointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryPointModelCopyWith<HistoryPointModel> get copyWith => _$HistoryPointModelCopyWithImpl<HistoryPointModel>(this as HistoryPointModel, _$identity);

  /// Serializes this HistoryPointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HistoryPointModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryPointModel&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&(identical(other.rateDate, _this.rateDate) || other.rateDate == _this.rateDate)&&(identical(other.fetchedAt, _this.fetchedAt) || other.fetchedAt == _this.fetchedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HistoryPointModel;
  return Object.hash(runtimeType,_this.rate,_this.rateDate,_this.fetchedAt);
}

@override
String toString() {
  final _this = this as HistoryPointModel;
  return 'HistoryPointModel(rate: ${_this.rate}, rateDate: ${_this.rateDate}, fetchedAt: ${_this.fetchedAt})';
}


}

/// @nodoc
abstract mixin class $HistoryPointModelCopyWith<$Res>  {
  factory $HistoryPointModelCopyWith(HistoryPointModel value, $Res Function(HistoryPointModel) _then) = _$HistoryPointModelCopyWithImpl;
@useResult
$Res call({
 double rate, String rateDate, String fetchedAt
});




}
/// @nodoc
class _$HistoryPointModelCopyWithImpl<$Res>
    implements $HistoryPointModelCopyWith<$Res> {
  _$HistoryPointModelCopyWithImpl(this._self, this._then);

  final HistoryPointModel _self;
  final $Res Function(HistoryPointModel) _then;

/// Create a copy of HistoryPointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rate = null,Object? rateDate = null,Object? fetchedAt = null,}) {
  return _then(HistoryPointModel(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,rateDate: null == rateDate ? _self.rateDate : rateDate // ignore: cast_nullable_to_non_nullable
as String,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [HistoryPointModel].
extension HistoryPointModelPatterns on HistoryPointModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HistoryPointModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HistoryPointModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HistoryPointModel value)  $default,){
final _that = this;
switch (_that) {
case _HistoryPointModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HistoryPointModel value)?  $default,){
final _that = this;
switch (_that) {
case _HistoryPointModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( double rate,  String rateDate,  String fetchedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HistoryPointModel() when $default != null:
return $default(_that.rate,_that.rateDate,_that.fetchedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( double rate,  String rateDate,  String fetchedAt)  $default,) {final _that = this;
switch (_that) {
case _HistoryPointModel():
return $default(_that.rate,_that.rateDate,_that.fetchedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( double rate,  String rateDate,  String fetchedAt)?  $default,) {final _that = this;
switch (_that) {
case _HistoryPointModel() when $default != null:
return $default(_that.rate,_that.rateDate,_that.fetchedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HistoryPointModel implements HistoryPointModel {
  const _HistoryPointModel({required this.rate, required this.rateDate, required this.fetchedAt});
  factory _HistoryPointModel.fromJson(Map<String, dynamic> json) => _$HistoryPointModelFromJson(json);

@override final  double rate;
@override final  String rateDate;
@override final  String fetchedAt;

/// Create a copy of HistoryPointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HistoryPointModelCopyWith<_HistoryPointModel> get copyWith => __$HistoryPointModelCopyWithImpl<_HistoryPointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HistoryPointModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HistoryPointModel&&(identical(other.rate, rate) || other.rate == rate)&&(identical(other.rateDate, rateDate) || other.rateDate == rateDate)&&(identical(other.fetchedAt, fetchedAt) || other.fetchedAt == fetchedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,rate,rateDate,fetchedAt);
}

@override
String toString() {
    return 'HistoryPointModel(rate: $rate, rateDate: $rateDate, fetchedAt: $fetchedAt)';
}


}

/// @nodoc
abstract mixin class _$HistoryPointModelCopyWith<$Res> implements $HistoryPointModelCopyWith<$Res> {
  factory _$HistoryPointModelCopyWith(_HistoryPointModel value, $Res Function(_HistoryPointModel) _then) = __$HistoryPointModelCopyWithImpl;
@override @useResult
$Res call({
 double rate, String rateDate, String fetchedAt
});




}
/// @nodoc
class __$HistoryPointModelCopyWithImpl<$Res>
    implements _$HistoryPointModelCopyWith<$Res> {
  __$HistoryPointModelCopyWithImpl(this._self, this._then);

  final _HistoryPointModel _self;
  final $Res Function(_HistoryPointModel) _then;

/// Create a copy of HistoryPointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rate = null,Object? rateDate = null,Object? fetchedAt = null,}) {
  return _then(_HistoryPointModel(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as double,rateDate: null == rateDate ? _self.rateDate : rateDate // ignore: cast_nullable_to_non_nullable
as String,fetchedAt: null == fetchedAt ? _self.fetchedAt : fetchedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$RateHistoryModel {

 String get base; String get quote; List<HistoryPointModel> get points;
/// Create a copy of RateHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RateHistoryModelCopyWith<RateHistoryModel> get copyWith => _$RateHistoryModelCopyWithImpl<RateHistoryModel>(this as RateHistoryModel, _$identity);

  /// Serializes this RateHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RateHistoryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RateHistoryModel&&(identical(other.base, _this.base) || other.base == _this.base)&&(identical(other.quote, _this.quote) || other.quote == _this.quote)&&const DeepCollectionEquality().equals(other.points, _this.points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RateHistoryModel;
  return Object.hash(runtimeType,_this.base,_this.quote,const DeepCollectionEquality().hash(_this.points));
}

@override
String toString() {
  final _this = this as RateHistoryModel;
  return 'RateHistoryModel(base: ${_this.base}, quote: ${_this.quote}, points: ${_this.points})';
}


}

/// @nodoc
abstract mixin class $RateHistoryModelCopyWith<$Res>  {
  factory $RateHistoryModelCopyWith(RateHistoryModel value, $Res Function(RateHistoryModel) _then) = _$RateHistoryModelCopyWithImpl;
@useResult
$Res call({
 String base, String quote, List<HistoryPointModel> points
});




}
/// @nodoc
class _$RateHistoryModelCopyWithImpl<$Res>
    implements $RateHistoryModelCopyWith<$Res> {
  _$RateHistoryModelCopyWithImpl(this._self, this._then);

  final RateHistoryModel _self;
  final $Res Function(RateHistoryModel) _then;

/// Create a copy of RateHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? base = null,Object? quote = null,Object? points = null,}) {
  return _then(RateHistoryModel(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as List<HistoryPointModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [RateHistoryModel].
extension RateHistoryModelPatterns on RateHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RateHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RateHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RateHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _RateHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RateHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _RateHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String base,  String quote,  List<HistoryPointModel> points)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RateHistoryModel() when $default != null:
return $default(_that.base,_that.quote,_that.points);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String base,  String quote,  List<HistoryPointModel> points)  $default,) {final _that = this;
switch (_that) {
case _RateHistoryModel():
return $default(_that.base,_that.quote,_that.points);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String base,  String quote,  List<HistoryPointModel> points)?  $default,) {final _that = this;
switch (_that) {
case _RateHistoryModel() when $default != null:
return $default(_that.base,_that.quote,_that.points);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RateHistoryModel implements RateHistoryModel {
  const _RateHistoryModel({required this.base, required this.quote,  List<HistoryPointModel> points = const <HistoryPointModel>[]}): _points = points;
  factory _RateHistoryModel.fromJson(Map<String, dynamic> json) => _$RateHistoryModelFromJson(json);

@override final  String base;
@override final  String quote;
 final  List<HistoryPointModel> _points;
@override@JsonKey() List<HistoryPointModel> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}


/// Create a copy of RateHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RateHistoryModelCopyWith<_RateHistoryModel> get copyWith => __$RateHistoryModelCopyWithImpl<_RateHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RateHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RateHistoryModel&&(identical(other.base, base) || other.base == base)&&(identical(other.quote, quote) || other.quote == quote)&&const DeepCollectionEquality().equals(other.points, _points));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,base,quote,const DeepCollectionEquality().hash(_points));
}

@override
String toString() {
    return 'RateHistoryModel(base: $base, quote: $quote, points: $points)';
}


}

/// @nodoc
abstract mixin class _$RateHistoryModelCopyWith<$Res> implements $RateHistoryModelCopyWith<$Res> {
  factory _$RateHistoryModelCopyWith(_RateHistoryModel value, $Res Function(_RateHistoryModel) _then) = __$RateHistoryModelCopyWithImpl;
@override @useResult
$Res call({
 String base, String quote, List<HistoryPointModel> points
});




}
/// @nodoc
class __$RateHistoryModelCopyWithImpl<$Res>
    implements _$RateHistoryModelCopyWith<$Res> {
  __$RateHistoryModelCopyWithImpl(this._self, this._then);

  final _RateHistoryModel _self;
  final $Res Function(_RateHistoryModel) _then;

/// Create a copy of RateHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? base = null,Object? quote = null,Object? points = null,}) {
  return _then(_RateHistoryModel(
base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<HistoryPointModel>,
  ));
}


}

/// @nodoc
mixin _$RatesBundle {

 RateModel get rate; List<HistoryPointModel> get history; bool get isStale;
/// Create a copy of RatesBundle
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatesBundleCopyWith<RatesBundle> get copyWith => _$RatesBundleCopyWithImpl<RatesBundle>(this as RatesBundle, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as RatesBundle;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatesBundle&&(identical(other.rate, _this.rate) || other.rate == _this.rate)&&const DeepCollectionEquality().equals(other.history, _this.history)&&(identical(other.isStale, _this.isStale) || other.isStale == _this.isStale));
}


@override
int get hashCode {
  final _this = this as RatesBundle;
  return Object.hash(runtimeType,_this.rate,const DeepCollectionEquality().hash(_this.history),_this.isStale);
}

@override
String toString() {
  final _this = this as RatesBundle;
  return 'RatesBundle(rate: ${_this.rate}, history: ${_this.history}, isStale: ${_this.isStale})';
}


}

/// @nodoc
abstract mixin class $RatesBundleCopyWith<$Res>  {
  factory $RatesBundleCopyWith(RatesBundle value, $Res Function(RatesBundle) _then) = _$RatesBundleCopyWithImpl;
@useResult
$Res call({
 RateModel rate, List<HistoryPointModel> history, bool isStale
});


$RateModelCopyWith<$Res> get rate;

}
/// @nodoc
class _$RatesBundleCopyWithImpl<$Res>
    implements $RatesBundleCopyWith<$Res> {
  _$RatesBundleCopyWithImpl(this._self, this._then);

  final RatesBundle _self;
  final $Res Function(RatesBundle) _then;

/// Create a copy of RatesBundle
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? rate = null,Object? history = null,Object? isStale = null,}) {
  return _then(RatesBundle(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as RateModel,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<HistoryPointModel>,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of RatesBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateModelCopyWith<$Res> get rate {
  
  return $RateModelCopyWith<$Res>(_self.rate, (value) {
    return _then(_self.copyWith(rate: value));
  });
}
}


/// Adds pattern-matching-related methods to [RatesBundle].
extension RatesBundlePatterns on RatesBundle {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatesBundle value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatesBundle() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatesBundle value)  $default,){
final _that = this;
switch (_that) {
case _RatesBundle():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatesBundle value)?  $default,){
final _that = this;
switch (_that) {
case _RatesBundle() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RateModel rate,  List<HistoryPointModel> history,  bool isStale)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatesBundle() when $default != null:
return $default(_that.rate,_that.history,_that.isStale);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RateModel rate,  List<HistoryPointModel> history,  bool isStale)  $default,) {final _that = this;
switch (_that) {
case _RatesBundle():
return $default(_that.rate,_that.history,_that.isStale);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RateModel rate,  List<HistoryPointModel> history,  bool isStale)?  $default,) {final _that = this;
switch (_that) {
case _RatesBundle() when $default != null:
return $default(_that.rate,_that.history,_that.isStale);case _:
  return null;

}
}

}

/// @nodoc


class _RatesBundle implements RatesBundle {
  const _RatesBundle({required this.rate,  List<HistoryPointModel> history = const <HistoryPointModel>[], this.isStale = false}): _history = history;
  

@override final  RateModel rate;
 final  List<HistoryPointModel> _history;
@override@JsonKey() List<HistoryPointModel> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override@JsonKey() final  bool isStale;

/// Create a copy of RatesBundle
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatesBundleCopyWith<_RatesBundle> get copyWith => __$RatesBundleCopyWithImpl<_RatesBundle>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatesBundle&&(identical(other.rate, rate) || other.rate == rate)&&const DeepCollectionEquality().equals(other.history, _history)&&(identical(other.isStale, isStale) || other.isStale == isStale));
}


@override
int get hashCode {
    return Object.hash(runtimeType,rate,const DeepCollectionEquality().hash(_history),isStale);
}

@override
String toString() {
    return 'RatesBundle(rate: $rate, history: $history, isStale: $isStale)';
}


}

/// @nodoc
abstract mixin class _$RatesBundleCopyWith<$Res> implements $RatesBundleCopyWith<$Res> {
  factory _$RatesBundleCopyWith(_RatesBundle value, $Res Function(_RatesBundle) _then) = __$RatesBundleCopyWithImpl;
@override @useResult
$Res call({
 RateModel rate, List<HistoryPointModel> history, bool isStale
});


@override $RateModelCopyWith<$Res> get rate;

}
/// @nodoc
class __$RatesBundleCopyWithImpl<$Res>
    implements _$RatesBundleCopyWith<$Res> {
  __$RatesBundleCopyWithImpl(this._self, this._then);

  final _RatesBundle _self;
  final $Res Function(_RatesBundle) _then;

/// Create a copy of RatesBundle
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? rate = null,Object? history = null,Object? isStale = null,}) {
  return _then(_RatesBundle(
rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as RateModel,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<HistoryPointModel>,isStale: null == isStale ? _self.isStale : isStale // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of RatesBundle
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RateModelCopyWith<$Res> get rate {
  
  return $RateModelCopyWith<$Res>(_self.rate, (value) {
    return _then(_self.copyWith(rate: value));
  });
}
}

// dart format on
