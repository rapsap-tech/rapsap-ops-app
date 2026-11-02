// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'capture_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CaptureSessionModel {

 String get token; DateTime get serverTime; String get storeCode; String get storeName; String get staffName; int get taskNumber;
/// Create a copy of CaptureSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaptureSessionModelCopyWith<CaptureSessionModel> get copyWith => _$CaptureSessionModelCopyWithImpl<CaptureSessionModel>(this as CaptureSessionModel, _$identity);

  /// Serializes this CaptureSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as CaptureSessionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaptureSessionModel&&(identical(other.token, _this.token) || other.token == _this.token)&&(identical(other.serverTime, _this.serverTime) || other.serverTime == _this.serverTime)&&(identical(other.storeCode, _this.storeCode) || other.storeCode == _this.storeCode)&&(identical(other.storeName, _this.storeName) || other.storeName == _this.storeName)&&(identical(other.staffName, _this.staffName) || other.staffName == _this.staffName)&&(identical(other.taskNumber, _this.taskNumber) || other.taskNumber == _this.taskNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as CaptureSessionModel;
  return Object.hash(runtimeType,_this.token,_this.serverTime,_this.storeCode,_this.storeName,_this.staffName,_this.taskNumber);
}

@override
String toString() {
  final _this = this as CaptureSessionModel;
  return 'CaptureSessionModel(token: ${_this.token}, serverTime: ${_this.serverTime}, storeCode: ${_this.storeCode}, storeName: ${_this.storeName}, staffName: ${_this.staffName}, taskNumber: ${_this.taskNumber})';
}


}

/// @nodoc
abstract mixin class $CaptureSessionModelCopyWith<$Res>  {
  factory $CaptureSessionModelCopyWith(CaptureSessionModel value, $Res Function(CaptureSessionModel) _then) = _$CaptureSessionModelCopyWithImpl;
@useResult
$Res call({
 String token, DateTime serverTime, String storeCode, String storeName, String staffName, int taskNumber
});




}
/// @nodoc
class _$CaptureSessionModelCopyWithImpl<$Res>
    implements $CaptureSessionModelCopyWith<$Res> {
  _$CaptureSessionModelCopyWithImpl(this._self, this._then);

  final CaptureSessionModel _self;
  final $Res Function(CaptureSessionModel) _then;

/// Create a copy of CaptureSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? serverTime = null,Object? storeCode = null,Object? storeName = null,Object? staffName = null,Object? taskNumber = null,}) {
  return _then(CaptureSessionModel(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,serverTime: null == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as DateTime,storeCode: null == storeCode ? _self.storeCode : storeCode // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,staffName: null == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String,taskNumber: null == taskNumber ? _self.taskNumber : taskNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CaptureSessionModel].
extension CaptureSessionModelPatterns on CaptureSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaptureSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaptureSessionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaptureSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _CaptureSessionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaptureSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _CaptureSessionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token,  DateTime serverTime,  String storeCode,  String storeName,  String staffName,  int taskNumber)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaptureSessionModel() when $default != null:
return $default(_that.token,_that.serverTime,_that.storeCode,_that.storeName,_that.staffName,_that.taskNumber);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token,  DateTime serverTime,  String storeCode,  String storeName,  String staffName,  int taskNumber)  $default,) {final _that = this;
switch (_that) {
case _CaptureSessionModel():
return $default(_that.token,_that.serverTime,_that.storeCode,_that.storeName,_that.staffName,_that.taskNumber);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token,  DateTime serverTime,  String storeCode,  String storeName,  String staffName,  int taskNumber)?  $default,) {final _that = this;
switch (_that) {
case _CaptureSessionModel() when $default != null:
return $default(_that.token,_that.serverTime,_that.storeCode,_that.storeName,_that.staffName,_that.taskNumber);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CaptureSessionModel extends CaptureSessionModel {
  const _CaptureSessionModel({required this.token, required this.serverTime, required this.storeCode, required this.storeName, required this.staffName, required this.taskNumber}): super._();
  factory _CaptureSessionModel.fromJson(Map<String, dynamic> json) => _$CaptureSessionModelFromJson(json);

@override final  String token;
@override final  DateTime serverTime;
@override final  String storeCode;
@override final  String storeName;
@override final  String staffName;
@override final  int taskNumber;

/// Create a copy of CaptureSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaptureSessionModelCopyWith<_CaptureSessionModel> get copyWith => __$CaptureSessionModelCopyWithImpl<_CaptureSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CaptureSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaptureSessionModel&&(identical(other.token, token) || other.token == token)&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime)&&(identical(other.storeCode, storeCode) || other.storeCode == storeCode)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.taskNumber, taskNumber) || other.taskNumber == taskNumber));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,token,serverTime,storeCode,storeName,staffName,taskNumber);
}

@override
String toString() {
    return 'CaptureSessionModel(token: $token, serverTime: $serverTime, storeCode: $storeCode, storeName: $storeName, staffName: $staffName, taskNumber: $taskNumber)';
}


}

/// @nodoc
abstract mixin class _$CaptureSessionModelCopyWith<$Res> implements $CaptureSessionModelCopyWith<$Res> {
  factory _$CaptureSessionModelCopyWith(_CaptureSessionModel value, $Res Function(_CaptureSessionModel) _then) = __$CaptureSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String token, DateTime serverTime, String storeCode, String storeName, String staffName, int taskNumber
});




}
/// @nodoc
class __$CaptureSessionModelCopyWithImpl<$Res>
    implements _$CaptureSessionModelCopyWith<$Res> {
  __$CaptureSessionModelCopyWithImpl(this._self, this._then);

  final _CaptureSessionModel _self;
  final $Res Function(_CaptureSessionModel) _then;

/// Create a copy of CaptureSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? serverTime = null,Object? storeCode = null,Object? storeName = null,Object? staffName = null,Object? taskNumber = null,}) {
  return _then(_CaptureSessionModel(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,serverTime: null == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as DateTime,storeCode: null == storeCode ? _self.storeCode : storeCode // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,staffName: null == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String,taskNumber: null == taskNumber ? _self.taskNumber : taskNumber // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
