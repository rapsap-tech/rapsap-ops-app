// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TaskDetailModel {

 ChecklistTaskModel get task; String get section; String get assignedTo; String get photoHint; String get managerName; String get checklistGroup; SendBackNoteModel? get sendBack; String? get photoUrl; String? get videoUrl; String? get remarks; DateTime? get lockedAt;
/// Create a copy of TaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TaskDetailModelCopyWith<TaskDetailModel> get copyWith => _$TaskDetailModelCopyWithImpl<TaskDetailModel>(this as TaskDetailModel, _$identity);

  /// Serializes this TaskDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TaskDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TaskDetailModel&&(identical(other.task, _this.task) || other.task == _this.task)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.assignedTo, _this.assignedTo) || other.assignedTo == _this.assignedTo)&&(identical(other.photoHint, _this.photoHint) || other.photoHint == _this.photoHint)&&(identical(other.managerName, _this.managerName) || other.managerName == _this.managerName)&&(identical(other.checklistGroup, _this.checklistGroup) || other.checklistGroup == _this.checklistGroup)&&(identical(other.sendBack, _this.sendBack) || other.sendBack == _this.sendBack)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.videoUrl, _this.videoUrl) || other.videoUrl == _this.videoUrl)&&(identical(other.remarks, _this.remarks) || other.remarks == _this.remarks)&&(identical(other.lockedAt, _this.lockedAt) || other.lockedAt == _this.lockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TaskDetailModel;
  return Object.hash(runtimeType,_this.task,_this.section,_this.assignedTo,_this.photoHint,_this.managerName,_this.checklistGroup,_this.sendBack,_this.photoUrl,_this.videoUrl,_this.remarks,_this.lockedAt);
}

@override
String toString() {
  final _this = this as TaskDetailModel;
  return 'TaskDetailModel(task: ${_this.task}, section: ${_this.section}, assignedTo: ${_this.assignedTo}, photoHint: ${_this.photoHint}, managerName: ${_this.managerName}, checklistGroup: ${_this.checklistGroup}, sendBack: ${_this.sendBack}, photoUrl: ${_this.photoUrl}, videoUrl: ${_this.videoUrl}, remarks: ${_this.remarks}, lockedAt: ${_this.lockedAt})';
}


}

/// @nodoc
abstract mixin class $TaskDetailModelCopyWith<$Res>  {
  factory $TaskDetailModelCopyWith(TaskDetailModel value, $Res Function(TaskDetailModel) _then) = _$TaskDetailModelCopyWithImpl;
@useResult
$Res call({
 ChecklistTaskModel task, String section, String assignedTo, String photoHint, String managerName, String checklistGroup, SendBackNoteModel? sendBack, String? photoUrl, String? videoUrl, String? remarks, DateTime? lockedAt
});


$ChecklistTaskModelCopyWith<$Res> get task;$SendBackNoteModelCopyWith<$Res>? get sendBack;

}
/// @nodoc
class _$TaskDetailModelCopyWithImpl<$Res>
    implements $TaskDetailModelCopyWith<$Res> {
  _$TaskDetailModelCopyWithImpl(this._self, this._then);

  final TaskDetailModel _self;
  final $Res Function(TaskDetailModel) _then;

/// Create a copy of TaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? task = null,Object? section = null,Object? assignedTo = null,Object? photoHint = null,Object? managerName = null,Object? checklistGroup = null,Object? sendBack = freezed,Object? photoUrl = freezed,Object? videoUrl = freezed,Object? remarks = freezed,Object? lockedAt = freezed,}) {
  return _then(TaskDetailModel(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as ChecklistTaskModel,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,assignedTo: null == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as String,photoHint: null == photoHint ? _self.photoHint : photoHint // ignore: cast_nullable_to_non_nullable
as String,managerName: null == managerName ? _self.managerName : managerName // ignore: cast_nullable_to_non_nullable
as String,checklistGroup: null == checklistGroup ? _self.checklistGroup : checklistGroup // ignore: cast_nullable_to_non_nullable
as String,sendBack: freezed == sendBack ? _self.sendBack : sendBack // ignore: cast_nullable_to_non_nullable
as SendBackNoteModel?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,lockedAt: freezed == lockedAt ? _self.lockedAt : lockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of TaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChecklistTaskModelCopyWith<$Res> get task {
  
  return $ChecklistTaskModelCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}/// Create a copy of TaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SendBackNoteModelCopyWith<$Res>? get sendBack {
    if (_self.sendBack == null) {
    return null;
  }

  return $SendBackNoteModelCopyWith<$Res>(_self.sendBack!, (value) {
    return _then(_self.copyWith(sendBack: value));
  });
}
}


/// Adds pattern-matching-related methods to [TaskDetailModel].
extension TaskDetailModelPatterns on TaskDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TaskDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TaskDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TaskDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _TaskDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TaskDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _TaskDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ChecklistTaskModel task,  String section,  String assignedTo,  String photoHint,  String managerName,  String checklistGroup,  SendBackNoteModel? sendBack,  String? photoUrl,  String? videoUrl,  String? remarks,  DateTime? lockedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TaskDetailModel() when $default != null:
return $default(_that.task,_that.section,_that.assignedTo,_that.photoHint,_that.managerName,_that.checklistGroup,_that.sendBack,_that.photoUrl,_that.videoUrl,_that.remarks,_that.lockedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ChecklistTaskModel task,  String section,  String assignedTo,  String photoHint,  String managerName,  String checklistGroup,  SendBackNoteModel? sendBack,  String? photoUrl,  String? videoUrl,  String? remarks,  DateTime? lockedAt)  $default,) {final _that = this;
switch (_that) {
case _TaskDetailModel():
return $default(_that.task,_that.section,_that.assignedTo,_that.photoHint,_that.managerName,_that.checklistGroup,_that.sendBack,_that.photoUrl,_that.videoUrl,_that.remarks,_that.lockedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ChecklistTaskModel task,  String section,  String assignedTo,  String photoHint,  String managerName,  String checklistGroup,  SendBackNoteModel? sendBack,  String? photoUrl,  String? videoUrl,  String? remarks,  DateTime? lockedAt)?  $default,) {final _that = this;
switch (_that) {
case _TaskDetailModel() when $default != null:
return $default(_that.task,_that.section,_that.assignedTo,_that.photoHint,_that.managerName,_that.checklistGroup,_that.sendBack,_that.photoUrl,_that.videoUrl,_that.remarks,_that.lockedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TaskDetailModel extends TaskDetailModel {
  const _TaskDetailModel({required this.task, required this.section, this.assignedTo = '', this.photoHint = '', this.managerName = '', this.checklistGroup = '', this.sendBack, this.photoUrl, this.videoUrl, this.remarks, this.lockedAt}): super._();
  factory _TaskDetailModel.fromJson(Map<String, dynamic> json) => _$TaskDetailModelFromJson(json);

@override final  ChecklistTaskModel task;
@override final  String section;
@override@JsonKey() final  String assignedTo;
@override@JsonKey() final  String photoHint;
@override@JsonKey() final  String managerName;
@override@JsonKey() final  String checklistGroup;
@override final  SendBackNoteModel? sendBack;
@override final  String? photoUrl;
@override final  String? videoUrl;
@override final  String? remarks;
@override final  DateTime? lockedAt;

/// Create a copy of TaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TaskDetailModelCopyWith<_TaskDetailModel> get copyWith => __$TaskDetailModelCopyWithImpl<_TaskDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TaskDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TaskDetailModel&&(identical(other.task, task) || other.task == task)&&(identical(other.section, section) || other.section == section)&&(identical(other.assignedTo, assignedTo) || other.assignedTo == assignedTo)&&(identical(other.photoHint, photoHint) || other.photoHint == photoHint)&&(identical(other.managerName, managerName) || other.managerName == managerName)&&(identical(other.checklistGroup, checklistGroup) || other.checklistGroup == checklistGroup)&&(identical(other.sendBack, sendBack) || other.sendBack == sendBack)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.lockedAt, lockedAt) || other.lockedAt == lockedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,task,section,assignedTo,photoHint,managerName,checklistGroup,sendBack,photoUrl,videoUrl,remarks,lockedAt);
}

@override
String toString() {
    return 'TaskDetailModel(task: $task, section: $section, assignedTo: $assignedTo, photoHint: $photoHint, managerName: $managerName, checklistGroup: $checklistGroup, sendBack: $sendBack, photoUrl: $photoUrl, videoUrl: $videoUrl, remarks: $remarks, lockedAt: $lockedAt)';
}


}

/// @nodoc
abstract mixin class _$TaskDetailModelCopyWith<$Res> implements $TaskDetailModelCopyWith<$Res> {
  factory _$TaskDetailModelCopyWith(_TaskDetailModel value, $Res Function(_TaskDetailModel) _then) = __$TaskDetailModelCopyWithImpl;
@override @useResult
$Res call({
 ChecklistTaskModel task, String section, String assignedTo, String photoHint, String managerName, String checklistGroup, SendBackNoteModel? sendBack, String? photoUrl, String? videoUrl, String? remarks, DateTime? lockedAt
});


@override $ChecklistTaskModelCopyWith<$Res> get task;@override $SendBackNoteModelCopyWith<$Res>? get sendBack;

}
/// @nodoc
class __$TaskDetailModelCopyWithImpl<$Res>
    implements _$TaskDetailModelCopyWith<$Res> {
  __$TaskDetailModelCopyWithImpl(this._self, this._then);

  final _TaskDetailModel _self;
  final $Res Function(_TaskDetailModel) _then;

/// Create a copy of TaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? task = null,Object? section = null,Object? assignedTo = null,Object? photoHint = null,Object? managerName = null,Object? checklistGroup = null,Object? sendBack = freezed,Object? photoUrl = freezed,Object? videoUrl = freezed,Object? remarks = freezed,Object? lockedAt = freezed,}) {
  return _then(_TaskDetailModel(
task: null == task ? _self.task : task // ignore: cast_nullable_to_non_nullable
as ChecklistTaskModel,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,assignedTo: null == assignedTo ? _self.assignedTo : assignedTo // ignore: cast_nullable_to_non_nullable
as String,photoHint: null == photoHint ? _self.photoHint : photoHint // ignore: cast_nullable_to_non_nullable
as String,managerName: null == managerName ? _self.managerName : managerName // ignore: cast_nullable_to_non_nullable
as String,checklistGroup: null == checklistGroup ? _self.checklistGroup : checklistGroup // ignore: cast_nullable_to_non_nullable
as String,sendBack: freezed == sendBack ? _self.sendBack : sendBack // ignore: cast_nullable_to_non_nullable
as SendBackNoteModel?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,lockedAt: freezed == lockedAt ? _self.lockedAt : lockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of TaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ChecklistTaskModelCopyWith<$Res> get task {
  
  return $ChecklistTaskModelCopyWith<$Res>(_self.task, (value) {
    return _then(_self.copyWith(task: value));
  });
}/// Create a copy of TaskDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SendBackNoteModelCopyWith<$Res>? get sendBack {
    if (_self.sendBack == null) {
    return null;
  }

  return $SendBackNoteModelCopyWith<$Res>(_self.sendBack!, (value) {
    return _then(_self.copyWith(sendBack: value));
  });
}
}


/// @nodoc
mixin _$SendBackNoteModel {

 String get by; DateTime get at; String get reason;
/// Create a copy of SendBackNoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SendBackNoteModelCopyWith<SendBackNoteModel> get copyWith => _$SendBackNoteModelCopyWithImpl<SendBackNoteModel>(this as SendBackNoteModel, _$identity);

  /// Serializes this SendBackNoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SendBackNoteModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SendBackNoteModel&&(identical(other.by, _this.by) || other.by == _this.by)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SendBackNoteModel;
  return Object.hash(runtimeType,_this.by,_this.at,_this.reason);
}

@override
String toString() {
  final _this = this as SendBackNoteModel;
  return 'SendBackNoteModel(by: ${_this.by}, at: ${_this.at}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $SendBackNoteModelCopyWith<$Res>  {
  factory $SendBackNoteModelCopyWith(SendBackNoteModel value, $Res Function(SendBackNoteModel) _then) = _$SendBackNoteModelCopyWithImpl;
@useResult
$Res call({
 String by, DateTime at, String reason
});




}
/// @nodoc
class _$SendBackNoteModelCopyWithImpl<$Res>
    implements $SendBackNoteModelCopyWith<$Res> {
  _$SendBackNoteModelCopyWithImpl(this._self, this._then);

  final SendBackNoteModel _self;
  final $Res Function(SendBackNoteModel) _then;

/// Create a copy of SendBackNoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? by = null,Object? at = null,Object? reason = null,}) {
  return _then(SendBackNoteModel(
by: null == by ? _self.by : by // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SendBackNoteModel].
extension SendBackNoteModelPatterns on SendBackNoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SendBackNoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SendBackNoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SendBackNoteModel value)  $default,){
final _that = this;
switch (_that) {
case _SendBackNoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SendBackNoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _SendBackNoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String by,  DateTime at,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SendBackNoteModel() when $default != null:
return $default(_that.by,_that.at,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String by,  DateTime at,  String reason)  $default,) {final _that = this;
switch (_that) {
case _SendBackNoteModel():
return $default(_that.by,_that.at,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String by,  DateTime at,  String reason)?  $default,) {final _that = this;
switch (_that) {
case _SendBackNoteModel() when $default != null:
return $default(_that.by,_that.at,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SendBackNoteModel extends SendBackNoteModel {
  const _SendBackNoteModel({required this.by, required this.at, required this.reason}): super._();
  factory _SendBackNoteModel.fromJson(Map<String, dynamic> json) => _$SendBackNoteModelFromJson(json);

@override final  String by;
@override final  DateTime at;
@override final  String reason;

/// Create a copy of SendBackNoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SendBackNoteModelCopyWith<_SendBackNoteModel> get copyWith => __$SendBackNoteModelCopyWithImpl<_SendBackNoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SendBackNoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendBackNoteModel&&(identical(other.by, by) || other.by == by)&&(identical(other.at, at) || other.at == at)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,by,at,reason);
}

@override
String toString() {
    return 'SendBackNoteModel(by: $by, at: $at, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$SendBackNoteModelCopyWith<$Res> implements $SendBackNoteModelCopyWith<$Res> {
  factory _$SendBackNoteModelCopyWith(_SendBackNoteModel value, $Res Function(_SendBackNoteModel) _then) = __$SendBackNoteModelCopyWithImpl;
@override @useResult
$Res call({
 String by, DateTime at, String reason
});




}
/// @nodoc
class __$SendBackNoteModelCopyWithImpl<$Res>
    implements _$SendBackNoteModelCopyWith<$Res> {
  __$SendBackNoteModelCopyWithImpl(this._self, this._then);

  final _SendBackNoteModel _self;
  final $Res Function(_SendBackNoteModel) _then;

/// Create a copy of SendBackNoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? by = null,Object? at = null,Object? reason = null,}) {
  return _then(_SendBackNoteModel(
by: null == by ? _self.by : by // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
