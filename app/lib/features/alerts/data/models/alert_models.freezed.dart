// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alert_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AlertRuleModel {

 int get id; String? get name; String get base; String get quote; AlertCondition get condition; double get threshold; bool get enabled; int get cooldownSeconds; String? get lastTriggeredAt; String get createdAt; String get updatedAt;
/// Create a copy of AlertRuleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AlertRuleModelCopyWith<AlertRuleModel> get copyWith => _$AlertRuleModelCopyWithImpl<AlertRuleModel>(this as AlertRuleModel, _$identity);

  /// Serializes this AlertRuleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AlertRuleModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AlertRuleModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.base, _this.base) || other.base == _this.base)&&(identical(other.quote, _this.quote) || other.quote == _this.quote)&&(identical(other.condition, _this.condition) || other.condition == _this.condition)&&(identical(other.threshold, _this.threshold) || other.threshold == _this.threshold)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.cooldownSeconds, _this.cooldownSeconds) || other.cooldownSeconds == _this.cooldownSeconds)&&(identical(other.lastTriggeredAt, _this.lastTriggeredAt) || other.lastTriggeredAt == _this.lastTriggeredAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AlertRuleModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.base,_this.quote,_this.condition,_this.threshold,_this.enabled,_this.cooldownSeconds,_this.lastTriggeredAt,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as AlertRuleModel;
  return 'AlertRuleModel(id: ${_this.id}, name: ${_this.name}, base: ${_this.base}, quote: ${_this.quote}, condition: ${_this.condition}, threshold: ${_this.threshold}, enabled: ${_this.enabled}, cooldownSeconds: ${_this.cooldownSeconds}, lastTriggeredAt: ${_this.lastTriggeredAt}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $AlertRuleModelCopyWith<$Res>  {
  factory $AlertRuleModelCopyWith(AlertRuleModel value, $Res Function(AlertRuleModel) _then) = _$AlertRuleModelCopyWithImpl;
@useResult
$Res call({
 int id, String? name, String base, String quote, AlertCondition condition, double threshold, bool enabled, int cooldownSeconds, String? lastTriggeredAt, String createdAt, String updatedAt
});




}
/// @nodoc
class _$AlertRuleModelCopyWithImpl<$Res>
    implements $AlertRuleModelCopyWith<$Res> {
  _$AlertRuleModelCopyWithImpl(this._self, this._then);

  final AlertRuleModel _self;
  final $Res Function(AlertRuleModel) _then;

/// Create a copy of AlertRuleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? base = null,Object? quote = null,Object? condition = null,Object? threshold = null,Object? enabled = null,Object? cooldownSeconds = null,Object? lastTriggeredAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(AlertRuleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as AlertCondition,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,lastTriggeredAt: freezed == lastTriggeredAt ? _self.lastTriggeredAt : lastTriggeredAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [AlertRuleModel].
extension AlertRuleModelPatterns on AlertRuleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AlertRuleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AlertRuleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AlertRuleModel value)  $default,){
final _that = this;
switch (_that) {
case _AlertRuleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AlertRuleModel value)?  $default,){
final _that = this;
switch (_that) {
case _AlertRuleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String? name,  String base,  String quote,  AlertCondition condition,  double threshold,  bool enabled,  int cooldownSeconds,  String? lastTriggeredAt,  String createdAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AlertRuleModel() when $default != null:
return $default(_that.id,_that.name,_that.base,_that.quote,_that.condition,_that.threshold,_that.enabled,_that.cooldownSeconds,_that.lastTriggeredAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String? name,  String base,  String quote,  AlertCondition condition,  double threshold,  bool enabled,  int cooldownSeconds,  String? lastTriggeredAt,  String createdAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AlertRuleModel():
return $default(_that.id,_that.name,_that.base,_that.quote,_that.condition,_that.threshold,_that.enabled,_that.cooldownSeconds,_that.lastTriggeredAt,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String? name,  String base,  String quote,  AlertCondition condition,  double threshold,  bool enabled,  int cooldownSeconds,  String? lastTriggeredAt,  String createdAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AlertRuleModel() when $default != null:
return $default(_that.id,_that.name,_that.base,_that.quote,_that.condition,_that.threshold,_that.enabled,_that.cooldownSeconds,_that.lastTriggeredAt,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AlertRuleModel implements AlertRuleModel {
  const _AlertRuleModel({required this.id, this.name, required this.base, required this.quote, required this.condition, required this.threshold, required this.enabled, required this.cooldownSeconds, this.lastTriggeredAt, required this.createdAt, required this.updatedAt});
  factory _AlertRuleModel.fromJson(Map<String, dynamic> json) => _$AlertRuleModelFromJson(json);

@override final  int id;
@override final  String? name;
@override final  String base;
@override final  String quote;
@override final  AlertCondition condition;
@override final  double threshold;
@override final  bool enabled;
@override final  int cooldownSeconds;
@override final  String? lastTriggeredAt;
@override final  String createdAt;
@override final  String updatedAt;

/// Create a copy of AlertRuleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AlertRuleModelCopyWith<_AlertRuleModel> get copyWith => __$AlertRuleModelCopyWithImpl<_AlertRuleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AlertRuleModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AlertRuleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.base, base) || other.base == base)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.condition, condition) || other.condition == condition)&&(identical(other.threshold, threshold) || other.threshold == threshold)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.cooldownSeconds, cooldownSeconds) || other.cooldownSeconds == cooldownSeconds)&&(identical(other.lastTriggeredAt, lastTriggeredAt) || other.lastTriggeredAt == lastTriggeredAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,base,quote,condition,threshold,enabled,cooldownSeconds,lastTriggeredAt,createdAt,updatedAt);
}

@override
String toString() {
    return 'AlertRuleModel(id: $id, name: $name, base: $base, quote: $quote, condition: $condition, threshold: $threshold, enabled: $enabled, cooldownSeconds: $cooldownSeconds, lastTriggeredAt: $lastTriggeredAt, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AlertRuleModelCopyWith<$Res> implements $AlertRuleModelCopyWith<$Res> {
  factory _$AlertRuleModelCopyWith(_AlertRuleModel value, $Res Function(_AlertRuleModel) _then) = __$AlertRuleModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String? name, String base, String quote, AlertCondition condition, double threshold, bool enabled, int cooldownSeconds, String? lastTriggeredAt, String createdAt, String updatedAt
});




}
/// @nodoc
class __$AlertRuleModelCopyWithImpl<$Res>
    implements _$AlertRuleModelCopyWith<$Res> {
  __$AlertRuleModelCopyWithImpl(this._self, this._then);

  final _AlertRuleModel _self;
  final $Res Function(_AlertRuleModel) _then;

/// Create a copy of AlertRuleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? base = null,Object? quote = null,Object? condition = null,Object? threshold = null,Object? enabled = null,Object? cooldownSeconds = null,Object? lastTriggeredAt = freezed,Object? createdAt = null,Object? updatedAt = null,}) {
  return _then(_AlertRuleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,base: null == base ? _self.base : base // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,condition: null == condition ? _self.condition : condition // ignore: cast_nullable_to_non_nullable
as AlertCondition,threshold: null == threshold ? _self.threshold : threshold // ignore: cast_nullable_to_non_nullable
as double,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,cooldownSeconds: null == cooldownSeconds ? _self.cooldownSeconds : cooldownSeconds // ignore: cast_nullable_to_non_nullable
as int,lastTriggeredAt: freezed == lastTriggeredAt ? _self.lastTriggeredAt : lastTriggeredAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
