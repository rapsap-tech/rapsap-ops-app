// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_ticket_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtpTicketModel {

 int get resendAfterSeconds; int get validMinutes;
/// Create a copy of OtpTicketModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpTicketModelCopyWith<OtpTicketModel> get copyWith => _$OtpTicketModelCopyWithImpl<OtpTicketModel>(this as OtpTicketModel, _$identity);

  /// Serializes this OtpTicketModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OtpTicketModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpTicketModel&&(identical(other.resendAfterSeconds, _this.resendAfterSeconds) || other.resendAfterSeconds == _this.resendAfterSeconds)&&(identical(other.validMinutes, _this.validMinutes) || other.validMinutes == _this.validMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OtpTicketModel;
  return Object.hash(runtimeType,_this.resendAfterSeconds,_this.validMinutes);
}

@override
String toString() {
  final _this = this as OtpTicketModel;
  return 'OtpTicketModel(resendAfterSeconds: ${_this.resendAfterSeconds}, validMinutes: ${_this.validMinutes})';
}


}

/// @nodoc
abstract mixin class $OtpTicketModelCopyWith<$Res>  {
  factory $OtpTicketModelCopyWith(OtpTicketModel value, $Res Function(OtpTicketModel) _then) = _$OtpTicketModelCopyWithImpl;
@useResult
$Res call({
 int resendAfterSeconds, int validMinutes
});




}
/// @nodoc
class _$OtpTicketModelCopyWithImpl<$Res>
    implements $OtpTicketModelCopyWith<$Res> {
  _$OtpTicketModelCopyWithImpl(this._self, this._then);

  final OtpTicketModel _self;
  final $Res Function(OtpTicketModel) _then;

/// Create a copy of OtpTicketModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? resendAfterSeconds = null,Object? validMinutes = null,}) {
  return _then(OtpTicketModel(
resendAfterSeconds: null == resendAfterSeconds ? _self.resendAfterSeconds : resendAfterSeconds // ignore: cast_nullable_to_non_nullable
as int,validMinutes: null == validMinutes ? _self.validMinutes : validMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpTicketModel].
extension OtpTicketModelPatterns on OtpTicketModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpTicketModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpTicketModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpTicketModel value)  $default,){
final _that = this;
switch (_that) {
case _OtpTicketModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpTicketModel value)?  $default,){
final _that = this;
switch (_that) {
case _OtpTicketModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int resendAfterSeconds,  int validMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpTicketModel() when $default != null:
return $default(_that.resendAfterSeconds,_that.validMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int resendAfterSeconds,  int validMinutes)  $default,) {final _that = this;
switch (_that) {
case _OtpTicketModel():
return $default(_that.resendAfterSeconds,_that.validMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int resendAfterSeconds,  int validMinutes)?  $default,) {final _that = this;
switch (_that) {
case _OtpTicketModel() when $default != null:
return $default(_that.resendAfterSeconds,_that.validMinutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpTicketModel extends OtpTicketModel {
  const _OtpTicketModel({this.resendAfterSeconds = AppConstants.otpResendSeconds, this.validMinutes = AppConstants.otpValidMinutes}): super._();
  factory _OtpTicketModel.fromJson(Map<String, dynamic> json) => _$OtpTicketModelFromJson(json);

@override@JsonKey() final  int resendAfterSeconds;
@override@JsonKey() final  int validMinutes;

/// Create a copy of OtpTicketModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpTicketModelCopyWith<_OtpTicketModel> get copyWith => __$OtpTicketModelCopyWithImpl<_OtpTicketModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpTicketModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpTicketModel&&(identical(other.resendAfterSeconds, resendAfterSeconds) || other.resendAfterSeconds == resendAfterSeconds)&&(identical(other.validMinutes, validMinutes) || other.validMinutes == validMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,resendAfterSeconds,validMinutes);
}

@override
String toString() {
    return 'OtpTicketModel(resendAfterSeconds: $resendAfterSeconds, validMinutes: $validMinutes)';
}


}

/// @nodoc
abstract mixin class _$OtpTicketModelCopyWith<$Res> implements $OtpTicketModelCopyWith<$Res> {
  factory _$OtpTicketModelCopyWith(_OtpTicketModel value, $Res Function(_OtpTicketModel) _then) = __$OtpTicketModelCopyWithImpl;
@override @useResult
$Res call({
 int resendAfterSeconds, int validMinutes
});




}
/// @nodoc
class __$OtpTicketModelCopyWithImpl<$Res>
    implements _$OtpTicketModelCopyWith<$Res> {
  __$OtpTicketModelCopyWithImpl(this._self, this._then);

  final _OtpTicketModel _self;
  final $Res Function(_OtpTicketModel) _then;

/// Create a copy of OtpTicketModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? resendAfterSeconds = null,Object? validMinutes = null,}) {
  return _then(_OtpTicketModel(
resendAfterSeconds: null == resendAfterSeconds ? _self.resendAfterSeconds : resendAfterSeconds // ignore: cast_nullable_to_non_nullable
as int,validMinutes: null == validMinutes ? _self.validMinutes : validMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
