// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AppNotificationModel {

@IdConverter() String get id; String get title; DateTime get createdAt; String get subtitle; bool get read; String? get targetType;@IdConverter() String? get targetId;
/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AppNotificationModelCopyWith<AppNotificationModel> get copyWith => _$AppNotificationModelCopyWithImpl<AppNotificationModel>(this as AppNotificationModel, _$identity);

  /// Serializes this AppNotificationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AppNotificationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppNotificationModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.subtitle, _this.subtitle) || other.subtitle == _this.subtitle)&&(identical(other.read, _this.read) || other.read == _this.read)&&(identical(other.targetType, _this.targetType) || other.targetType == _this.targetType)&&(identical(other.targetId, _this.targetId) || other.targetId == _this.targetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AppNotificationModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.createdAt,_this.subtitle,_this.read,_this.targetType,_this.targetId);
}

@override
String toString() {
  final _this = this as AppNotificationModel;
  return 'AppNotificationModel(id: ${_this.id}, title: ${_this.title}, createdAt: ${_this.createdAt}, subtitle: ${_this.subtitle}, read: ${_this.read}, targetType: ${_this.targetType}, targetId: ${_this.targetId})';
}


}

/// @nodoc
abstract mixin class $AppNotificationModelCopyWith<$Res>  {
  factory $AppNotificationModelCopyWith(AppNotificationModel value, $Res Function(AppNotificationModel) _then) = _$AppNotificationModelCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String title, DateTime createdAt, String subtitle, bool read, String? targetType,@IdConverter() String? targetId
});




}
/// @nodoc
class _$AppNotificationModelCopyWithImpl<$Res>
    implements $AppNotificationModelCopyWith<$Res> {
  _$AppNotificationModelCopyWithImpl(this._self, this._then);

  final AppNotificationModel _self;
  final $Res Function(AppNotificationModel) _then;

/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? subtitle = null,Object? read = null,Object? targetType = freezed,Object? targetId = freezed,}) {
  return _then(AppNotificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,targetType: freezed == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String?,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AppNotificationModel].
extension AppNotificationModelPatterns on AppNotificationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AppNotificationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AppNotificationModel value)  $default,){
final _that = this;
switch (_that) {
case _AppNotificationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AppNotificationModel value)?  $default,){
final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String title,  DateTime createdAt,  String subtitle,  bool read,  String? targetType, @IdConverter()  String? targetId)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.subtitle,_that.read,_that.targetType,_that.targetId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String title,  DateTime createdAt,  String subtitle,  bool read,  String? targetType, @IdConverter()  String? targetId)  $default,) {final _that = this;
switch (_that) {
case _AppNotificationModel():
return $default(_that.id,_that.title,_that.createdAt,_that.subtitle,_that.read,_that.targetType,_that.targetId);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String title,  DateTime createdAt,  String subtitle,  bool read,  String? targetType, @IdConverter()  String? targetId)?  $default,) {final _that = this;
switch (_that) {
case _AppNotificationModel() when $default != null:
return $default(_that.id,_that.title,_that.createdAt,_that.subtitle,_that.read,_that.targetType,_that.targetId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AppNotificationModel extends AppNotificationModel {
  const _AppNotificationModel({@IdConverter() required this.id, required this.title, required this.createdAt, this.subtitle = '', this.read = false, this.targetType, @IdConverter() this.targetId}): super._();
  factory _AppNotificationModel.fromJson(Map<String, dynamic> json) => _$AppNotificationModelFromJson(json);

@override@IdConverter() final  String id;
@override final  String title;
@override final  DateTime createdAt;
@override@JsonKey() final  String subtitle;
@override@JsonKey() final  bool read;
@override final  String? targetType;
@override@IdConverter() final  String? targetId;

/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AppNotificationModelCopyWith<_AppNotificationModel> get copyWith => __$AppNotificationModelCopyWithImpl<_AppNotificationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AppNotificationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AppNotificationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.read, read) || other.read == read)&&(identical(other.targetType, targetType) || other.targetType == targetType)&&(identical(other.targetId, targetId) || other.targetId == targetId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,createdAt,subtitle,read,targetType,targetId);
}

@override
String toString() {
    return 'AppNotificationModel(id: $id, title: $title, createdAt: $createdAt, subtitle: $subtitle, read: $read, targetType: $targetType, targetId: $targetId)';
}


}

/// @nodoc
abstract mixin class _$AppNotificationModelCopyWith<$Res> implements $AppNotificationModelCopyWith<$Res> {
  factory _$AppNotificationModelCopyWith(_AppNotificationModel value, $Res Function(_AppNotificationModel) _then) = __$AppNotificationModelCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String title, DateTime createdAt, String subtitle, bool read, String? targetType,@IdConverter() String? targetId
});




}
/// @nodoc
class __$AppNotificationModelCopyWithImpl<$Res>
    implements _$AppNotificationModelCopyWith<$Res> {
  __$AppNotificationModelCopyWithImpl(this._self, this._then);

  final _AppNotificationModel _self;
  final $Res Function(_AppNotificationModel) _then;

/// Create a copy of AppNotificationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? createdAt = null,Object? subtitle = null,Object? read = null,Object? targetType = freezed,Object? targetId = freezed,}) {
  return _then(_AppNotificationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,subtitle: null == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String,read: null == read ? _self.read : read // ignore: cast_nullable_to_non_nullable
as bool,targetType: freezed == targetType ? _self.targetType : targetType // ignore: cast_nullable_to_non_nullable
as String?,targetId: freezed == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
