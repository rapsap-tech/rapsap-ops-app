// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileModel {

 String get name; String get employeeId; String get phone; String get storeName; String get reportsTo; List<String> get tags; int get onTimePercent; int get doneThisMonth; int get missedThisMonth; String? get emergencyContact;
/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileModelCopyWith<ProfileModel> get copyWith => _$ProfileModelCopyWithImpl<ProfileModel>(this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ProfileModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileModel&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.employeeId, _this.employeeId) || other.employeeId == _this.employeeId)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.storeName, _this.storeName) || other.storeName == _this.storeName)&&(identical(other.reportsTo, _this.reportsTo) || other.reportsTo == _this.reportsTo)&&const DeepCollectionEquality().equals(other.tags, _this.tags)&&(identical(other.onTimePercent, _this.onTimePercent) || other.onTimePercent == _this.onTimePercent)&&(identical(other.doneThisMonth, _this.doneThisMonth) || other.doneThisMonth == _this.doneThisMonth)&&(identical(other.missedThisMonth, _this.missedThisMonth) || other.missedThisMonth == _this.missedThisMonth)&&(identical(other.emergencyContact, _this.emergencyContact) || other.emergencyContact == _this.emergencyContact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ProfileModel;
  return Object.hash(runtimeType,_this.name,_this.employeeId,_this.phone,_this.storeName,_this.reportsTo,const DeepCollectionEquality().hash(_this.tags),_this.onTimePercent,_this.doneThisMonth,_this.missedThisMonth,_this.emergencyContact);
}

@override
String toString() {
  final _this = this as ProfileModel;
  return 'ProfileModel(name: ${_this.name}, employeeId: ${_this.employeeId}, phone: ${_this.phone}, storeName: ${_this.storeName}, reportsTo: ${_this.reportsTo}, tags: ${_this.tags}, onTimePercent: ${_this.onTimePercent}, doneThisMonth: ${_this.doneThisMonth}, missedThisMonth: ${_this.missedThisMonth}, emergencyContact: ${_this.emergencyContact})';
}


}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res>  {
  factory $ProfileModelCopyWith(ProfileModel value, $Res Function(ProfileModel) _then) = _$ProfileModelCopyWithImpl;
@useResult
$Res call({
 String name, String employeeId, String phone, String storeName, String reportsTo, List<String> tags, int onTimePercent, int doneThisMonth, int missedThisMonth, String? emergencyContact
});




}
/// @nodoc
class _$ProfileModelCopyWithImpl<$Res>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? employeeId = null,Object? phone = null,Object? storeName = null,Object? reportsTo = null,Object? tags = null,Object? onTimePercent = null,Object? doneThisMonth = null,Object? missedThisMonth = null,Object? emergencyContact = freezed,}) {
  return _then(ProfileModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,reportsTo: null == reportsTo ? _self.reportsTo : reportsTo // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,onTimePercent: null == onTimePercent ? _self.onTimePercent : onTimePercent // ignore: cast_nullable_to_non_nullable
as int,doneThisMonth: null == doneThisMonth ? _self.doneThisMonth : doneThisMonth // ignore: cast_nullable_to_non_nullable
as int,missedThisMonth: null == missedThisMonth ? _self.missedThisMonth : missedThisMonth // ignore: cast_nullable_to_non_nullable
as int,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileModel].
extension ProfileModelPatterns on ProfileModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileModel value)  $default,){
final _that = this;
switch (_that) {
case _ProfileModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileModel value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String employeeId,  String phone,  String storeName,  String reportsTo,  List<String> tags,  int onTimePercent,  int doneThisMonth,  int missedThisMonth,  String? emergencyContact)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.name,_that.employeeId,_that.phone,_that.storeName,_that.reportsTo,_that.tags,_that.onTimePercent,_that.doneThisMonth,_that.missedThisMonth,_that.emergencyContact);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String employeeId,  String phone,  String storeName,  String reportsTo,  List<String> tags,  int onTimePercent,  int doneThisMonth,  int missedThisMonth,  String? emergencyContact)  $default,) {final _that = this;
switch (_that) {
case _ProfileModel():
return $default(_that.name,_that.employeeId,_that.phone,_that.storeName,_that.reportsTo,_that.tags,_that.onTimePercent,_that.doneThisMonth,_that.missedThisMonth,_that.emergencyContact);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String employeeId,  String phone,  String storeName,  String reportsTo,  List<String> tags,  int onTimePercent,  int doneThisMonth,  int missedThisMonth,  String? emergencyContact)?  $default,) {final _that = this;
switch (_that) {
case _ProfileModel() when $default != null:
return $default(_that.name,_that.employeeId,_that.phone,_that.storeName,_that.reportsTo,_that.tags,_that.onTimePercent,_that.doneThisMonth,_that.missedThisMonth,_that.emergencyContact);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileModel extends ProfileModel {
  const _ProfileModel({required this.name, required this.employeeId, required this.phone, required this.storeName, required this.reportsTo,  List<String> tags = const <String>[], this.onTimePercent = 0, this.doneThisMonth = 0, this.missedThisMonth = 0, this.emergencyContact}): _tags = tags,super._();
  factory _ProfileModel.fromJson(Map<String, dynamic> json) => _$ProfileModelFromJson(json);

@override final  String name;
@override final  String employeeId;
@override final  String phone;
@override final  String storeName;
@override final  String reportsTo;
 final  List<String> _tags;
@override@JsonKey() List<String> get tags {
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tags);
}

@override@JsonKey() final  int onTimePercent;
@override@JsonKey() final  int doneThisMonth;
@override@JsonKey() final  int missedThisMonth;
@override final  String? emergencyContact;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileModelCopyWith<_ProfileModel> get copyWith => __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileModel&&(identical(other.name, name) || other.name == name)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.reportsTo, reportsTo) || other.reportsTo == reportsTo)&&const DeepCollectionEquality().equals(other.tags, _tags)&&(identical(other.onTimePercent, onTimePercent) || other.onTimePercent == onTimePercent)&&(identical(other.doneThisMonth, doneThisMonth) || other.doneThisMonth == doneThisMonth)&&(identical(other.missedThisMonth, missedThisMonth) || other.missedThisMonth == missedThisMonth)&&(identical(other.emergencyContact, emergencyContact) || other.emergencyContact == emergencyContact));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,employeeId,phone,storeName,reportsTo,const DeepCollectionEquality().hash(_tags),onTimePercent,doneThisMonth,missedThisMonth,emergencyContact);
}

@override
String toString() {
    return 'ProfileModel(name: $name, employeeId: $employeeId, phone: $phone, storeName: $storeName, reportsTo: $reportsTo, tags: $tags, onTimePercent: $onTimePercent, doneThisMonth: $doneThisMonth, missedThisMonth: $missedThisMonth, emergencyContact: $emergencyContact)';
}


}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res> implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(_ProfileModel value, $Res Function(_ProfileModel) _then) = __$ProfileModelCopyWithImpl;
@override @useResult
$Res call({
 String name, String employeeId, String phone, String storeName, String reportsTo, List<String> tags, int onTimePercent, int doneThisMonth, int missedThisMonth, String? emergencyContact
});




}
/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

/// Create a copy of ProfileModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? employeeId = null,Object? phone = null,Object? storeName = null,Object? reportsTo = null,Object? tags = null,Object? onTimePercent = null,Object? doneThisMonth = null,Object? missedThisMonth = null,Object? emergencyContact = freezed,}) {
  return _then(_ProfileModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,employeeId: null == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,reportsTo: null == reportsTo ? _self.reportsTo : reportsTo // ignore: cast_nullable_to_non_nullable
as String,tags: null == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>,onTimePercent: null == onTimePercent ? _self.onTimePercent : onTimePercent // ignore: cast_nullable_to_non_nullable
as int,doneThisMonth: null == doneThisMonth ? _self.doneThisMonth : doneThisMonth // ignore: cast_nullable_to_non_nullable
as int,missedThisMonth: null == missedThisMonth ? _self.missedThisMonth : missedThisMonth // ignore: cast_nullable_to_non_nullable
as int,emergencyContact: freezed == emergencyContact ? _self.emergencyContact : emergencyContact // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
