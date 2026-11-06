// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'today_checklist_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodayChecklistModel {

 DateTime get date; List<ChecklistSectionModel> get sections; String? get shift;
/// Create a copy of TodayChecklistModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodayChecklistModelCopyWith<TodayChecklistModel> get copyWith => _$TodayChecklistModelCopyWithImpl<TodayChecklistModel>(this as TodayChecklistModel, _$identity);

  /// Serializes this TodayChecklistModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TodayChecklistModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodayChecklistModel&&(identical(other.date, _this.date) || other.date == _this.date)&&const DeepCollectionEquality().equals(other.sections, _this.sections)&&(identical(other.shift, _this.shift) || other.shift == _this.shift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TodayChecklistModel;
  return Object.hash(runtimeType,_this.date,const DeepCollectionEquality().hash(_this.sections),_this.shift);
}

@override
String toString() {
  final _this = this as TodayChecklistModel;
  return 'TodayChecklistModel(date: ${_this.date}, sections: ${_this.sections}, shift: ${_this.shift})';
}


}

/// @nodoc
abstract mixin class $TodayChecklistModelCopyWith<$Res>  {
  factory $TodayChecklistModelCopyWith(TodayChecklistModel value, $Res Function(TodayChecklistModel) _then) = _$TodayChecklistModelCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<ChecklistSectionModel> sections, String? shift
});




}
/// @nodoc
class _$TodayChecklistModelCopyWithImpl<$Res>
    implements $TodayChecklistModelCopyWith<$Res> {
  _$TodayChecklistModelCopyWithImpl(this._self, this._then);

  final TodayChecklistModel _self;
  final $Res Function(TodayChecklistModel) _then;

/// Create a copy of TodayChecklistModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? sections = null,Object? shift = freezed,}) {
  return _then(TodayChecklistModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<ChecklistSectionModel>,shift: freezed == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodayChecklistModel].
extension TodayChecklistModelPatterns on TodayChecklistModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodayChecklistModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodayChecklistModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodayChecklistModel value)  $default,){
final _that = this;
switch (_that) {
case _TodayChecklistModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodayChecklistModel value)?  $default,){
final _that = this;
switch (_that) {
case _TodayChecklistModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  List<ChecklistSectionModel> sections,  String? shift)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodayChecklistModel() when $default != null:
return $default(_that.date,_that.sections,_that.shift);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  List<ChecklistSectionModel> sections,  String? shift)  $default,) {final _that = this;
switch (_that) {
case _TodayChecklistModel():
return $default(_that.date,_that.sections,_that.shift);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  List<ChecklistSectionModel> sections,  String? shift)?  $default,) {final _that = this;
switch (_that) {
case _TodayChecklistModel() when $default != null:
return $default(_that.date,_that.sections,_that.shift);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodayChecklistModel extends TodayChecklistModel {
  const _TodayChecklistModel({required this.date, required  List<ChecklistSectionModel> sections, this.shift}): _sections = sections,super._();
  factory _TodayChecklistModel.fromJson(Map<String, dynamic> json) => _$TodayChecklistModelFromJson(json);

@override final  DateTime date;
 final  List<ChecklistSectionModel> _sections;
@override List<ChecklistSectionModel> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

@override final  String? shift;

/// Create a copy of TodayChecklistModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodayChecklistModelCopyWith<_TodayChecklistModel> get copyWith => __$TodayChecklistModelCopyWithImpl<_TodayChecklistModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodayChecklistModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodayChecklistModel&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.sections, _sections)&&(identical(other.shift, shift) || other.shift == shift));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_sections),shift);
}

@override
String toString() {
    return 'TodayChecklistModel(date: $date, sections: $sections, shift: $shift)';
}


}

/// @nodoc
abstract mixin class _$TodayChecklistModelCopyWith<$Res> implements $TodayChecklistModelCopyWith<$Res> {
  factory _$TodayChecklistModelCopyWith(_TodayChecklistModel value, $Res Function(_TodayChecklistModel) _then) = __$TodayChecklistModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, List<ChecklistSectionModel> sections, String? shift
});




}
/// @nodoc
class __$TodayChecklistModelCopyWithImpl<$Res>
    implements _$TodayChecklistModelCopyWith<$Res> {
  __$TodayChecklistModelCopyWithImpl(this._self, this._then);

  final _TodayChecklistModel _self;
  final $Res Function(_TodayChecklistModel) _then;

/// Create a copy of TodayChecklistModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? sections = null,Object? shift = freezed,}) {
  return _then(_TodayChecklistModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<ChecklistSectionModel>,shift: freezed == shift ? _self.shift : shift // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChecklistSectionModel {

 String get name; List<ChecklistTaskModel> get tasks; DateTime? get opensAt; DateTime? get closesAt;
/// Create a copy of ChecklistSectionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistSectionModelCopyWith<ChecklistSectionModel> get copyWith => _$ChecklistSectionModelCopyWithImpl<ChecklistSectionModel>(this as ChecklistSectionModel, _$identity);

  /// Serializes this ChecklistSectionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChecklistSectionModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistSectionModel&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.tasks, _this.tasks)&&(identical(other.opensAt, _this.opensAt) || other.opensAt == _this.opensAt)&&(identical(other.closesAt, _this.closesAt) || other.closesAt == _this.closesAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChecklistSectionModel;
  return Object.hash(runtimeType,_this.name,const DeepCollectionEquality().hash(_this.tasks),_this.opensAt,_this.closesAt);
}

@override
String toString() {
  final _this = this as ChecklistSectionModel;
  return 'ChecklistSectionModel(name: ${_this.name}, tasks: ${_this.tasks}, opensAt: ${_this.opensAt}, closesAt: ${_this.closesAt})';
}


}

/// @nodoc
abstract mixin class $ChecklistSectionModelCopyWith<$Res>  {
  factory $ChecklistSectionModelCopyWith(ChecklistSectionModel value, $Res Function(ChecklistSectionModel) _then) = _$ChecklistSectionModelCopyWithImpl;
@useResult
$Res call({
 String name, List<ChecklistTaskModel> tasks, DateTime? opensAt, DateTime? closesAt
});




}
/// @nodoc
class _$ChecklistSectionModelCopyWithImpl<$Res>
    implements $ChecklistSectionModelCopyWith<$Res> {
  _$ChecklistSectionModelCopyWithImpl(this._self, this._then);

  final ChecklistSectionModel _self;
  final $Res Function(ChecklistSectionModel) _then;

/// Create a copy of ChecklistSectionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? tasks = null,Object? opensAt = freezed,Object? closesAt = freezed,}) {
  return _then(ChecklistSectionModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<ChecklistTaskModel>,opensAt: freezed == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closesAt: freezed == closesAt ? _self.closesAt : closesAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistSectionModel].
extension ChecklistSectionModelPatterns on ChecklistSectionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistSectionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistSectionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistSectionModel value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistSectionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistSectionModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistSectionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<ChecklistTaskModel> tasks,  DateTime? opensAt,  DateTime? closesAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistSectionModel() when $default != null:
return $default(_that.name,_that.tasks,_that.opensAt,_that.closesAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<ChecklistTaskModel> tasks,  DateTime? opensAt,  DateTime? closesAt)  $default,) {final _that = this;
switch (_that) {
case _ChecklistSectionModel():
return $default(_that.name,_that.tasks,_that.opensAt,_that.closesAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<ChecklistTaskModel> tasks,  DateTime? opensAt,  DateTime? closesAt)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistSectionModel() when $default != null:
return $default(_that.name,_that.tasks,_that.opensAt,_that.closesAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChecklistSectionModel extends ChecklistSectionModel {
  const _ChecklistSectionModel({required this.name, required  List<ChecklistTaskModel> tasks, this.opensAt, this.closesAt}): _tasks = tasks,super._();
  factory _ChecklistSectionModel.fromJson(Map<String, dynamic> json) => _$ChecklistSectionModelFromJson(json);

@override final  String name;
 final  List<ChecklistTaskModel> _tasks;
@override List<ChecklistTaskModel> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}

@override final  DateTime? opensAt;
@override final  DateTime? closesAt;

/// Create a copy of ChecklistSectionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistSectionModelCopyWith<_ChecklistSectionModel> get copyWith => __$ChecklistSectionModelCopyWithImpl<_ChecklistSectionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistSectionModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistSectionModel&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.tasks, _tasks)&&(identical(other.opensAt, opensAt) || other.opensAt == opensAt)&&(identical(other.closesAt, closesAt) || other.closesAt == closesAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_tasks),opensAt,closesAt);
}

@override
String toString() {
    return 'ChecklistSectionModel(name: $name, tasks: $tasks, opensAt: $opensAt, closesAt: $closesAt)';
}


}

/// @nodoc
abstract mixin class _$ChecklistSectionModelCopyWith<$Res> implements $ChecklistSectionModelCopyWith<$Res> {
  factory _$ChecklistSectionModelCopyWith(_ChecklistSectionModel value, $Res Function(_ChecklistSectionModel) _then) = __$ChecklistSectionModelCopyWithImpl;
@override @useResult
$Res call({
 String name, List<ChecklistTaskModel> tasks, DateTime? opensAt, DateTime? closesAt
});




}
/// @nodoc
class __$ChecklistSectionModelCopyWithImpl<$Res>
    implements _$ChecklistSectionModelCopyWith<$Res> {
  __$ChecklistSectionModelCopyWithImpl(this._self, this._then);

  final _ChecklistSectionModel _self;
  final $Res Function(_ChecklistSectionModel) _then;

/// Create a copy of ChecklistSectionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? tasks = null,Object? opensAt = freezed,Object? closesAt = freezed,}) {
  return _then(_ChecklistSectionModel(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<ChecklistTaskModel>,opensAt: freezed == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as DateTime?,closesAt: freezed == closesAt ? _self.closesAt : closesAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ChecklistTaskModel {

@IdConverter() String get id; int get number; String get title; String get status; DateTime? get opensAt; DateTime? get dueAt; String? get actorName; DateTime? get actedAt;
/// Create a copy of ChecklistTaskModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChecklistTaskModelCopyWith<ChecklistTaskModel> get copyWith => _$ChecklistTaskModelCopyWithImpl<ChecklistTaskModel>(this as ChecklistTaskModel, _$identity);

  /// Serializes this ChecklistTaskModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChecklistTaskModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChecklistTaskModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.opensAt, _this.opensAt) || other.opensAt == _this.opensAt)&&(identical(other.dueAt, _this.dueAt) || other.dueAt == _this.dueAt)&&(identical(other.actorName, _this.actorName) || other.actorName == _this.actorName)&&(identical(other.actedAt, _this.actedAt) || other.actedAt == _this.actedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChecklistTaskModel;
  return Object.hash(runtimeType,_this.id,_this.number,_this.title,_this.status,_this.opensAt,_this.dueAt,_this.actorName,_this.actedAt);
}

@override
String toString() {
  final _this = this as ChecklistTaskModel;
  return 'ChecklistTaskModel(id: ${_this.id}, number: ${_this.number}, title: ${_this.title}, status: ${_this.status}, opensAt: ${_this.opensAt}, dueAt: ${_this.dueAt}, actorName: ${_this.actorName}, actedAt: ${_this.actedAt})';
}


}

/// @nodoc
abstract mixin class $ChecklistTaskModelCopyWith<$Res>  {
  factory $ChecklistTaskModelCopyWith(ChecklistTaskModel value, $Res Function(ChecklistTaskModel) _then) = _$ChecklistTaskModelCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, int number, String title, String status, DateTime? opensAt, DateTime? dueAt, String? actorName, DateTime? actedAt
});




}
/// @nodoc
class _$ChecklistTaskModelCopyWithImpl<$Res>
    implements $ChecklistTaskModelCopyWith<$Res> {
  _$ChecklistTaskModelCopyWithImpl(this._self, this._then);

  final ChecklistTaskModel _self;
  final $Res Function(ChecklistTaskModel) _then;

/// Create a copy of ChecklistTaskModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = null,Object? title = null,Object? status = null,Object? opensAt = freezed,Object? dueAt = freezed,Object? actorName = freezed,Object? actedAt = freezed,}) {
  return _then(ChecklistTaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,opensAt: freezed == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,actorName: freezed == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String?,actedAt: freezed == actedAt ? _self.actedAt : actedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ChecklistTaskModel].
extension ChecklistTaskModelPatterns on ChecklistTaskModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChecklistTaskModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChecklistTaskModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChecklistTaskModel value)  $default,){
final _that = this;
switch (_that) {
case _ChecklistTaskModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChecklistTaskModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChecklistTaskModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  int number,  String title,  String status,  DateTime? opensAt,  DateTime? dueAt,  String? actorName,  DateTime? actedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChecklistTaskModel() when $default != null:
return $default(_that.id,_that.number,_that.title,_that.status,_that.opensAt,_that.dueAt,_that.actorName,_that.actedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  int number,  String title,  String status,  DateTime? opensAt,  DateTime? dueAt,  String? actorName,  DateTime? actedAt)  $default,) {final _that = this;
switch (_that) {
case _ChecklistTaskModel():
return $default(_that.id,_that.number,_that.title,_that.status,_that.opensAt,_that.dueAt,_that.actorName,_that.actedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  int number,  String title,  String status,  DateTime? opensAt,  DateTime? dueAt,  String? actorName,  DateTime? actedAt)?  $default,) {final _that = this;
switch (_that) {
case _ChecklistTaskModel() when $default != null:
return $default(_that.id,_that.number,_that.title,_that.status,_that.opensAt,_that.dueAt,_that.actorName,_that.actedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChecklistTaskModel extends ChecklistTaskModel {
  const _ChecklistTaskModel({@IdConverter() required this.id, required this.number, required this.title, required this.status, this.opensAt, this.dueAt, this.actorName, this.actedAt}): super._();
  factory _ChecklistTaskModel.fromJson(Map<String, dynamic> json) => _$ChecklistTaskModelFromJson(json);

@override@IdConverter() final  String id;
@override final  int number;
@override final  String title;
@override final  String status;
@override final  DateTime? opensAt;
@override final  DateTime? dueAt;
@override final  String? actorName;
@override final  DateTime? actedAt;

/// Create a copy of ChecklistTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChecklistTaskModelCopyWith<_ChecklistTaskModel> get copyWith => __$ChecklistTaskModelCopyWithImpl<_ChecklistTaskModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChecklistTaskModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChecklistTaskModel&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.title, title) || other.title == title)&&(identical(other.status, status) || other.status == status)&&(identical(other.opensAt, opensAt) || other.opensAt == opensAt)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.actorName, actorName) || other.actorName == actorName)&&(identical(other.actedAt, actedAt) || other.actedAt == actedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,number,title,status,opensAt,dueAt,actorName,actedAt);
}

@override
String toString() {
    return 'ChecklistTaskModel(id: $id, number: $number, title: $title, status: $status, opensAt: $opensAt, dueAt: $dueAt, actorName: $actorName, actedAt: $actedAt)';
}


}

/// @nodoc
abstract mixin class _$ChecklistTaskModelCopyWith<$Res> implements $ChecklistTaskModelCopyWith<$Res> {
  factory _$ChecklistTaskModelCopyWith(_ChecklistTaskModel value, $Res Function(_ChecklistTaskModel) _then) = __$ChecklistTaskModelCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, int number, String title, String status, DateTime? opensAt, DateTime? dueAt, String? actorName, DateTime? actedAt
});




}
/// @nodoc
class __$ChecklistTaskModelCopyWithImpl<$Res>
    implements _$ChecklistTaskModelCopyWith<$Res> {
  __$ChecklistTaskModelCopyWithImpl(this._self, this._then);

  final _ChecklistTaskModel _self;
  final $Res Function(_ChecklistTaskModel) _then;

/// Create a copy of ChecklistTaskModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = null,Object? title = null,Object? status = null,Object? opensAt = freezed,Object? dueAt = freezed,Object? actorName = freezed,Object? actedAt = freezed,}) {
  return _then(_ChecklistTaskModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,opensAt: freezed == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as DateTime?,dueAt: freezed == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime?,actorName: freezed == actorName ? _self.actorName : actorName // ignore: cast_nullable_to_non_nullable
as String?,actedAt: freezed == actedAt ? _self.actedAt : actedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
