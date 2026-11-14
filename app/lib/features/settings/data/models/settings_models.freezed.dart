// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HealthDatabaseModel {

 bool get ok;
/// Create a copy of HealthDatabaseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthDatabaseModelCopyWith<HealthDatabaseModel> get copyWith => _$HealthDatabaseModelCopyWithImpl<HealthDatabaseModel>(this as HealthDatabaseModel, _$identity);

  /// Serializes this HealthDatabaseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HealthDatabaseModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthDatabaseModel&&(identical(other.ok, _this.ok) || other.ok == _this.ok));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HealthDatabaseModel;
  return Object.hash(runtimeType,_this.ok);
}

@override
String toString() {
  final _this = this as HealthDatabaseModel;
  return 'HealthDatabaseModel(ok: ${_this.ok})';
}


}

/// @nodoc
abstract mixin class $HealthDatabaseModelCopyWith<$Res>  {
  factory $HealthDatabaseModelCopyWith(HealthDatabaseModel value, $Res Function(HealthDatabaseModel) _then) = _$HealthDatabaseModelCopyWithImpl;
@useResult
$Res call({
 bool ok
});




}
/// @nodoc
class _$HealthDatabaseModelCopyWithImpl<$Res>
    implements $HealthDatabaseModelCopyWith<$Res> {
  _$HealthDatabaseModelCopyWithImpl(this._self, this._then);

  final HealthDatabaseModel _self;
  final $Res Function(HealthDatabaseModel) _then;

/// Create a copy of HealthDatabaseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ok = null,}) {
  return _then(HealthDatabaseModel(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthDatabaseModel].
extension HealthDatabaseModelPatterns on HealthDatabaseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthDatabaseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthDatabaseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthDatabaseModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthDatabaseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthDatabaseModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthDatabaseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool ok)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthDatabaseModel() when $default != null:
return $default(_that.ok);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool ok)  $default,) {final _that = this;
switch (_that) {
case _HealthDatabaseModel():
return $default(_that.ok);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool ok)?  $default,) {final _that = this;
switch (_that) {
case _HealthDatabaseModel() when $default != null:
return $default(_that.ok);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthDatabaseModel implements HealthDatabaseModel {
  const _HealthDatabaseModel({this.ok = false});
  factory _HealthDatabaseModel.fromJson(Map<String, dynamic> json) => _$HealthDatabaseModelFromJson(json);

@override@JsonKey() final  bool ok;

/// Create a copy of HealthDatabaseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthDatabaseModelCopyWith<_HealthDatabaseModel> get copyWith => __$HealthDatabaseModelCopyWithImpl<_HealthDatabaseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthDatabaseModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthDatabaseModel&&(identical(other.ok, ok) || other.ok == ok));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,ok);
}

@override
String toString() {
    return 'HealthDatabaseModel(ok: $ok)';
}


}

/// @nodoc
abstract mixin class _$HealthDatabaseModelCopyWith<$Res> implements $HealthDatabaseModelCopyWith<$Res> {
  factory _$HealthDatabaseModelCopyWith(_HealthDatabaseModel value, $Res Function(_HealthDatabaseModel) _then) = __$HealthDatabaseModelCopyWithImpl;
@override @useResult
$Res call({
 bool ok
});




}
/// @nodoc
class __$HealthDatabaseModelCopyWithImpl<$Res>
    implements _$HealthDatabaseModelCopyWith<$Res> {
  __$HealthDatabaseModelCopyWithImpl(this._self, this._then);

  final _HealthDatabaseModel _self;
  final $Res Function(_HealthDatabaseModel) _then;

/// Create a copy of HealthDatabaseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ok = null,}) {
  return _then(_HealthDatabaseModel(
ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$HealthFcmModel {

 bool get configured; String? get error;
/// Create a copy of HealthFcmModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthFcmModelCopyWith<HealthFcmModel> get copyWith => _$HealthFcmModelCopyWithImpl<HealthFcmModel>(this as HealthFcmModel, _$identity);

  /// Serializes this HealthFcmModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HealthFcmModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthFcmModel&&(identical(other.configured, _this.configured) || other.configured == _this.configured)&&(identical(other.error, _this.error) || other.error == _this.error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HealthFcmModel;
  return Object.hash(runtimeType,_this.configured,_this.error);
}

@override
String toString() {
  final _this = this as HealthFcmModel;
  return 'HealthFcmModel(configured: ${_this.configured}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $HealthFcmModelCopyWith<$Res>  {
  factory $HealthFcmModelCopyWith(HealthFcmModel value, $Res Function(HealthFcmModel) _then) = _$HealthFcmModelCopyWithImpl;
@useResult
$Res call({
 bool configured, String? error
});




}
/// @nodoc
class _$HealthFcmModelCopyWithImpl<$Res>
    implements $HealthFcmModelCopyWith<$Res> {
  _$HealthFcmModelCopyWithImpl(this._self, this._then);

  final HealthFcmModel _self;
  final $Res Function(HealthFcmModel) _then;

/// Create a copy of HealthFcmModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? configured = null,Object? error = freezed,}) {
  return _then(HealthFcmModel(
configured: null == configured ? _self.configured : configured // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthFcmModel].
extension HealthFcmModelPatterns on HealthFcmModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthFcmModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthFcmModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthFcmModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthFcmModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthFcmModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthFcmModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool configured,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthFcmModel() when $default != null:
return $default(_that.configured,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool configured,  String? error)  $default,) {final _that = this;
switch (_that) {
case _HealthFcmModel():
return $default(_that.configured,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool configured,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _HealthFcmModel() when $default != null:
return $default(_that.configured,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthFcmModel implements HealthFcmModel {
  const _HealthFcmModel({this.configured = false, this.error});
  factory _HealthFcmModel.fromJson(Map<String, dynamic> json) => _$HealthFcmModelFromJson(json);

@override@JsonKey() final  bool configured;
@override final  String? error;

/// Create a copy of HealthFcmModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthFcmModelCopyWith<_HealthFcmModel> get copyWith => __$HealthFcmModelCopyWithImpl<_HealthFcmModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthFcmModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthFcmModel&&(identical(other.configured, configured) || other.configured == configured)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,configured,error);
}

@override
String toString() {
    return 'HealthFcmModel(configured: $configured, error: $error)';
}


}

/// @nodoc
abstract mixin class _$HealthFcmModelCopyWith<$Res> implements $HealthFcmModelCopyWith<$Res> {
  factory _$HealthFcmModelCopyWith(_HealthFcmModel value, $Res Function(_HealthFcmModel) _then) = __$HealthFcmModelCopyWithImpl;
@override @useResult
$Res call({
 bool configured, String? error
});




}
/// @nodoc
class __$HealthFcmModelCopyWithImpl<$Res>
    implements _$HealthFcmModelCopyWith<$Res> {
  __$HealthFcmModelCopyWithImpl(this._self, this._then);

  final _HealthFcmModel _self;
  final $Res Function(_HealthFcmModel) _then;

/// Create a copy of HealthFcmModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? configured = null,Object? error = freezed,}) {
  return _then(_HealthFcmModel(
configured: null == configured ? _self.configured : configured // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$HealthDevicesModel {

 int get active;
/// Create a copy of HealthDevicesModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthDevicesModelCopyWith<HealthDevicesModel> get copyWith => _$HealthDevicesModelCopyWithImpl<HealthDevicesModel>(this as HealthDevicesModel, _$identity);

  /// Serializes this HealthDevicesModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HealthDevicesModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthDevicesModel&&(identical(other.active, _this.active) || other.active == _this.active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HealthDevicesModel;
  return Object.hash(runtimeType,_this.active);
}

@override
String toString() {
  final _this = this as HealthDevicesModel;
  return 'HealthDevicesModel(active: ${_this.active})';
}


}

/// @nodoc
abstract mixin class $HealthDevicesModelCopyWith<$Res>  {
  factory $HealthDevicesModelCopyWith(HealthDevicesModel value, $Res Function(HealthDevicesModel) _then) = _$HealthDevicesModelCopyWithImpl;
@useResult
$Res call({
 int active
});




}
/// @nodoc
class _$HealthDevicesModelCopyWithImpl<$Res>
    implements $HealthDevicesModelCopyWith<$Res> {
  _$HealthDevicesModelCopyWithImpl(this._self, this._then);

  final HealthDevicesModel _self;
  final $Res Function(HealthDevicesModel) _then;

/// Create a copy of HealthDevicesModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? active = null,}) {
  return _then(HealthDevicesModel(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthDevicesModel].
extension HealthDevicesModelPatterns on HealthDevicesModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthDevicesModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthDevicesModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthDevicesModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthDevicesModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthDevicesModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthDevicesModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int active)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthDevicesModel() when $default != null:
return $default(_that.active);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int active)  $default,) {final _that = this;
switch (_that) {
case _HealthDevicesModel():
return $default(_that.active);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int active)?  $default,) {final _that = this;
switch (_that) {
case _HealthDevicesModel() when $default != null:
return $default(_that.active);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthDevicesModel implements HealthDevicesModel {
  const _HealthDevicesModel({this.active = 0});
  factory _HealthDevicesModel.fromJson(Map<String, dynamic> json) => _$HealthDevicesModelFromJson(json);

@override@JsonKey() final  int active;

/// Create a copy of HealthDevicesModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthDevicesModelCopyWith<_HealthDevicesModel> get copyWith => __$HealthDevicesModelCopyWithImpl<_HealthDevicesModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthDevicesModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthDevicesModel&&(identical(other.active, active) || other.active == active));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,active);
}

@override
String toString() {
    return 'HealthDevicesModel(active: $active)';
}


}

/// @nodoc
abstract mixin class _$HealthDevicesModelCopyWith<$Res> implements $HealthDevicesModelCopyWith<$Res> {
  factory _$HealthDevicesModelCopyWith(_HealthDevicesModel value, $Res Function(_HealthDevicesModel) _then) = __$HealthDevicesModelCopyWithImpl;
@override @useResult
$Res call({
 int active
});




}
/// @nodoc
class __$HealthDevicesModelCopyWithImpl<$Res>
    implements _$HealthDevicesModelCopyWith<$Res> {
  __$HealthDevicesModelCopyWithImpl(this._self, this._then);

  final _HealthDevicesModel _self;
  final $Res Function(_HealthDevicesModel) _then;

/// Create a copy of HealthDevicesModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? active = null,}) {
  return _then(_HealthDevicesModel(
active: null == active ? _self.active : active // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$HealthLastPollModel {

 String? get status; String? get at; String? get finishedAt; String? get error;
/// Create a copy of HealthLastPollModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthLastPollModelCopyWith<HealthLastPollModel> get copyWith => _$HealthLastPollModelCopyWithImpl<HealthLastPollModel>(this as HealthLastPollModel, _$identity);

  /// Serializes this HealthLastPollModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HealthLastPollModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthLastPollModel&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.finishedAt, _this.finishedAt) || other.finishedAt == _this.finishedAt)&&(identical(other.error, _this.error) || other.error == _this.error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HealthLastPollModel;
  return Object.hash(runtimeType,_this.status,_this.at,_this.finishedAt,_this.error);
}

@override
String toString() {
  final _this = this as HealthLastPollModel;
  return 'HealthLastPollModel(status: ${_this.status}, at: ${_this.at}, finishedAt: ${_this.finishedAt}, error: ${_this.error})';
}


}

/// @nodoc
abstract mixin class $HealthLastPollModelCopyWith<$Res>  {
  factory $HealthLastPollModelCopyWith(HealthLastPollModel value, $Res Function(HealthLastPollModel) _then) = _$HealthLastPollModelCopyWithImpl;
@useResult
$Res call({
 String? status, String? at, String? finishedAt, String? error
});




}
/// @nodoc
class _$HealthLastPollModelCopyWithImpl<$Res>
    implements $HealthLastPollModelCopyWith<$Res> {
  _$HealthLastPollModelCopyWithImpl(this._self, this._then);

  final HealthLastPollModel _self;
  final $Res Function(HealthLastPollModel) _then;

/// Create a copy of HealthLastPollModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? at = freezed,Object? finishedAt = freezed,Object? error = freezed,}) {
  return _then(HealthLastPollModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [HealthLastPollModel].
extension HealthLastPollModelPatterns on HealthLastPollModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthLastPollModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthLastPollModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthLastPollModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthLastPollModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthLastPollModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthLastPollModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? status,  String? at,  String? finishedAt,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthLastPollModel() when $default != null:
return $default(_that.status,_that.at,_that.finishedAt,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? status,  String? at,  String? finishedAt,  String? error)  $default,) {final _that = this;
switch (_that) {
case _HealthLastPollModel():
return $default(_that.status,_that.at,_that.finishedAt,_that.error);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? status,  String? at,  String? finishedAt,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _HealthLastPollModel() when $default != null:
return $default(_that.status,_that.at,_that.finishedAt,_that.error);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthLastPollModel implements HealthLastPollModel {
  const _HealthLastPollModel({this.status, this.at, this.finishedAt, this.error});
  factory _HealthLastPollModel.fromJson(Map<String, dynamic> json) => _$HealthLastPollModelFromJson(json);

@override final  String? status;
@override final  String? at;
@override final  String? finishedAt;
@override final  String? error;

/// Create a copy of HealthLastPollModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthLastPollModelCopyWith<_HealthLastPollModel> get copyWith => __$HealthLastPollModelCopyWithImpl<_HealthLastPollModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthLastPollModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthLastPollModel&&(identical(other.status, status) || other.status == status)&&(identical(other.at, at) || other.at == at)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt)&&(identical(other.error, error) || other.error == error));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,at,finishedAt,error);
}

@override
String toString() {
    return 'HealthLastPollModel(status: $status, at: $at, finishedAt: $finishedAt, error: $error)';
}


}

/// @nodoc
abstract mixin class _$HealthLastPollModelCopyWith<$Res> implements $HealthLastPollModelCopyWith<$Res> {
  factory _$HealthLastPollModelCopyWith(_HealthLastPollModel value, $Res Function(_HealthLastPollModel) _then) = __$HealthLastPollModelCopyWithImpl;
@override @useResult
$Res call({
 String? status, String? at, String? finishedAt, String? error
});




}
/// @nodoc
class __$HealthLastPollModelCopyWithImpl<$Res>
    implements _$HealthLastPollModelCopyWith<$Res> {
  __$HealthLastPollModelCopyWithImpl(this._self, this._then);

  final _HealthLastPollModel _self;
  final $Res Function(_HealthLastPollModel) _then;

/// Create a copy of HealthLastPollModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? at = freezed,Object? finishedAt = freezed,Object? error = freezed,}) {
  return _then(_HealthLastPollModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as String?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$HealthRateModel {

 String get baseCurrency; List<String> get quotes; String get pollCron; HealthLastPollModel? get lastPoll;
/// Create a copy of HealthRateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthRateModelCopyWith<HealthRateModel> get copyWith => _$HealthRateModelCopyWithImpl<HealthRateModel>(this as HealthRateModel, _$identity);

  /// Serializes this HealthRateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HealthRateModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthRateModel&&(identical(other.baseCurrency, _this.baseCurrency) || other.baseCurrency == _this.baseCurrency)&&const DeepCollectionEquality().equals(other.quotes, _this.quotes)&&(identical(other.pollCron, _this.pollCron) || other.pollCron == _this.pollCron)&&(identical(other.lastPoll, _this.lastPoll) || other.lastPoll == _this.lastPoll));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HealthRateModel;
  return Object.hash(runtimeType,_this.baseCurrency,const DeepCollectionEquality().hash(_this.quotes),_this.pollCron,_this.lastPoll);
}

@override
String toString() {
  final _this = this as HealthRateModel;
  return 'HealthRateModel(baseCurrency: ${_this.baseCurrency}, quotes: ${_this.quotes}, pollCron: ${_this.pollCron}, lastPoll: ${_this.lastPoll})';
}


}

/// @nodoc
abstract mixin class $HealthRateModelCopyWith<$Res>  {
  factory $HealthRateModelCopyWith(HealthRateModel value, $Res Function(HealthRateModel) _then) = _$HealthRateModelCopyWithImpl;
@useResult
$Res call({
 String baseCurrency, List<String> quotes, String pollCron, HealthLastPollModel? lastPoll
});


$HealthLastPollModelCopyWith<$Res>? get lastPoll;

}
/// @nodoc
class _$HealthRateModelCopyWithImpl<$Res>
    implements $HealthRateModelCopyWith<$Res> {
  _$HealthRateModelCopyWithImpl(this._self, this._then);

  final HealthRateModel _self;
  final $Res Function(HealthRateModel) _then;

/// Create a copy of HealthRateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? baseCurrency = null,Object? quotes = null,Object? pollCron = null,Object? lastPoll = freezed,}) {
  return _then(HealthRateModel(
baseCurrency: null == baseCurrency ? _self.baseCurrency : baseCurrency // ignore: cast_nullable_to_non_nullable
as String,quotes: null == quotes ? _self.quotes : quotes // ignore: cast_nullable_to_non_nullable
as List<String>,pollCron: null == pollCron ? _self.pollCron : pollCron // ignore: cast_nullable_to_non_nullable
as String,lastPoll: freezed == lastPoll ? _self.lastPoll : lastPoll // ignore: cast_nullable_to_non_nullable
as HealthLastPollModel?,
  ));
}
/// Create a copy of HealthRateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthLastPollModelCopyWith<$Res>? get lastPoll {
    if (_self.lastPoll == null) {
    return null;
  }

  return $HealthLastPollModelCopyWith<$Res>(_self.lastPoll!, (value) {
    return _then(_self.copyWith(lastPoll: value));
  });
}
}


/// Adds pattern-matching-related methods to [HealthRateModel].
extension HealthRateModelPatterns on HealthRateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthRateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthRateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthRateModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthRateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthRateModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthRateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String baseCurrency,  List<String> quotes,  String pollCron,  HealthLastPollModel? lastPoll)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthRateModel() when $default != null:
return $default(_that.baseCurrency,_that.quotes,_that.pollCron,_that.lastPoll);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String baseCurrency,  List<String> quotes,  String pollCron,  HealthLastPollModel? lastPoll)  $default,) {final _that = this;
switch (_that) {
case _HealthRateModel():
return $default(_that.baseCurrency,_that.quotes,_that.pollCron,_that.lastPoll);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String baseCurrency,  List<String> quotes,  String pollCron,  HealthLastPollModel? lastPoll)?  $default,) {final _that = this;
switch (_that) {
case _HealthRateModel() when $default != null:
return $default(_that.baseCurrency,_that.quotes,_that.pollCron,_that.lastPoll);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthRateModel implements HealthRateModel {
  const _HealthRateModel({this.baseCurrency = 'USD',  List<String> quotes = const <String>[], this.pollCron = '* * * * *', this.lastPoll}): _quotes = quotes;
  factory _HealthRateModel.fromJson(Map<String, dynamic> json) => _$HealthRateModelFromJson(json);

@override@JsonKey() final  String baseCurrency;
 final  List<String> _quotes;
@override@JsonKey() List<String> get quotes {
  if (_quotes is EqualUnmodifiableListView) return _quotes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_quotes);
}

@override@JsonKey() final  String pollCron;
@override final  HealthLastPollModel? lastPoll;

/// Create a copy of HealthRateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthRateModelCopyWith<_HealthRateModel> get copyWith => __$HealthRateModelCopyWithImpl<_HealthRateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthRateModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthRateModel&&(identical(other.baseCurrency, baseCurrency) || other.baseCurrency == baseCurrency)&&const DeepCollectionEquality().equals(other.quotes, _quotes)&&(identical(other.pollCron, pollCron) || other.pollCron == pollCron)&&(identical(other.lastPoll, lastPoll) || other.lastPoll == lastPoll));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,baseCurrency,const DeepCollectionEquality().hash(_quotes),pollCron,lastPoll);
}

@override
String toString() {
    return 'HealthRateModel(baseCurrency: $baseCurrency, quotes: $quotes, pollCron: $pollCron, lastPoll: $lastPoll)';
}


}

/// @nodoc
abstract mixin class _$HealthRateModelCopyWith<$Res> implements $HealthRateModelCopyWith<$Res> {
  factory _$HealthRateModelCopyWith(_HealthRateModel value, $Res Function(_HealthRateModel) _then) = __$HealthRateModelCopyWithImpl;
@override @useResult
$Res call({
 String baseCurrency, List<String> quotes, String pollCron, HealthLastPollModel? lastPoll
});


@override $HealthLastPollModelCopyWith<$Res>? get lastPoll;

}
/// @nodoc
class __$HealthRateModelCopyWithImpl<$Res>
    implements _$HealthRateModelCopyWith<$Res> {
  __$HealthRateModelCopyWithImpl(this._self, this._then);

  final _HealthRateModel _self;
  final $Res Function(_HealthRateModel) _then;

/// Create a copy of HealthRateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? baseCurrency = null,Object? quotes = null,Object? pollCron = null,Object? lastPoll = freezed,}) {
  return _then(_HealthRateModel(
baseCurrency: null == baseCurrency ? _self.baseCurrency : baseCurrency // ignore: cast_nullable_to_non_nullable
as String,quotes: null == quotes ? _self._quotes : quotes // ignore: cast_nullable_to_non_nullable
as List<String>,pollCron: null == pollCron ? _self.pollCron : pollCron // ignore: cast_nullable_to_non_nullable
as String,lastPoll: freezed == lastPoll ? _self.lastPoll : lastPoll // ignore: cast_nullable_to_non_nullable
as HealthLastPollModel?,
  ));
}

/// Create a copy of HealthRateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthLastPollModelCopyWith<$Res>? get lastPoll {
    if (_self.lastPoll == null) {
    return null;
  }

  return $HealthLastPollModelCopyWith<$Res>(_self.lastPoll!, (value) {
    return _then(_self.copyWith(lastPoll: value));
  });
}
}


/// @nodoc
mixin _$HealthModel {

 String get status; HealthDatabaseModel get database; HealthFcmModel get fcm; HealthDevicesModel get devices; HealthRateModel get rate;
/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HealthModelCopyWith<HealthModel> get copyWith => _$HealthModelCopyWithImpl<HealthModel>(this as HealthModel, _$identity);

  /// Serializes this HealthModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as HealthModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HealthModel&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.database, _this.database) || other.database == _this.database)&&(identical(other.fcm, _this.fcm) || other.fcm == _this.fcm)&&(identical(other.devices, _this.devices) || other.devices == _this.devices)&&(identical(other.rate, _this.rate) || other.rate == _this.rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as HealthModel;
  return Object.hash(runtimeType,_this.status,_this.database,_this.fcm,_this.devices,_this.rate);
}

@override
String toString() {
  final _this = this as HealthModel;
  return 'HealthModel(status: ${_this.status}, database: ${_this.database}, fcm: ${_this.fcm}, devices: ${_this.devices}, rate: ${_this.rate})';
}


}

/// @nodoc
abstract mixin class $HealthModelCopyWith<$Res>  {
  factory $HealthModelCopyWith(HealthModel value, $Res Function(HealthModel) _then) = _$HealthModelCopyWithImpl;
@useResult
$Res call({
 String status, HealthDatabaseModel database, HealthFcmModel fcm, HealthDevicesModel devices, HealthRateModel rate
});


$HealthDatabaseModelCopyWith<$Res> get database;$HealthFcmModelCopyWith<$Res> get fcm;$HealthDevicesModelCopyWith<$Res> get devices;$HealthRateModelCopyWith<$Res> get rate;

}
/// @nodoc
class _$HealthModelCopyWithImpl<$Res>
    implements $HealthModelCopyWith<$Res> {
  _$HealthModelCopyWithImpl(this._self, this._then);

  final HealthModel _self;
  final $Res Function(HealthModel) _then;

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? database = null,Object? fcm = null,Object? devices = null,Object? rate = null,}) {
  return _then(HealthModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,database: null == database ? _self.database : database // ignore: cast_nullable_to_non_nullable
as HealthDatabaseModel,fcm: null == fcm ? _self.fcm : fcm // ignore: cast_nullable_to_non_nullable
as HealthFcmModel,devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as HealthDevicesModel,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as HealthRateModel,
  ));
}
/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthDatabaseModelCopyWith<$Res> get database {
  
  return $HealthDatabaseModelCopyWith<$Res>(_self.database, (value) {
    return _then(_self.copyWith(database: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthFcmModelCopyWith<$Res> get fcm {
  
  return $HealthFcmModelCopyWith<$Res>(_self.fcm, (value) {
    return _then(_self.copyWith(fcm: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthDevicesModelCopyWith<$Res> get devices {
  
  return $HealthDevicesModelCopyWith<$Res>(_self.devices, (value) {
    return _then(_self.copyWith(devices: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthRateModelCopyWith<$Res> get rate {
  
  return $HealthRateModelCopyWith<$Res>(_self.rate, (value) {
    return _then(_self.copyWith(rate: value));
  });
}
}


/// Adds pattern-matching-related methods to [HealthModel].
extension HealthModelPatterns on HealthModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HealthModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HealthModel value)  $default,){
final _that = this;
switch (_that) {
case _HealthModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HealthModel value)?  $default,){
final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String status,  HealthDatabaseModel database,  HealthFcmModel fcm,  HealthDevicesModel devices,  HealthRateModel rate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
return $default(_that.status,_that.database,_that.fcm,_that.devices,_that.rate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String status,  HealthDatabaseModel database,  HealthFcmModel fcm,  HealthDevicesModel devices,  HealthRateModel rate)  $default,) {final _that = this;
switch (_that) {
case _HealthModel():
return $default(_that.status,_that.database,_that.fcm,_that.devices,_that.rate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String status,  HealthDatabaseModel database,  HealthFcmModel fcm,  HealthDevicesModel devices,  HealthRateModel rate)?  $default,) {final _that = this;
switch (_that) {
case _HealthModel() when $default != null:
return $default(_that.status,_that.database,_that.fcm,_that.devices,_that.rate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _HealthModel implements HealthModel {
  const _HealthModel({required this.status, required this.database, required this.fcm, required this.devices, required this.rate});
  factory _HealthModel.fromJson(Map<String, dynamic> json) => _$HealthModelFromJson(json);

@override final  String status;
@override final  HealthDatabaseModel database;
@override final  HealthFcmModel fcm;
@override final  HealthDevicesModel devices;
@override final  HealthRateModel rate;

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HealthModelCopyWith<_HealthModel> get copyWith => __$HealthModelCopyWithImpl<_HealthModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HealthModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _HealthModel&&(identical(other.status, status) || other.status == status)&&(identical(other.database, database) || other.database == database)&&(identical(other.fcm, fcm) || other.fcm == fcm)&&(identical(other.devices, devices) || other.devices == devices)&&(identical(other.rate, rate) || other.rate == rate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,database,fcm,devices,rate);
}

@override
String toString() {
    return 'HealthModel(status: $status, database: $database, fcm: $fcm, devices: $devices, rate: $rate)';
}


}

/// @nodoc
abstract mixin class _$HealthModelCopyWith<$Res> implements $HealthModelCopyWith<$Res> {
  factory _$HealthModelCopyWith(_HealthModel value, $Res Function(_HealthModel) _then) = __$HealthModelCopyWithImpl;
@override @useResult
$Res call({
 String status, HealthDatabaseModel database, HealthFcmModel fcm, HealthDevicesModel devices, HealthRateModel rate
});


@override $HealthDatabaseModelCopyWith<$Res> get database;@override $HealthFcmModelCopyWith<$Res> get fcm;@override $HealthDevicesModelCopyWith<$Res> get devices;@override $HealthRateModelCopyWith<$Res> get rate;

}
/// @nodoc
class __$HealthModelCopyWithImpl<$Res>
    implements _$HealthModelCopyWith<$Res> {
  __$HealthModelCopyWithImpl(this._self, this._then);

  final _HealthModel _self;
  final $Res Function(_HealthModel) _then;

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? database = null,Object? fcm = null,Object? devices = null,Object? rate = null,}) {
  return _then(_HealthModel(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,database: null == database ? _self.database : database // ignore: cast_nullable_to_non_nullable
as HealthDatabaseModel,fcm: null == fcm ? _self.fcm : fcm // ignore: cast_nullable_to_non_nullable
as HealthFcmModel,devices: null == devices ? _self.devices : devices // ignore: cast_nullable_to_non_nullable
as HealthDevicesModel,rate: null == rate ? _self.rate : rate // ignore: cast_nullable_to_non_nullable
as HealthRateModel,
  ));
}

/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthDatabaseModelCopyWith<$Res> get database {
  
  return $HealthDatabaseModelCopyWith<$Res>(_self.database, (value) {
    return _then(_self.copyWith(database: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthFcmModelCopyWith<$Res> get fcm {
  
  return $HealthFcmModelCopyWith<$Res>(_self.fcm, (value) {
    return _then(_self.copyWith(fcm: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthDevicesModelCopyWith<$Res> get devices {
  
  return $HealthDevicesModelCopyWith<$Res>(_self.devices, (value) {
    return _then(_self.copyWith(devices: value));
  });
}/// Create a copy of HealthModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HealthRateModelCopyWith<$Res> get rate {
  
  return $HealthRateModelCopyWith<$Res>(_self.rate, (value) {
    return _then(_self.copyWith(rate: value));
  });
}
}


/// @nodoc
mixin _$DeviceModel {

 int get id; String get platform; String get quote; bool get enabled; String get tokenPreview; String get registeredAt; String get updatedAt;
/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceModelCopyWith<DeviceModel> get copyWith => _$DeviceModelCopyWithImpl<DeviceModel>(this as DeviceModel, _$identity);

  /// Serializes this DeviceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DeviceModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.platform, _this.platform) || other.platform == _this.platform)&&(identical(other.quote, _this.quote) || other.quote == _this.quote)&&(identical(other.enabled, _this.enabled) || other.enabled == _this.enabled)&&(identical(other.tokenPreview, _this.tokenPreview) || other.tokenPreview == _this.tokenPreview)&&(identical(other.registeredAt, _this.registeredAt) || other.registeredAt == _this.registeredAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DeviceModel;
  return Object.hash(runtimeType,_this.id,_this.platform,_this.quote,_this.enabled,_this.tokenPreview,_this.registeredAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as DeviceModel;
  return 'DeviceModel(id: ${_this.id}, platform: ${_this.platform}, quote: ${_this.quote}, enabled: ${_this.enabled}, tokenPreview: ${_this.tokenPreview}, registeredAt: ${_this.registeredAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $DeviceModelCopyWith<$Res>  {
  factory $DeviceModelCopyWith(DeviceModel value, $Res Function(DeviceModel) _then) = _$DeviceModelCopyWithImpl;
@useResult
$Res call({
 int id, String platform, String quote, bool enabled, String tokenPreview, String registeredAt, String updatedAt
});




}
/// @nodoc
class _$DeviceModelCopyWithImpl<$Res>
    implements $DeviceModelCopyWith<$Res> {
  _$DeviceModelCopyWithImpl(this._self, this._then);

  final DeviceModel _self;
  final $Res Function(DeviceModel) _then;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? platform = null,Object? quote = null,Object? enabled = null,Object? tokenPreview = null,Object? registeredAt = null,Object? updatedAt = null,}) {
  return _then(DeviceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,tokenPreview: null == tokenPreview ? _self.tokenPreview : tokenPreview // ignore: cast_nullable_to_non_nullable
as String,registeredAt: null == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceModel].
extension DeviceModelPatterns on DeviceModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceModel value)  $default,){
final _that = this;
switch (_that) {
case _DeviceModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceModel value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String platform,  String quote,  bool enabled,  String tokenPreview,  String registeredAt,  String updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that.id,_that.platform,_that.quote,_that.enabled,_that.tokenPreview,_that.registeredAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String platform,  String quote,  bool enabled,  String tokenPreview,  String registeredAt,  String updatedAt)  $default,) {final _that = this;
switch (_that) {
case _DeviceModel():
return $default(_that.id,_that.platform,_that.quote,_that.enabled,_that.tokenPreview,_that.registeredAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String platform,  String quote,  bool enabled,  String tokenPreview,  String registeredAt,  String updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _DeviceModel() when $default != null:
return $default(_that.id,_that.platform,_that.quote,_that.enabled,_that.tokenPreview,_that.registeredAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceModel implements DeviceModel {
  const _DeviceModel({required this.id, required this.platform, required this.quote, required this.enabled, required this.tokenPreview, required this.registeredAt, required this.updatedAt});
  factory _DeviceModel.fromJson(Map<String, dynamic> json) => _$DeviceModelFromJson(json);

@override final  int id;
@override final  String platform;
@override final  String quote;
@override final  bool enabled;
@override final  String tokenPreview;
@override final  String registeredAt;
@override final  String updatedAt;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceModelCopyWith<_DeviceModel> get copyWith => __$DeviceModelCopyWithImpl<_DeviceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceModel&&(identical(other.id, id) || other.id == id)&&(identical(other.platform, platform) || other.platform == platform)&&(identical(other.quote, quote) || other.quote == quote)&&(identical(other.enabled, enabled) || other.enabled == enabled)&&(identical(other.tokenPreview, tokenPreview) || other.tokenPreview == tokenPreview)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,platform,quote,enabled,tokenPreview,registeredAt,updatedAt);
}

@override
String toString() {
    return 'DeviceModel(id: $id, platform: $platform, quote: $quote, enabled: $enabled, tokenPreview: $tokenPreview, registeredAt: $registeredAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$DeviceModelCopyWith<$Res> implements $DeviceModelCopyWith<$Res> {
  factory _$DeviceModelCopyWith(_DeviceModel value, $Res Function(_DeviceModel) _then) = __$DeviceModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String platform, String quote, bool enabled, String tokenPreview, String registeredAt, String updatedAt
});




}
/// @nodoc
class __$DeviceModelCopyWithImpl<$Res>
    implements _$DeviceModelCopyWith<$Res> {
  __$DeviceModelCopyWithImpl(this._self, this._then);

  final _DeviceModel _self;
  final $Res Function(_DeviceModel) _then;

/// Create a copy of DeviceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? platform = null,Object? quote = null,Object? enabled = null,Object? tokenPreview = null,Object? registeredAt = null,Object? updatedAt = null,}) {
  return _then(_DeviceModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,platform: null == platform ? _self.platform : platform // ignore: cast_nullable_to_non_nullable
as String,quote: null == quote ? _self.quote : quote // ignore: cast_nullable_to_non_nullable
as String,enabled: null == enabled ? _self.enabled : enabled // ignore: cast_nullable_to_non_nullable
as bool,tokenPreview: null == tokenPreview ? _self.tokenPreview : tokenPreview // ignore: cast_nullable_to_non_nullable
as String,registeredAt: null == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as String,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TestPushResultModel {

 int get requested; int get deviceCount; int get successCount; int get failureCount; bool get skipped; String? get skippedReason;
/// Create a copy of TestPushResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TestPushResultModelCopyWith<TestPushResultModel> get copyWith => _$TestPushResultModelCopyWithImpl<TestPushResultModel>(this as TestPushResultModel, _$identity);

  /// Serializes this TestPushResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TestPushResultModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TestPushResultModel&&(identical(other.requested, _this.requested) || other.requested == _this.requested)&&(identical(other.deviceCount, _this.deviceCount) || other.deviceCount == _this.deviceCount)&&(identical(other.successCount, _this.successCount) || other.successCount == _this.successCount)&&(identical(other.failureCount, _this.failureCount) || other.failureCount == _this.failureCount)&&(identical(other.skipped, _this.skipped) || other.skipped == _this.skipped)&&(identical(other.skippedReason, _this.skippedReason) || other.skippedReason == _this.skippedReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TestPushResultModel;
  return Object.hash(runtimeType,_this.requested,_this.deviceCount,_this.successCount,_this.failureCount,_this.skipped,_this.skippedReason);
}

@override
String toString() {
  final _this = this as TestPushResultModel;
  return 'TestPushResultModel(requested: ${_this.requested}, deviceCount: ${_this.deviceCount}, successCount: ${_this.successCount}, failureCount: ${_this.failureCount}, skipped: ${_this.skipped}, skippedReason: ${_this.skippedReason})';
}


}

/// @nodoc
abstract mixin class $TestPushResultModelCopyWith<$Res>  {
  factory $TestPushResultModelCopyWith(TestPushResultModel value, $Res Function(TestPushResultModel) _then) = _$TestPushResultModelCopyWithImpl;
@useResult
$Res call({
 int requested, int deviceCount, int successCount, int failureCount, bool skipped, String? skippedReason
});




}
/// @nodoc
class _$TestPushResultModelCopyWithImpl<$Res>
    implements $TestPushResultModelCopyWith<$Res> {
  _$TestPushResultModelCopyWithImpl(this._self, this._then);

  final TestPushResultModel _self;
  final $Res Function(TestPushResultModel) _then;

/// Create a copy of TestPushResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? requested = null,Object? deviceCount = null,Object? successCount = null,Object? failureCount = null,Object? skipped = null,Object? skippedReason = freezed,}) {
  return _then(TestPushResultModel(
requested: null == requested ? _self.requested : requested // ignore: cast_nullable_to_non_nullable
as int,deviceCount: null == deviceCount ? _self.deviceCount : deviceCount // ignore: cast_nullable_to_non_nullable
as int,successCount: null == successCount ? _self.successCount : successCount // ignore: cast_nullable_to_non_nullable
as int,failureCount: null == failureCount ? _self.failureCount : failureCount // ignore: cast_nullable_to_non_nullable
as int,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as bool,skippedReason: freezed == skippedReason ? _self.skippedReason : skippedReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TestPushResultModel].
extension TestPushResultModelPatterns on TestPushResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TestPushResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TestPushResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TestPushResultModel value)  $default,){
final _that = this;
switch (_that) {
case _TestPushResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TestPushResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _TestPushResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int requested,  int deviceCount,  int successCount,  int failureCount,  bool skipped,  String? skippedReason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TestPushResultModel() when $default != null:
return $default(_that.requested,_that.deviceCount,_that.successCount,_that.failureCount,_that.skipped,_that.skippedReason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int requested,  int deviceCount,  int successCount,  int failureCount,  bool skipped,  String? skippedReason)  $default,) {final _that = this;
switch (_that) {
case _TestPushResultModel():
return $default(_that.requested,_that.deviceCount,_that.successCount,_that.failureCount,_that.skipped,_that.skippedReason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int requested,  int deviceCount,  int successCount,  int failureCount,  bool skipped,  String? skippedReason)?  $default,) {final _that = this;
switch (_that) {
case _TestPushResultModel() when $default != null:
return $default(_that.requested,_that.deviceCount,_that.successCount,_that.failureCount,_that.skipped,_that.skippedReason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TestPushResultModel implements TestPushResultModel {
  const _TestPushResultModel({this.requested = 0, this.deviceCount = 0, this.successCount = 0, this.failureCount = 0, this.skipped = false, this.skippedReason});
  factory _TestPushResultModel.fromJson(Map<String, dynamic> json) => _$TestPushResultModelFromJson(json);

@override@JsonKey() final  int requested;
@override@JsonKey() final  int deviceCount;
@override@JsonKey() final  int successCount;
@override@JsonKey() final  int failureCount;
@override@JsonKey() final  bool skipped;
@override final  String? skippedReason;

/// Create a copy of TestPushResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TestPushResultModelCopyWith<_TestPushResultModel> get copyWith => __$TestPushResultModelCopyWithImpl<_TestPushResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TestPushResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TestPushResultModel&&(identical(other.requested, requested) || other.requested == requested)&&(identical(other.deviceCount, deviceCount) || other.deviceCount == deviceCount)&&(identical(other.successCount, successCount) || other.successCount == successCount)&&(identical(other.failureCount, failureCount) || other.failureCount == failureCount)&&(identical(other.skipped, skipped) || other.skipped == skipped)&&(identical(other.skippedReason, skippedReason) || other.skippedReason == skippedReason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,requested,deviceCount,successCount,failureCount,skipped,skippedReason);
}

@override
String toString() {
    return 'TestPushResultModel(requested: $requested, deviceCount: $deviceCount, successCount: $successCount, failureCount: $failureCount, skipped: $skipped, skippedReason: $skippedReason)';
}


}

/// @nodoc
abstract mixin class _$TestPushResultModelCopyWith<$Res> implements $TestPushResultModelCopyWith<$Res> {
  factory _$TestPushResultModelCopyWith(_TestPushResultModel value, $Res Function(_TestPushResultModel) _then) = __$TestPushResultModelCopyWithImpl;
@override @useResult
$Res call({
 int requested, int deviceCount, int successCount, int failureCount, bool skipped, String? skippedReason
});




}
/// @nodoc
class __$TestPushResultModelCopyWithImpl<$Res>
    implements _$TestPushResultModelCopyWith<$Res> {
  __$TestPushResultModelCopyWithImpl(this._self, this._then);

  final _TestPushResultModel _self;
  final $Res Function(_TestPushResultModel) _then;

/// Create a copy of TestPushResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? requested = null,Object? deviceCount = null,Object? successCount = null,Object? failureCount = null,Object? skipped = null,Object? skippedReason = freezed,}) {
  return _then(_TestPushResultModel(
requested: null == requested ? _self.requested : requested // ignore: cast_nullable_to_non_nullable
as int,deviceCount: null == deviceCount ? _self.deviceCount : deviceCount // ignore: cast_nullable_to_non_nullable
as int,successCount: null == successCount ? _self.successCount : successCount // ignore: cast_nullable_to_non_nullable
as int,failureCount: null == failureCount ? _self.failureCount : failureCount // ignore: cast_nullable_to_non_nullable
as int,skipped: null == skipped ? _self.skipped : skipped // ignore: cast_nullable_to_non_nullable
as bool,skippedReason: freezed == skippedReason ? _self.skippedReason : skippedReason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
