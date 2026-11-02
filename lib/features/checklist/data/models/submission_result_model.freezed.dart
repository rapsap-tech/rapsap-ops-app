// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submission_result_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmissionResultModel {

 DateTime get submittedAt; bool get onTime;
/// Create a copy of SubmissionResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubmissionResultModelCopyWith<SubmissionResultModel> get copyWith => _$SubmissionResultModelCopyWithImpl<SubmissionResultModel>(this as SubmissionResultModel, _$identity);

  /// Serializes this SubmissionResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SubmissionResultModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubmissionResultModel&&(identical(other.submittedAt, _this.submittedAt) || other.submittedAt == _this.submittedAt)&&(identical(other.onTime, _this.onTime) || other.onTime == _this.onTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SubmissionResultModel;
  return Object.hash(runtimeType,_this.submittedAt,_this.onTime);
}

@override
String toString() {
  final _this = this as SubmissionResultModel;
  return 'SubmissionResultModel(submittedAt: ${_this.submittedAt}, onTime: ${_this.onTime})';
}


}

/// @nodoc
abstract mixin class $SubmissionResultModelCopyWith<$Res>  {
  factory $SubmissionResultModelCopyWith(SubmissionResultModel value, $Res Function(SubmissionResultModel) _then) = _$SubmissionResultModelCopyWithImpl;
@useResult
$Res call({
 DateTime submittedAt, bool onTime
});




}
/// @nodoc
class _$SubmissionResultModelCopyWithImpl<$Res>
    implements $SubmissionResultModelCopyWith<$Res> {
  _$SubmissionResultModelCopyWithImpl(this._self, this._then);

  final SubmissionResultModel _self;
  final $Res Function(SubmissionResultModel) _then;

/// Create a copy of SubmissionResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? submittedAt = null,Object? onTime = null,}) {
  return _then(SubmissionResultModel(
submittedAt: null == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,onTime: null == onTime ? _self.onTime : onTime // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SubmissionResultModel].
extension SubmissionResultModelPatterns on SubmissionResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubmissionResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubmissionResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubmissionResultModel value)  $default,){
final _that = this;
switch (_that) {
case _SubmissionResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubmissionResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubmissionResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime submittedAt,  bool onTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubmissionResultModel() when $default != null:
return $default(_that.submittedAt,_that.onTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime submittedAt,  bool onTime)  $default,) {final _that = this;
switch (_that) {
case _SubmissionResultModel():
return $default(_that.submittedAt,_that.onTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime submittedAt,  bool onTime)?  $default,) {final _that = this;
switch (_that) {
case _SubmissionResultModel() when $default != null:
return $default(_that.submittedAt,_that.onTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubmissionResultModel extends SubmissionResultModel {
  const _SubmissionResultModel({required this.submittedAt, required this.onTime}): super._();
  factory _SubmissionResultModel.fromJson(Map<String, dynamic> json) => _$SubmissionResultModelFromJson(json);

@override final  DateTime submittedAt;
@override final  bool onTime;

/// Create a copy of SubmissionResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmissionResultModelCopyWith<_SubmissionResultModel> get copyWith => __$SubmissionResultModelCopyWithImpl<_SubmissionResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubmissionResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubmissionResultModel&&(identical(other.submittedAt, submittedAt) || other.submittedAt == submittedAt)&&(identical(other.onTime, onTime) || other.onTime == onTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,submittedAt,onTime);
}

@override
String toString() {
    return 'SubmissionResultModel(submittedAt: $submittedAt, onTime: $onTime)';
}


}

/// @nodoc
abstract mixin class _$SubmissionResultModelCopyWith<$Res> implements $SubmissionResultModelCopyWith<$Res> {
  factory _$SubmissionResultModelCopyWith(_SubmissionResultModel value, $Res Function(_SubmissionResultModel) _then) = __$SubmissionResultModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime submittedAt, bool onTime
});




}
/// @nodoc
class __$SubmissionResultModelCopyWithImpl<$Res>
    implements _$SubmissionResultModelCopyWith<$Res> {
  __$SubmissionResultModelCopyWithImpl(this._self, this._then);

  final _SubmissionResultModel _self;
  final $Res Function(_SubmissionResultModel) _then;

/// Create a copy of SubmissionResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? submittedAt = null,Object? onTime = null,}) {
  return _then(_SubmissionResultModel(
submittedAt: null == submittedAt ? _self.submittedAt : submittedAt // ignore: cast_nullable_to_non_nullable
as DateTime,onTime: null == onTime ? _self.onTime : onTime // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
