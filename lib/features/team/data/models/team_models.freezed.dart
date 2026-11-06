// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'team_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$JobRoleModel {

@IdConverter() String get id; String get name;
/// Create a copy of JobRoleModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobRoleModelCopyWith<JobRoleModel> get copyWith => _$JobRoleModelCopyWithImpl<JobRoleModel>(this as JobRoleModel, _$identity);

  /// Serializes this JobRoleModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JobRoleModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobRoleModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JobRoleModel;
  return Object.hash(runtimeType,_this.id,_this.name);
}

@override
String toString() {
  final _this = this as JobRoleModel;
  return 'JobRoleModel(id: ${_this.id}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $JobRoleModelCopyWith<$Res>  {
  factory $JobRoleModelCopyWith(JobRoleModel value, $Res Function(JobRoleModel) _then) = _$JobRoleModelCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String name
});




}
/// @nodoc
class _$JobRoleModelCopyWithImpl<$Res>
    implements $JobRoleModelCopyWith<$Res> {
  _$JobRoleModelCopyWithImpl(this._self, this._then);

  final JobRoleModel _self;
  final $Res Function(JobRoleModel) _then;

/// Create a copy of JobRoleModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(JobRoleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [JobRoleModel].
extension JobRoleModelPatterns on JobRoleModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobRoleModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobRoleModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobRoleModel value)  $default,){
final _that = this;
switch (_that) {
case _JobRoleModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobRoleModel value)?  $default,){
final _that = this;
switch (_that) {
case _JobRoleModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobRoleModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name)  $default,) {final _that = this;
switch (_that) {
case _JobRoleModel():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _JobRoleModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobRoleModel extends JobRoleModel {
  const _JobRoleModel({@IdConverter() required this.id, required this.name}): super._();
  factory _JobRoleModel.fromJson(Map<String, dynamic> json) => _$JobRoleModelFromJson(json);

@override@IdConverter() final  String id;
@override final  String name;

/// Create a copy of JobRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobRoleModelCopyWith<_JobRoleModel> get copyWith => __$JobRoleModelCopyWithImpl<_JobRoleModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobRoleModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobRoleModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name);
}

@override
String toString() {
    return 'JobRoleModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$JobRoleModelCopyWith<$Res> implements $JobRoleModelCopyWith<$Res> {
  factory _$JobRoleModelCopyWith(_JobRoleModel value, $Res Function(_JobRoleModel) _then) = __$JobRoleModelCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String name
});




}
/// @nodoc
class __$JobRoleModelCopyWithImpl<$Res>
    implements _$JobRoleModelCopyWith<$Res> {
  __$JobRoleModelCopyWithImpl(this._self, this._then);

  final _JobRoleModel _self;
  final $Res Function(_JobRoleModel) _then;

/// Create a copy of JobRoleModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_JobRoleModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$TaskTemplateModel {

@IdConverter() String get id; int get number; String get title;@IdConverter() List<String> get roleIds;
/// Create a copy of TaskTemplateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskTemplateModelCopyWith<TaskTemplateModel> get copyWith => _$TaskTemplateModelCopyWithImpl<TaskTemplateModel>(this as TaskTemplateModel, _$identity);

  /// Serializes this TaskTemplateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TaskTemplateModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskTemplateModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.title, _this.title) || other.title == _this.title)&&const DeepCollectionEquality().equals(other.roleIds, _this.roleIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TaskTemplateModel;
  return Object.hash(runtimeType,_this.id,_this.number,_this.title,const DeepCollectionEquality().hash(_this.roleIds));
}

@override
String toString() {
  final _this = this as TaskTemplateModel;
  return 'TaskTemplateModel(id: ${_this.id}, number: ${_this.number}, title: ${_this.title}, roleIds: ${_this.roleIds})';
}


}

/// @nodoc
abstract mixin class $TaskTemplateModelCopyWith<$Res>  {
  factory $TaskTemplateModelCopyWith(TaskTemplateModel value, $Res Function(TaskTemplateModel) _then) = _$TaskTemplateModelCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, int number, String title,@IdConverter() List<String> roleIds
});




}
/// @nodoc
class _$TaskTemplateModelCopyWithImpl<$Res>
    implements $TaskTemplateModelCopyWith<$Res> {
  _$TaskTemplateModelCopyWithImpl(this._self, this._then);

  final TaskTemplateModel _self;
  final $Res Function(TaskTemplateModel) _then;

/// Create a copy of TaskTemplateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? number = null,Object? title = null,Object? roleIds = null,}) {
  return _then(TaskTemplateModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,roleIds: null == roleIds ? _self.roleIds : roleIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [TaskTemplateModel].
extension TaskTemplateModelPatterns on TaskTemplateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskTemplateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskTemplateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskTemplateModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskTemplateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskTemplateModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskTemplateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  int number,  String title, @IdConverter()  List<String> roleIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskTemplateModel() when $default != null:
return $default(_that.id,_that.number,_that.title,_that.roleIds);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  int number,  String title, @IdConverter()  List<String> roleIds)  $default,) {final _that = this;
switch (_that) {
case _TaskTemplateModel():
return $default(_that.id,_that.number,_that.title,_that.roleIds);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  int number,  String title, @IdConverter()  List<String> roleIds)?  $default,) {final _that = this;
switch (_that) {
case _TaskTemplateModel() when $default != null:
return $default(_that.id,_that.number,_that.title,_that.roleIds);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskTemplateModel extends TaskTemplateModel {
  const _TaskTemplateModel({@IdConverter() required this.id, required this.number, required this.title, @IdConverter()  List<String> roleIds = const <String>[]}): _roleIds = roleIds,super._();
  factory _TaskTemplateModel.fromJson(Map<String, dynamic> json) => _$TaskTemplateModelFromJson(json);

@override@IdConverter() final  String id;
@override final  int number;
@override final  String title;
 final  List<String> _roleIds;
@override@JsonKey()@IdConverter() List<String> get roleIds {
  if (_roleIds is EqualUnmodifiableListView) return _roleIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roleIds);
}


/// Create a copy of TaskTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskTemplateModelCopyWith<_TaskTemplateModel> get copyWith => __$TaskTemplateModelCopyWithImpl<_TaskTemplateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskTemplateModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskTemplateModel&&(identical(other.id, id) || other.id == id)&&(identical(other.number, number) || other.number == number)&&(identical(other.title, title) || other.title == title)&&const DeepCollectionEquality().equals(other.roleIds, _roleIds));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,number,title,const DeepCollectionEquality().hash(_roleIds));
}

@override
String toString() {
    return 'TaskTemplateModel(id: $id, number: $number, title: $title, roleIds: $roleIds)';
}


}

/// @nodoc
abstract mixin class _$TaskTemplateModelCopyWith<$Res> implements $TaskTemplateModelCopyWith<$Res> {
  factory _$TaskTemplateModelCopyWith(_TaskTemplateModel value, $Res Function(_TaskTemplateModel) _then) = __$TaskTemplateModelCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, int number, String title,@IdConverter() List<String> roleIds
});




}
/// @nodoc
class __$TaskTemplateModelCopyWithImpl<$Res>
    implements _$TaskTemplateModelCopyWith<$Res> {
  __$TaskTemplateModelCopyWithImpl(this._self, this._then);

  final _TaskTemplateModel _self;
  final $Res Function(_TaskTemplateModel) _then;

/// Create a copy of TaskTemplateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? number = null,Object? title = null,Object? roleIds = null,}) {
  return _then(_TaskTemplateModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,roleIds: null == roleIds ? _self._roleIds : roleIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$RoleCatalogModel {

 List<JobRoleModel> get roles; List<TaskTemplateModel> get tasks;
/// Create a copy of RoleCatalogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RoleCatalogModelCopyWith<RoleCatalogModel> get copyWith => _$RoleCatalogModelCopyWithImpl<RoleCatalogModel>(this as RoleCatalogModel, _$identity);

  /// Serializes this RoleCatalogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RoleCatalogModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RoleCatalogModel&&const DeepCollectionEquality().equals(other.roles, _this.roles)&&const DeepCollectionEquality().equals(other.tasks, _this.tasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RoleCatalogModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.roles),const DeepCollectionEquality().hash(_this.tasks));
}

@override
String toString() {
  final _this = this as RoleCatalogModel;
  return 'RoleCatalogModel(roles: ${_this.roles}, tasks: ${_this.tasks})';
}


}

/// @nodoc
abstract mixin class $RoleCatalogModelCopyWith<$Res>  {
  factory $RoleCatalogModelCopyWith(RoleCatalogModel value, $Res Function(RoleCatalogModel) _then) = _$RoleCatalogModelCopyWithImpl;
@useResult
$Res call({
 List<JobRoleModel> roles, List<TaskTemplateModel> tasks
});




}
/// @nodoc
class _$RoleCatalogModelCopyWithImpl<$Res>
    implements $RoleCatalogModelCopyWith<$Res> {
  _$RoleCatalogModelCopyWithImpl(this._self, this._then);

  final RoleCatalogModel _self;
  final $Res Function(RoleCatalogModel) _then;

/// Create a copy of RoleCatalogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? roles = null,Object? tasks = null,}) {
  return _then(RoleCatalogModel(
roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<JobRoleModel>,tasks: null == tasks ? _self.tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskTemplateModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [RoleCatalogModel].
extension RoleCatalogModelPatterns on RoleCatalogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RoleCatalogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RoleCatalogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RoleCatalogModel value)  $default,){
final _that = this;
switch (_that) {
case _RoleCatalogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RoleCatalogModel value)?  $default,){
final _that = this;
switch (_that) {
case _RoleCatalogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<JobRoleModel> roles,  List<TaskTemplateModel> tasks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RoleCatalogModel() when $default != null:
return $default(_that.roles,_that.tasks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<JobRoleModel> roles,  List<TaskTemplateModel> tasks)  $default,) {final _that = this;
switch (_that) {
case _RoleCatalogModel():
return $default(_that.roles,_that.tasks);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<JobRoleModel> roles,  List<TaskTemplateModel> tasks)?  $default,) {final _that = this;
switch (_that) {
case _RoleCatalogModel() when $default != null:
return $default(_that.roles,_that.tasks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RoleCatalogModel extends RoleCatalogModel {
  const _RoleCatalogModel({required  List<JobRoleModel> roles, required  List<TaskTemplateModel> tasks}): _roles = roles,_tasks = tasks,super._();
  factory _RoleCatalogModel.fromJson(Map<String, dynamic> json) => _$RoleCatalogModelFromJson(json);

 final  List<JobRoleModel> _roles;
@override List<JobRoleModel> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

 final  List<TaskTemplateModel> _tasks;
@override List<TaskTemplateModel> get tasks {
  if (_tasks is EqualUnmodifiableListView) return _tasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tasks);
}


/// Create a copy of RoleCatalogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RoleCatalogModelCopyWith<_RoleCatalogModel> get copyWith => __$RoleCatalogModelCopyWithImpl<_RoleCatalogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RoleCatalogModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RoleCatalogModel&&const DeepCollectionEquality().equals(other.roles, _roles)&&const DeepCollectionEquality().equals(other.tasks, _tasks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_roles),const DeepCollectionEquality().hash(_tasks));
}

@override
String toString() {
    return 'RoleCatalogModel(roles: $roles, tasks: $tasks)';
}


}

/// @nodoc
abstract mixin class _$RoleCatalogModelCopyWith<$Res> implements $RoleCatalogModelCopyWith<$Res> {
  factory _$RoleCatalogModelCopyWith(_RoleCatalogModel value, $Res Function(_RoleCatalogModel) _then) = __$RoleCatalogModelCopyWithImpl;
@override @useResult
$Res call({
 List<JobRoleModel> roles, List<TaskTemplateModel> tasks
});




}
/// @nodoc
class __$RoleCatalogModelCopyWithImpl<$Res>
    implements _$RoleCatalogModelCopyWith<$Res> {
  __$RoleCatalogModelCopyWithImpl(this._self, this._then);

  final _RoleCatalogModel _self;
  final $Res Function(_RoleCatalogModel) _then;

/// Create a copy of RoleCatalogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? roles = null,Object? tasks = null,}) {
  return _then(_RoleCatalogModel(
roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<JobRoleModel>,tasks: null == tasks ? _self._tasks : tasks // ignore: cast_nullable_to_non_nullable
as List<TaskTemplateModel>,
  ));
}


}


/// @nodoc
mixin _$TeamMemberModel {

@IdConverter() String get id; String get name; String get status; String get phone; List<String> get roles; DateTime? get since;
/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TeamMemberModelCopyWith<TeamMemberModel> get copyWith => _$TeamMemberModelCopyWithImpl<TeamMemberModel>(this as TeamMemberModel, _$identity);

  /// Serializes this TeamMemberModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TeamMemberModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TeamMemberModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&const DeepCollectionEquality().equals(other.roles, _this.roles)&&(identical(other.since, _this.since) || other.since == _this.since));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TeamMemberModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.status,_this.phone,const DeepCollectionEquality().hash(_this.roles),_this.since);
}

@override
String toString() {
  final _this = this as TeamMemberModel;
  return 'TeamMemberModel(id: ${_this.id}, name: ${_this.name}, status: ${_this.status}, phone: ${_this.phone}, roles: ${_this.roles}, since: ${_this.since})';
}


}

/// @nodoc
abstract mixin class $TeamMemberModelCopyWith<$Res>  {
  factory $TeamMemberModelCopyWith(TeamMemberModel value, $Res Function(TeamMemberModel) _then) = _$TeamMemberModelCopyWithImpl;
@useResult
$Res call({
@IdConverter() String id, String name, String status, String phone, List<String> roles, DateTime? since
});




}
/// @nodoc
class _$TeamMemberModelCopyWithImpl<$Res>
    implements $TeamMemberModelCopyWith<$Res> {
  _$TeamMemberModelCopyWithImpl(this._self, this._then);

  final TeamMemberModel _self;
  final $Res Function(TeamMemberModel) _then;

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? phone = null,Object? roles = null,Object? since = freezed,}) {
  return _then(TeamMemberModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self.roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TeamMemberModel].
extension TeamMemberModelPatterns on TeamMemberModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TeamMemberModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TeamMemberModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TeamMemberModel value)  $default,){
final _that = this;
switch (_that) {
case _TeamMemberModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TeamMemberModel value)?  $default,){
final _that = this;
switch (_that) {
case _TeamMemberModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String status,  String phone,  List<String> roles,  DateTime? since)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TeamMemberModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.phone,_that.roles,_that.since);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String id,  String name,  String status,  String phone,  List<String> roles,  DateTime? since)  $default,) {final _that = this;
switch (_that) {
case _TeamMemberModel():
return $default(_that.id,_that.name,_that.status,_that.phone,_that.roles,_that.since);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String id,  String name,  String status,  String phone,  List<String> roles,  DateTime? since)?  $default,) {final _that = this;
switch (_that) {
case _TeamMemberModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.phone,_that.roles,_that.since);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TeamMemberModel extends TeamMemberModel {
  const _TeamMemberModel({@IdConverter() required this.id, required this.name, required this.status, this.phone = '',  List<String> roles = const <String>[], this.since}): _roles = roles,super._();
  factory _TeamMemberModel.fromJson(Map<String, dynamic> json) => _$TeamMemberModelFromJson(json);

@override@IdConverter() final  String id;
@override final  String name;
@override final  String status;
@override@JsonKey() final  String phone;
 final  List<String> _roles;
@override@JsonKey() List<String> get roles {
  if (_roles is EqualUnmodifiableListView) return _roles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_roles);
}

@override final  DateTime? since;

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TeamMemberModelCopyWith<_TeamMemberModel> get copyWith => __$TeamMemberModelCopyWithImpl<_TeamMemberModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TeamMemberModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TeamMemberModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other.roles, _roles)&&(identical(other.since, since) || other.since == since));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,status,phone,const DeepCollectionEquality().hash(_roles),since);
}

@override
String toString() {
    return 'TeamMemberModel(id: $id, name: $name, status: $status, phone: $phone, roles: $roles, since: $since)';
}


}

/// @nodoc
abstract mixin class _$TeamMemberModelCopyWith<$Res> implements $TeamMemberModelCopyWith<$Res> {
  factory _$TeamMemberModelCopyWith(_TeamMemberModel value, $Res Function(_TeamMemberModel) _then) = __$TeamMemberModelCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String id, String name, String status, String phone, List<String> roles, DateTime? since
});




}
/// @nodoc
class __$TeamMemberModelCopyWithImpl<$Res>
    implements _$TeamMemberModelCopyWith<$Res> {
  __$TeamMemberModelCopyWithImpl(this._self, this._then);

  final _TeamMemberModel _self;
  final $Res Function(_TeamMemberModel) _then;

/// Create a copy of TeamMemberModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? phone = null,Object? roles = null,Object? since = freezed,}) {
  return _then(_TeamMemberModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,roles: null == roles ? _self._roles : roles // ignore: cast_nullable_to_non_nullable
as List<String>,since: freezed == since ? _self.since : since // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
