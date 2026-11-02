// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_prefs_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationPrefsModel {

 bool get chatMessages; bool get announcements;
/// Create a copy of NotificationPrefsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NotificationPrefsModelCopyWith<NotificationPrefsModel> get copyWith => _$NotificationPrefsModelCopyWithImpl<NotificationPrefsModel>(this as NotificationPrefsModel, _$identity);

  /// Serializes this NotificationPrefsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as NotificationPrefsModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NotificationPrefsModel&&(identical(other.chatMessages, _this.chatMessages) || other.chatMessages == _this.chatMessages)&&(identical(other.announcements, _this.announcements) || other.announcements == _this.announcements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as NotificationPrefsModel;
  return Object.hash(runtimeType,_this.chatMessages,_this.announcements);
}

@override
String toString() {
  final _this = this as NotificationPrefsModel;
  return 'NotificationPrefsModel(chatMessages: ${_this.chatMessages}, announcements: ${_this.announcements})';
}


}

/// @nodoc
abstract mixin class $NotificationPrefsModelCopyWith<$Res>  {
  factory $NotificationPrefsModelCopyWith(NotificationPrefsModel value, $Res Function(NotificationPrefsModel) _then) = _$NotificationPrefsModelCopyWithImpl;
@useResult
$Res call({
 bool chatMessages, bool announcements
});




}
/// @nodoc
class _$NotificationPrefsModelCopyWithImpl<$Res>
    implements $NotificationPrefsModelCopyWith<$Res> {
  _$NotificationPrefsModelCopyWithImpl(this._self, this._then);

  final NotificationPrefsModel _self;
  final $Res Function(NotificationPrefsModel) _then;

/// Create a copy of NotificationPrefsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chatMessages = null,Object? announcements = null,}) {
  return _then(NotificationPrefsModel(
chatMessages: null == chatMessages ? _self.chatMessages : chatMessages // ignore: cast_nullable_to_non_nullable
as bool,announcements: null == announcements ? _self.announcements : announcements // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [NotificationPrefsModel].
extension NotificationPrefsModelPatterns on NotificationPrefsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _NotificationPrefsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _NotificationPrefsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _NotificationPrefsModel value)  $default,){
final _that = this;
switch (_that) {
case _NotificationPrefsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _NotificationPrefsModel value)?  $default,){
final _that = this;
switch (_that) {
case _NotificationPrefsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool chatMessages,  bool announcements)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _NotificationPrefsModel() when $default != null:
return $default(_that.chatMessages,_that.announcements);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool chatMessages,  bool announcements)  $default,) {final _that = this;
switch (_that) {
case _NotificationPrefsModel():
return $default(_that.chatMessages,_that.announcements);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool chatMessages,  bool announcements)?  $default,) {final _that = this;
switch (_that) {
case _NotificationPrefsModel() when $default != null:
return $default(_that.chatMessages,_that.announcements);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _NotificationPrefsModel extends NotificationPrefsModel {
  const _NotificationPrefsModel({this.chatMessages = true, this.announcements = true}): super._();
  factory _NotificationPrefsModel.fromJson(Map<String, dynamic> json) => _$NotificationPrefsModelFromJson(json);

@override@JsonKey() final  bool chatMessages;
@override@JsonKey() final  bool announcements;

/// Create a copy of NotificationPrefsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotificationPrefsModelCopyWith<_NotificationPrefsModel> get copyWith => __$NotificationPrefsModelCopyWithImpl<_NotificationPrefsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$NotificationPrefsModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotificationPrefsModel&&(identical(other.chatMessages, chatMessages) || other.chatMessages == chatMessages)&&(identical(other.announcements, announcements) || other.announcements == announcements));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,chatMessages,announcements);
}

@override
String toString() {
    return 'NotificationPrefsModel(chatMessages: $chatMessages, announcements: $announcements)';
}


}

/// @nodoc
abstract mixin class _$NotificationPrefsModelCopyWith<$Res> implements $NotificationPrefsModelCopyWith<$Res> {
  factory _$NotificationPrefsModelCopyWith(_NotificationPrefsModel value, $Res Function(_NotificationPrefsModel) _then) = __$NotificationPrefsModelCopyWithImpl;
@override @useResult
$Res call({
 bool chatMessages, bool announcements
});




}
/// @nodoc
class __$NotificationPrefsModelCopyWithImpl<$Res>
    implements _$NotificationPrefsModelCopyWith<$Res> {
  __$NotificationPrefsModelCopyWithImpl(this._self, this._then);

  final _NotificationPrefsModel _self;
  final $Res Function(_NotificationPrefsModel) _then;

/// Create a copy of NotificationPrefsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chatMessages = null,Object? announcements = null,}) {
  return _then(_NotificationPrefsModel(
chatMessages: null == chatMessages ? _self.chatMessages : chatMessages // ignore: cast_nullable_to_non_nullable
as bool,announcements: null == announcements ? _self.announcements : announcements // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
