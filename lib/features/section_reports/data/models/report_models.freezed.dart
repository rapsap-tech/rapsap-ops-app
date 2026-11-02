// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReturnNoteModel {

 String get taskId; int get taskNumber; String get taskTitle; String get comment; DateTime get at;
/// Create a copy of ReturnNoteModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReturnNoteModelCopyWith<ReturnNoteModel> get copyWith => _$ReturnNoteModelCopyWithImpl<ReturnNoteModel>(this as ReturnNoteModel, _$identity);

  /// Serializes this ReturnNoteModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReturnNoteModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReturnNoteModel&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.taskNumber, _this.taskNumber) || other.taskNumber == _this.taskNumber)&&(identical(other.taskTitle, _this.taskTitle) || other.taskTitle == _this.taskTitle)&&(identical(other.comment, _this.comment) || other.comment == _this.comment)&&(identical(other.at, _this.at) || other.at == _this.at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReturnNoteModel;
  return Object.hash(runtimeType,_this.taskId,_this.taskNumber,_this.taskTitle,_this.comment,_this.at);
}

@override
String toString() {
  final _this = this as ReturnNoteModel;
  return 'ReturnNoteModel(taskId: ${_this.taskId}, taskNumber: ${_this.taskNumber}, taskTitle: ${_this.taskTitle}, comment: ${_this.comment}, at: ${_this.at})';
}


}

/// @nodoc
abstract mixin class $ReturnNoteModelCopyWith<$Res>  {
  factory $ReturnNoteModelCopyWith(ReturnNoteModel value, $Res Function(ReturnNoteModel) _then) = _$ReturnNoteModelCopyWithImpl;
@useResult
$Res call({
 String taskId, int taskNumber, String taskTitle, String comment, DateTime at
});




}
/// @nodoc
class _$ReturnNoteModelCopyWithImpl<$Res>
    implements $ReturnNoteModelCopyWith<$Res> {
  _$ReturnNoteModelCopyWithImpl(this._self, this._then);

  final ReturnNoteModel _self;
  final $Res Function(ReturnNoteModel) _then;

/// Create a copy of ReturnNoteModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,Object? taskNumber = null,Object? taskTitle = null,Object? comment = null,Object? at = null,}) {
  return _then(ReturnNoteModel(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,taskNumber: null == taskNumber ? _self.taskNumber : taskNumber // ignore: cast_nullable_to_non_nullable
as int,taskTitle: null == taskTitle ? _self.taskTitle : taskTitle // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [ReturnNoteModel].
extension ReturnNoteModelPatterns on ReturnNoteModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReturnNoteModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReturnNoteModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReturnNoteModel value)  $default,){
final _that = this;
switch (_that) {
case _ReturnNoteModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReturnNoteModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReturnNoteModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String taskId,  int taskNumber,  String taskTitle,  String comment,  DateTime at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReturnNoteModel() when $default != null:
return $default(_that.taskId,_that.taskNumber,_that.taskTitle,_that.comment,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String taskId,  int taskNumber,  String taskTitle,  String comment,  DateTime at)  $default,) {final _that = this;
switch (_that) {
case _ReturnNoteModel():
return $default(_that.taskId,_that.taskNumber,_that.taskTitle,_that.comment,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String taskId,  int taskNumber,  String taskTitle,  String comment,  DateTime at)?  $default,) {final _that = this;
switch (_that) {
case _ReturnNoteModel() when $default != null:
return $default(_that.taskId,_that.taskNumber,_that.taskTitle,_that.comment,_that.at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReturnNoteModel extends ReturnNoteModel {
  const _ReturnNoteModel({required this.taskId, required this.taskNumber, required this.taskTitle, required this.comment, required this.at}): super._();
  factory _ReturnNoteModel.fromJson(Map<String, dynamic> json) => _$ReturnNoteModelFromJson(json);

@override final  String taskId;
@override final  int taskNumber;
@override final  String taskTitle;
@override final  String comment;
@override final  DateTime at;

/// Create a copy of ReturnNoteModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReturnNoteModelCopyWith<_ReturnNoteModel> get copyWith => __$ReturnNoteModelCopyWithImpl<_ReturnNoteModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReturnNoteModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReturnNoteModel&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.taskNumber, taskNumber) || other.taskNumber == taskNumber)&&(identical(other.taskTitle, taskTitle) || other.taskTitle == taskTitle)&&(identical(other.comment, comment) || other.comment == comment)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,taskId,taskNumber,taskTitle,comment,at);
}

@override
String toString() {
    return 'ReturnNoteModel(taskId: $taskId, taskNumber: $taskNumber, taskTitle: $taskTitle, comment: $comment, at: $at)';
}


}

/// @nodoc
abstract mixin class _$ReturnNoteModelCopyWith<$Res> implements $ReturnNoteModelCopyWith<$Res> {
  factory _$ReturnNoteModelCopyWith(_ReturnNoteModel value, $Res Function(_ReturnNoteModel) _then) = __$ReturnNoteModelCopyWithImpl;
@override @useResult
$Res call({
 String taskId, int taskNumber, String taskTitle, String comment, DateTime at
});




}
/// @nodoc
class __$ReturnNoteModelCopyWithImpl<$Res>
    implements _$ReturnNoteModelCopyWith<$Res> {
  __$ReturnNoteModelCopyWithImpl(this._self, this._then);

  final _ReturnNoteModel _self;
  final $Res Function(_ReturnNoteModel) _then;

/// Create a copy of ReturnNoteModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? taskNumber = null,Object? taskTitle = null,Object? comment = null,Object? at = null,}) {
  return _then(_ReturnNoteModel(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,taskNumber: null == taskNumber ? _self.taskNumber : taskNumber // ignore: cast_nullable_to_non_nullable
as int,taskTitle: null == taskTitle ? _self.taskTitle : taskTitle // ignore: cast_nullable_to_non_nullable
as String,comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$SectionReportModel {

 String get id; String get section; String get status; DateTime get opensAt; DateTime get closesAt; int get done; int get total; int get notDone; int get photos; int get toVerify; int get revision; bool get includesDailySummary; DateTime? get statusAt; ReturnNoteModel? get returnNote;
/// Create a copy of SectionReportModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionReportModelCopyWith<SectionReportModel> get copyWith => _$SectionReportModelCopyWithImpl<SectionReportModel>(this as SectionReportModel, _$identity);

  /// Serializes this SectionReportModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SectionReportModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionReportModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.opensAt, _this.opensAt) || other.opensAt == _this.opensAt)&&(identical(other.closesAt, _this.closesAt) || other.closesAt == _this.closesAt)&&(identical(other.done, _this.done) || other.done == _this.done)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.notDone, _this.notDone) || other.notDone == _this.notDone)&&(identical(other.photos, _this.photos) || other.photos == _this.photos)&&(identical(other.toVerify, _this.toVerify) || other.toVerify == _this.toVerify)&&(identical(other.revision, _this.revision) || other.revision == _this.revision)&&(identical(other.includesDailySummary, _this.includesDailySummary) || other.includesDailySummary == _this.includesDailySummary)&&(identical(other.statusAt, _this.statusAt) || other.statusAt == _this.statusAt)&&(identical(other.returnNote, _this.returnNote) || other.returnNote == _this.returnNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SectionReportModel;
  return Object.hash(runtimeType,_this.id,_this.section,_this.status,_this.opensAt,_this.closesAt,_this.done,_this.total,_this.notDone,_this.photos,_this.toVerify,_this.revision,_this.includesDailySummary,_this.statusAt,_this.returnNote);
}

@override
String toString() {
  final _this = this as SectionReportModel;
  return 'SectionReportModel(id: ${_this.id}, section: ${_this.section}, status: ${_this.status}, opensAt: ${_this.opensAt}, closesAt: ${_this.closesAt}, done: ${_this.done}, total: ${_this.total}, notDone: ${_this.notDone}, photos: ${_this.photos}, toVerify: ${_this.toVerify}, revision: ${_this.revision}, includesDailySummary: ${_this.includesDailySummary}, statusAt: ${_this.statusAt}, returnNote: ${_this.returnNote})';
}


}

/// @nodoc
abstract mixin class $SectionReportModelCopyWith<$Res>  {
  factory $SectionReportModelCopyWith(SectionReportModel value, $Res Function(SectionReportModel) _then) = _$SectionReportModelCopyWithImpl;
@useResult
$Res call({
 String id, String section, String status, DateTime opensAt, DateTime closesAt, int done, int total, int notDone, int photos, int toVerify, int revision, bool includesDailySummary, DateTime? statusAt, ReturnNoteModel? returnNote
});


$ReturnNoteModelCopyWith<$Res>? get returnNote;

}
/// @nodoc
class _$SectionReportModelCopyWithImpl<$Res>
    implements $SectionReportModelCopyWith<$Res> {
  _$SectionReportModelCopyWithImpl(this._self, this._then);

  final SectionReportModel _self;
  final $Res Function(SectionReportModel) _then;

/// Create a copy of SectionReportModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? section = null,Object? status = null,Object? opensAt = null,Object? closesAt = null,Object? done = null,Object? total = null,Object? notDone = null,Object? photos = null,Object? toVerify = null,Object? revision = null,Object? includesDailySummary = null,Object? statusAt = freezed,Object? returnNote = freezed,}) {
  return _then(SectionReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,opensAt: null == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as DateTime,closesAt: null == closesAt ? _self.closesAt : closesAt // ignore: cast_nullable_to_non_nullable
as DateTime,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,notDone: null == notDone ? _self.notDone : notDone // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as int,toVerify: null == toVerify ? _self.toVerify : toVerify // ignore: cast_nullable_to_non_nullable
as int,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,includesDailySummary: null == includesDailySummary ? _self.includesDailySummary : includesDailySummary // ignore: cast_nullable_to_non_nullable
as bool,statusAt: freezed == statusAt ? _self.statusAt : statusAt // ignore: cast_nullable_to_non_nullable
as DateTime?,returnNote: freezed == returnNote ? _self.returnNote : returnNote // ignore: cast_nullable_to_non_nullable
as ReturnNoteModel?,
  ));
}
/// Create a copy of SectionReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReturnNoteModelCopyWith<$Res>? get returnNote {
    if (_self.returnNote == null) {
    return null;
  }

  return $ReturnNoteModelCopyWith<$Res>(_self.returnNote!, (value) {
    return _then(_self.copyWith(returnNote: value));
  });
}
}


/// Adds pattern-matching-related methods to [SectionReportModel].
extension SectionReportModelPatterns on SectionReportModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionReportModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionReportModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionReportModel value)  $default,){
final _that = this;
switch (_that) {
case _SectionReportModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionReportModel value)?  $default,){
final _that = this;
switch (_that) {
case _SectionReportModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String section,  String status,  DateTime opensAt,  DateTime closesAt,  int done,  int total,  int notDone,  int photos,  int toVerify,  int revision,  bool includesDailySummary,  DateTime? statusAt,  ReturnNoteModel? returnNote)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionReportModel() when $default != null:
return $default(_that.id,_that.section,_that.status,_that.opensAt,_that.closesAt,_that.done,_that.total,_that.notDone,_that.photos,_that.toVerify,_that.revision,_that.includesDailySummary,_that.statusAt,_that.returnNote);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String section,  String status,  DateTime opensAt,  DateTime closesAt,  int done,  int total,  int notDone,  int photos,  int toVerify,  int revision,  bool includesDailySummary,  DateTime? statusAt,  ReturnNoteModel? returnNote)  $default,) {final _that = this;
switch (_that) {
case _SectionReportModel():
return $default(_that.id,_that.section,_that.status,_that.opensAt,_that.closesAt,_that.done,_that.total,_that.notDone,_that.photos,_that.toVerify,_that.revision,_that.includesDailySummary,_that.statusAt,_that.returnNote);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String section,  String status,  DateTime opensAt,  DateTime closesAt,  int done,  int total,  int notDone,  int photos,  int toVerify,  int revision,  bool includesDailySummary,  DateTime? statusAt,  ReturnNoteModel? returnNote)?  $default,) {final _that = this;
switch (_that) {
case _SectionReportModel() when $default != null:
return $default(_that.id,_that.section,_that.status,_that.opensAt,_that.closesAt,_that.done,_that.total,_that.notDone,_that.photos,_that.toVerify,_that.revision,_that.includesDailySummary,_that.statusAt,_that.returnNote);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectionReportModel extends SectionReportModel {
  const _SectionReportModel({required this.id, required this.section, required this.status, required this.opensAt, required this.closesAt, required this.done, required this.total, this.notDone = 0, this.photos = 0, this.toVerify = 0, this.revision = 1, this.includesDailySummary = false, this.statusAt, this.returnNote}): super._();
  factory _SectionReportModel.fromJson(Map<String, dynamic> json) => _$SectionReportModelFromJson(json);

@override final  String id;
@override final  String section;
@override final  String status;
@override final  DateTime opensAt;
@override final  DateTime closesAt;
@override final  int done;
@override final  int total;
@override@JsonKey() final  int notDone;
@override@JsonKey() final  int photos;
@override@JsonKey() final  int toVerify;
@override@JsonKey() final  int revision;
@override@JsonKey() final  bool includesDailySummary;
@override final  DateTime? statusAt;
@override final  ReturnNoteModel? returnNote;

/// Create a copy of SectionReportModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionReportModelCopyWith<_SectionReportModel> get copyWith => __$SectionReportModelCopyWithImpl<_SectionReportModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionReportModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionReportModel&&(identical(other.id, id) || other.id == id)&&(identical(other.section, section) || other.section == section)&&(identical(other.status, status) || other.status == status)&&(identical(other.opensAt, opensAt) || other.opensAt == opensAt)&&(identical(other.closesAt, closesAt) || other.closesAt == closesAt)&&(identical(other.done, done) || other.done == done)&&(identical(other.total, total) || other.total == total)&&(identical(other.notDone, notDone) || other.notDone == notDone)&&(identical(other.photos, photos) || other.photos == photos)&&(identical(other.toVerify, toVerify) || other.toVerify == toVerify)&&(identical(other.revision, revision) || other.revision == revision)&&(identical(other.includesDailySummary, includesDailySummary) || other.includesDailySummary == includesDailySummary)&&(identical(other.statusAt, statusAt) || other.statusAt == statusAt)&&(identical(other.returnNote, returnNote) || other.returnNote == returnNote));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,section,status,opensAt,closesAt,done,total,notDone,photos,toVerify,revision,includesDailySummary,statusAt,returnNote);
}

@override
String toString() {
    return 'SectionReportModel(id: $id, section: $section, status: $status, opensAt: $opensAt, closesAt: $closesAt, done: $done, total: $total, notDone: $notDone, photos: $photos, toVerify: $toVerify, revision: $revision, includesDailySummary: $includesDailySummary, statusAt: $statusAt, returnNote: $returnNote)';
}


}

/// @nodoc
abstract mixin class _$SectionReportModelCopyWith<$Res> implements $SectionReportModelCopyWith<$Res> {
  factory _$SectionReportModelCopyWith(_SectionReportModel value, $Res Function(_SectionReportModel) _then) = __$SectionReportModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String section, String status, DateTime opensAt, DateTime closesAt, int done, int total, int notDone, int photos, int toVerify, int revision, bool includesDailySummary, DateTime? statusAt, ReturnNoteModel? returnNote
});


@override $ReturnNoteModelCopyWith<$Res>? get returnNote;

}
/// @nodoc
class __$SectionReportModelCopyWithImpl<$Res>
    implements _$SectionReportModelCopyWith<$Res> {
  __$SectionReportModelCopyWithImpl(this._self, this._then);

  final _SectionReportModel _self;
  final $Res Function(_SectionReportModel) _then;

/// Create a copy of SectionReportModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? section = null,Object? status = null,Object? opensAt = null,Object? closesAt = null,Object? done = null,Object? total = null,Object? notDone = null,Object? photos = null,Object? toVerify = null,Object? revision = null,Object? includesDailySummary = null,Object? statusAt = freezed,Object? returnNote = freezed,}) {
  return _then(_SectionReportModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,opensAt: null == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as DateTime,closesAt: null == closesAt ? _self.closesAt : closesAt // ignore: cast_nullable_to_non_nullable
as DateTime,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,notDone: null == notDone ? _self.notDone : notDone // ignore: cast_nullable_to_non_nullable
as int,photos: null == photos ? _self.photos : photos // ignore: cast_nullable_to_non_nullable
as int,toVerify: null == toVerify ? _self.toVerify : toVerify // ignore: cast_nullable_to_non_nullable
as int,revision: null == revision ? _self.revision : revision // ignore: cast_nullable_to_non_nullable
as int,includesDailySummary: null == includesDailySummary ? _self.includesDailySummary : includesDailySummary // ignore: cast_nullable_to_non_nullable
as bool,statusAt: freezed == statusAt ? _self.statusAt : statusAt // ignore: cast_nullable_to_non_nullable
as DateTime?,returnNote: freezed == returnNote ? _self.returnNote : returnNote // ignore: cast_nullable_to_non_nullable
as ReturnNoteModel?,
  ));
}

/// Create a copy of SectionReportModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReturnNoteModelCopyWith<$Res>? get returnNote {
    if (_self.returnNote == null) {
    return null;
  }

  return $ReturnNoteModelCopyWith<$Res>(_self.returnNote!, (value) {
    return _then(_self.copyWith(returnNote: value));
  });
}
}


/// @nodoc
mixin _$DailySummaryFormModel {

 int get staffTotal; num? get sales; int? get bills;
/// Create a copy of DailySummaryFormModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DailySummaryFormModelCopyWith<DailySummaryFormModel> get copyWith => _$DailySummaryFormModelCopyWithImpl<DailySummaryFormModel>(this as DailySummaryFormModel, _$identity);

  /// Serializes this DailySummaryFormModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DailySummaryFormModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DailySummaryFormModel&&(identical(other.staffTotal, _this.staffTotal) || other.staffTotal == _this.staffTotal)&&(identical(other.sales, _this.sales) || other.sales == _this.sales)&&(identical(other.bills, _this.bills) || other.bills == _this.bills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DailySummaryFormModel;
  return Object.hash(runtimeType,_this.staffTotal,_this.sales,_this.bills);
}

@override
String toString() {
  final _this = this as DailySummaryFormModel;
  return 'DailySummaryFormModel(staffTotal: ${_this.staffTotal}, sales: ${_this.sales}, bills: ${_this.bills})';
}


}

/// @nodoc
abstract mixin class $DailySummaryFormModelCopyWith<$Res>  {
  factory $DailySummaryFormModelCopyWith(DailySummaryFormModel value, $Res Function(DailySummaryFormModel) _then) = _$DailySummaryFormModelCopyWithImpl;
@useResult
$Res call({
 int staffTotal, num? sales, int? bills
});




}
/// @nodoc
class _$DailySummaryFormModelCopyWithImpl<$Res>
    implements $DailySummaryFormModelCopyWith<$Res> {
  _$DailySummaryFormModelCopyWithImpl(this._self, this._then);

  final DailySummaryFormModel _self;
  final $Res Function(DailySummaryFormModel) _then;

/// Create a copy of DailySummaryFormModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? staffTotal = null,Object? sales = freezed,Object? bills = freezed,}) {
  return _then(DailySummaryFormModel(
staffTotal: null == staffTotal ? _self.staffTotal : staffTotal // ignore: cast_nullable_to_non_nullable
as int,sales: freezed == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as num?,bills: freezed == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [DailySummaryFormModel].
extension DailySummaryFormModelPatterns on DailySummaryFormModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DailySummaryFormModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DailySummaryFormModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DailySummaryFormModel value)  $default,){
final _that = this;
switch (_that) {
case _DailySummaryFormModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DailySummaryFormModel value)?  $default,){
final _that = this;
switch (_that) {
case _DailySummaryFormModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int staffTotal,  num? sales,  int? bills)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DailySummaryFormModel() when $default != null:
return $default(_that.staffTotal,_that.sales,_that.bills);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int staffTotal,  num? sales,  int? bills)  $default,) {final _that = this;
switch (_that) {
case _DailySummaryFormModel():
return $default(_that.staffTotal,_that.sales,_that.bills);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int staffTotal,  num? sales,  int? bills)?  $default,) {final _that = this;
switch (_that) {
case _DailySummaryFormModel() when $default != null:
return $default(_that.staffTotal,_that.sales,_that.bills);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DailySummaryFormModel extends DailySummaryFormModel {
  const _DailySummaryFormModel({required this.staffTotal, this.sales, this.bills}): super._();
  factory _DailySummaryFormModel.fromJson(Map<String, dynamic> json) => _$DailySummaryFormModelFromJson(json);

@override final  int staffTotal;
@override final  num? sales;
@override final  int? bills;

/// Create a copy of DailySummaryFormModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DailySummaryFormModelCopyWith<_DailySummaryFormModel> get copyWith => __$DailySummaryFormModelCopyWithImpl<_DailySummaryFormModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DailySummaryFormModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DailySummaryFormModel&&(identical(other.staffTotal, staffTotal) || other.staffTotal == staffTotal)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.bills, bills) || other.bills == bills));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,staffTotal,sales,bills);
}

@override
String toString() {
    return 'DailySummaryFormModel(staffTotal: $staffTotal, sales: $sales, bills: $bills)';
}


}

/// @nodoc
abstract mixin class _$DailySummaryFormModelCopyWith<$Res> implements $DailySummaryFormModelCopyWith<$Res> {
  factory _$DailySummaryFormModelCopyWith(_DailySummaryFormModel value, $Res Function(_DailySummaryFormModel) _then) = __$DailySummaryFormModelCopyWithImpl;
@override @useResult
$Res call({
 int staffTotal, num? sales, int? bills
});




}
/// @nodoc
class __$DailySummaryFormModelCopyWithImpl<$Res>
    implements _$DailySummaryFormModelCopyWith<$Res> {
  __$DailySummaryFormModelCopyWithImpl(this._self, this._then);

  final _DailySummaryFormModel _self;
  final $Res Function(_DailySummaryFormModel) _then;

/// Create a copy of DailySummaryFormModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? staffTotal = null,Object? sales = freezed,Object? bills = freezed,}) {
  return _then(_DailySummaryFormModel(
staffTotal: null == staffTotal ? _self.staffTotal : staffTotal // ignore: cast_nullable_to_non_nullable
as int,sales: freezed == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as num?,bills: freezed == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$SnapshotLineModel {

 int get number; String get title; String get mark; String? get by; DateTime? get at;
/// Create a copy of SnapshotLineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SnapshotLineModelCopyWith<SnapshotLineModel> get copyWith => _$SnapshotLineModelCopyWithImpl<SnapshotLineModel>(this as SnapshotLineModel, _$identity);

  /// Serializes this SnapshotLineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SnapshotLineModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SnapshotLineModel&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.mark, _this.mark) || other.mark == _this.mark)&&(identical(other.by, _this.by) || other.by == _this.by)&&(identical(other.at, _this.at) || other.at == _this.at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SnapshotLineModel;
  return Object.hash(runtimeType,_this.number,_this.title,_this.mark,_this.by,_this.at);
}

@override
String toString() {
  final _this = this as SnapshotLineModel;
  return 'SnapshotLineModel(number: ${_this.number}, title: ${_this.title}, mark: ${_this.mark}, by: ${_this.by}, at: ${_this.at})';
}


}

/// @nodoc
abstract mixin class $SnapshotLineModelCopyWith<$Res>  {
  factory $SnapshotLineModelCopyWith(SnapshotLineModel value, $Res Function(SnapshotLineModel) _then) = _$SnapshotLineModelCopyWithImpl;
@useResult
$Res call({
 int number, String title, String mark, String? by, DateTime? at
});




}
/// @nodoc
class _$SnapshotLineModelCopyWithImpl<$Res>
    implements $SnapshotLineModelCopyWith<$Res> {
  _$SnapshotLineModelCopyWithImpl(this._self, this._then);

  final SnapshotLineModel _self;
  final $Res Function(SnapshotLineModel) _then;

/// Create a copy of SnapshotLineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? title = null,Object? mark = null,Object? by = freezed,Object? at = freezed,}) {
  return _then(SnapshotLineModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,mark: null == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as String,by: freezed == by ? _self.by : by // ignore: cast_nullable_to_non_nullable
as String?,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [SnapshotLineModel].
extension SnapshotLineModelPatterns on SnapshotLineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SnapshotLineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SnapshotLineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SnapshotLineModel value)  $default,){
final _that = this;
switch (_that) {
case _SnapshotLineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SnapshotLineModel value)?  $default,){
final _that = this;
switch (_that) {
case _SnapshotLineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int number,  String title,  String mark,  String? by,  DateTime? at)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SnapshotLineModel() when $default != null:
return $default(_that.number,_that.title,_that.mark,_that.by,_that.at);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int number,  String title,  String mark,  String? by,  DateTime? at)  $default,) {final _that = this;
switch (_that) {
case _SnapshotLineModel():
return $default(_that.number,_that.title,_that.mark,_that.by,_that.at);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int number,  String title,  String mark,  String? by,  DateTime? at)?  $default,) {final _that = this;
switch (_that) {
case _SnapshotLineModel() when $default != null:
return $default(_that.number,_that.title,_that.mark,_that.by,_that.at);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SnapshotLineModel extends SnapshotLineModel {
  const _SnapshotLineModel({required this.number, required this.title, required this.mark, this.by, this.at}): super._();
  factory _SnapshotLineModel.fromJson(Map<String, dynamic> json) => _$SnapshotLineModelFromJson(json);

@override final  int number;
@override final  String title;
@override final  String mark;
@override final  String? by;
@override final  DateTime? at;

/// Create a copy of SnapshotLineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SnapshotLineModelCopyWith<_SnapshotLineModel> get copyWith => __$SnapshotLineModelCopyWithImpl<_SnapshotLineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SnapshotLineModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SnapshotLineModel&&(identical(other.number, number) || other.number == number)&&(identical(other.title, title) || other.title == title)&&(identical(other.mark, mark) || other.mark == mark)&&(identical(other.by, by) || other.by == by)&&(identical(other.at, at) || other.at == at));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,number,title,mark,by,at);
}

@override
String toString() {
    return 'SnapshotLineModel(number: $number, title: $title, mark: $mark, by: $by, at: $at)';
}


}

/// @nodoc
abstract mixin class _$SnapshotLineModelCopyWith<$Res> implements $SnapshotLineModelCopyWith<$Res> {
  factory _$SnapshotLineModelCopyWith(_SnapshotLineModel value, $Res Function(_SnapshotLineModel) _then) = __$SnapshotLineModelCopyWithImpl;
@override @useResult
$Res call({
 int number, String title, String mark, String? by, DateTime? at
});




}
/// @nodoc
class __$SnapshotLineModelCopyWithImpl<$Res>
    implements _$SnapshotLineModelCopyWith<$Res> {
  __$SnapshotLineModelCopyWithImpl(this._self, this._then);

  final _SnapshotLineModel _self;
  final $Res Function(_SnapshotLineModel) _then;

/// Create a copy of SnapshotLineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? number = null,Object? title = null,Object? mark = null,Object? by = freezed,Object? at = freezed,}) {
  return _then(_SnapshotLineModel(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,mark: null == mark ? _self.mark : mark // ignore: cast_nullable_to_non_nullable
as String,by: freezed == by ? _self.by : by // ignore: cast_nullable_to_non_nullable
as String?,at: freezed == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PostTargetModel {

 String get conversationId; String get name;
/// Create a copy of PostTargetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PostTargetModelCopyWith<PostTargetModel> get copyWith => _$PostTargetModelCopyWithImpl<PostTargetModel>(this as PostTargetModel, _$identity);

  /// Serializes this PostTargetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PostTargetModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PostTargetModel&&(identical(other.conversationId, _this.conversationId) || other.conversationId == _this.conversationId)&&(identical(other.name, _this.name) || other.name == _this.name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PostTargetModel;
  return Object.hash(runtimeType,_this.conversationId,_this.name);
}

@override
String toString() {
  final _this = this as PostTargetModel;
  return 'PostTargetModel(conversationId: ${_this.conversationId}, name: ${_this.name})';
}


}

/// @nodoc
abstract mixin class $PostTargetModelCopyWith<$Res>  {
  factory $PostTargetModelCopyWith(PostTargetModel value, $Res Function(PostTargetModel) _then) = _$PostTargetModelCopyWithImpl;
@useResult
$Res call({
 String conversationId, String name
});




}
/// @nodoc
class _$PostTargetModelCopyWithImpl<$Res>
    implements $PostTargetModelCopyWith<$Res> {
  _$PostTargetModelCopyWithImpl(this._self, this._then);

  final PostTargetModel _self;
  final $Res Function(PostTargetModel) _then;

/// Create a copy of PostTargetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,Object? name = null,}) {
  return _then(PostTargetModel(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PostTargetModel].
extension PostTargetModelPatterns on PostTargetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PostTargetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PostTargetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PostTargetModel value)  $default,){
final _that = this;
switch (_that) {
case _PostTargetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PostTargetModel value)?  $default,){
final _that = this;
switch (_that) {
case _PostTargetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String conversationId,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PostTargetModel() when $default != null:
return $default(_that.conversationId,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String conversationId,  String name)  $default,) {final _that = this;
switch (_that) {
case _PostTargetModel():
return $default(_that.conversationId,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String conversationId,  String name)?  $default,) {final _that = this;
switch (_that) {
case _PostTargetModel() when $default != null:
return $default(_that.conversationId,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PostTargetModel extends PostTargetModel {
  const _PostTargetModel({required this.conversationId, required this.name}): super._();
  factory _PostTargetModel.fromJson(Map<String, dynamic> json) => _$PostTargetModelFromJson(json);

@override final  String conversationId;
@override final  String name;

/// Create a copy of PostTargetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PostTargetModelCopyWith<_PostTargetModel> get copyWith => __$PostTargetModelCopyWithImpl<_PostTargetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PostTargetModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PostTargetModel&&(identical(other.conversationId, conversationId) || other.conversationId == conversationId)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,conversationId,name);
}

@override
String toString() {
    return 'PostTargetModel(conversationId: $conversationId, name: $name)';
}


}

/// @nodoc
abstract mixin class _$PostTargetModelCopyWith<$Res> implements $PostTargetModelCopyWith<$Res> {
  factory _$PostTargetModelCopyWith(_PostTargetModel value, $Res Function(_PostTargetModel) _then) = __$PostTargetModelCopyWithImpl;
@override @useResult
$Res call({
 String conversationId, String name
});




}
/// @nodoc
class __$PostTargetModelCopyWithImpl<$Res>
    implements _$PostTargetModelCopyWith<$Res> {
  __$PostTargetModelCopyWithImpl(this._self, this._then);

  final _PostTargetModel _self;
  final $Res Function(_PostTargetModel) _then;

/// Create a copy of PostTargetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? conversationId = null,Object? name = null,}) {
  return _then(_PostTargetModel(
conversationId: null == conversationId ? _self.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$ReportSnapshotModel {

 String get reportId; String get title; String get storeName; DateTime get date; DateTime get opensAt; DateTime get closesAt; int get done; int get total; List<SnapshotLineModel> get lines; List<String> get photoUrls; List<PostTargetModel> get targets; DateTime? get sentAt;
/// Create a copy of ReportSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReportSnapshotModelCopyWith<ReportSnapshotModel> get copyWith => _$ReportSnapshotModelCopyWithImpl<ReportSnapshotModel>(this as ReportSnapshotModel, _$identity);

  /// Serializes this ReportSnapshotModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReportSnapshotModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReportSnapshotModel&&(identical(other.reportId, _this.reportId) || other.reportId == _this.reportId)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.storeName, _this.storeName) || other.storeName == _this.storeName)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.opensAt, _this.opensAt) || other.opensAt == _this.opensAt)&&(identical(other.closesAt, _this.closesAt) || other.closesAt == _this.closesAt)&&(identical(other.done, _this.done) || other.done == _this.done)&&(identical(other.total, _this.total) || other.total == _this.total)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&const DeepCollectionEquality().equals(other.photoUrls, _this.photoUrls)&&const DeepCollectionEquality().equals(other.targets, _this.targets)&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReportSnapshotModel;
  return Object.hash(runtimeType,_this.reportId,_this.title,_this.storeName,_this.date,_this.opensAt,_this.closesAt,_this.done,_this.total,const DeepCollectionEquality().hash(_this.lines),const DeepCollectionEquality().hash(_this.photoUrls),const DeepCollectionEquality().hash(_this.targets),_this.sentAt);
}

@override
String toString() {
  final _this = this as ReportSnapshotModel;
  return 'ReportSnapshotModel(reportId: ${_this.reportId}, title: ${_this.title}, storeName: ${_this.storeName}, date: ${_this.date}, opensAt: ${_this.opensAt}, closesAt: ${_this.closesAt}, done: ${_this.done}, total: ${_this.total}, lines: ${_this.lines}, photoUrls: ${_this.photoUrls}, targets: ${_this.targets}, sentAt: ${_this.sentAt})';
}


}

/// @nodoc
abstract mixin class $ReportSnapshotModelCopyWith<$Res>  {
  factory $ReportSnapshotModelCopyWith(ReportSnapshotModel value, $Res Function(ReportSnapshotModel) _then) = _$ReportSnapshotModelCopyWithImpl;
@useResult
$Res call({
 String reportId, String title, String storeName, DateTime date, DateTime opensAt, DateTime closesAt, int done, int total, List<SnapshotLineModel> lines, List<String> photoUrls, List<PostTargetModel> targets, DateTime? sentAt
});




}
/// @nodoc
class _$ReportSnapshotModelCopyWithImpl<$Res>
    implements $ReportSnapshotModelCopyWith<$Res> {
  _$ReportSnapshotModelCopyWithImpl(this._self, this._then);

  final ReportSnapshotModel _self;
  final $Res Function(ReportSnapshotModel) _then;

/// Create a copy of ReportSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reportId = null,Object? title = null,Object? storeName = null,Object? date = null,Object? opensAt = null,Object? closesAt = null,Object? done = null,Object? total = null,Object? lines = null,Object? photoUrls = null,Object? targets = null,Object? sentAt = freezed,}) {
  return _then(ReportSnapshotModel(
reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,opensAt: null == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as DateTime,closesAt: null == closesAt ? _self.closesAt : closesAt // ignore: cast_nullable_to_non_nullable
as DateTime,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<SnapshotLineModel>,photoUrls: null == photoUrls ? _self.photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,targets: null == targets ? _self.targets : targets // ignore: cast_nullable_to_non_nullable
as List<PostTargetModel>,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReportSnapshotModel].
extension ReportSnapshotModelPatterns on ReportSnapshotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReportSnapshotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReportSnapshotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReportSnapshotModel value)  $default,){
final _that = this;
switch (_that) {
case _ReportSnapshotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReportSnapshotModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReportSnapshotModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reportId,  String title,  String storeName,  DateTime date,  DateTime opensAt,  DateTime closesAt,  int done,  int total,  List<SnapshotLineModel> lines,  List<String> photoUrls,  List<PostTargetModel> targets,  DateTime? sentAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReportSnapshotModel() when $default != null:
return $default(_that.reportId,_that.title,_that.storeName,_that.date,_that.opensAt,_that.closesAt,_that.done,_that.total,_that.lines,_that.photoUrls,_that.targets,_that.sentAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reportId,  String title,  String storeName,  DateTime date,  DateTime opensAt,  DateTime closesAt,  int done,  int total,  List<SnapshotLineModel> lines,  List<String> photoUrls,  List<PostTargetModel> targets,  DateTime? sentAt)  $default,) {final _that = this;
switch (_that) {
case _ReportSnapshotModel():
return $default(_that.reportId,_that.title,_that.storeName,_that.date,_that.opensAt,_that.closesAt,_that.done,_that.total,_that.lines,_that.photoUrls,_that.targets,_that.sentAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reportId,  String title,  String storeName,  DateTime date,  DateTime opensAt,  DateTime closesAt,  int done,  int total,  List<SnapshotLineModel> lines,  List<String> photoUrls,  List<PostTargetModel> targets,  DateTime? sentAt)?  $default,) {final _that = this;
switch (_that) {
case _ReportSnapshotModel() when $default != null:
return $default(_that.reportId,_that.title,_that.storeName,_that.date,_that.opensAt,_that.closesAt,_that.done,_that.total,_that.lines,_that.photoUrls,_that.targets,_that.sentAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReportSnapshotModel extends ReportSnapshotModel {
  const _ReportSnapshotModel({required this.reportId, required this.title, required this.storeName, required this.date, required this.opensAt, required this.closesAt, required this.done, required this.total, required  List<SnapshotLineModel> lines,  List<String> photoUrls = const <String>[],  List<PostTargetModel> targets = const <PostTargetModel>[], this.sentAt}): _lines = lines,_photoUrls = photoUrls,_targets = targets,super._();
  factory _ReportSnapshotModel.fromJson(Map<String, dynamic> json) => _$ReportSnapshotModelFromJson(json);

@override final  String reportId;
@override final  String title;
@override final  String storeName;
@override final  DateTime date;
@override final  DateTime opensAt;
@override final  DateTime closesAt;
@override final  int done;
@override final  int total;
 final  List<SnapshotLineModel> _lines;
@override List<SnapshotLineModel> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

 final  List<String> _photoUrls;
@override@JsonKey() List<String> get photoUrls {
  if (_photoUrls is EqualUnmodifiableListView) return _photoUrls;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_photoUrls);
}

 final  List<PostTargetModel> _targets;
@override@JsonKey() List<PostTargetModel> get targets {
  if (_targets is EqualUnmodifiableListView) return _targets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targets);
}

@override final  DateTime? sentAt;

/// Create a copy of ReportSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReportSnapshotModelCopyWith<_ReportSnapshotModel> get copyWith => __$ReportSnapshotModelCopyWithImpl<_ReportSnapshotModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReportSnapshotModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReportSnapshotModel&&(identical(other.reportId, reportId) || other.reportId == reportId)&&(identical(other.title, title) || other.title == title)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.date, date) || other.date == date)&&(identical(other.opensAt, opensAt) || other.opensAt == opensAt)&&(identical(other.closesAt, closesAt) || other.closesAt == closesAt)&&(identical(other.done, done) || other.done == done)&&(identical(other.total, total) || other.total == total)&&const DeepCollectionEquality().equals(other.lines, _lines)&&const DeepCollectionEquality().equals(other.photoUrls, _photoUrls)&&const DeepCollectionEquality().equals(other.targets, _targets)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,reportId,title,storeName,date,opensAt,closesAt,done,total,const DeepCollectionEquality().hash(_lines),const DeepCollectionEquality().hash(_photoUrls),const DeepCollectionEquality().hash(_targets),sentAt);
}

@override
String toString() {
    return 'ReportSnapshotModel(reportId: $reportId, title: $title, storeName: $storeName, date: $date, opensAt: $opensAt, closesAt: $closesAt, done: $done, total: $total, lines: $lines, photoUrls: $photoUrls, targets: $targets, sentAt: $sentAt)';
}


}

/// @nodoc
abstract mixin class _$ReportSnapshotModelCopyWith<$Res> implements $ReportSnapshotModelCopyWith<$Res> {
  factory _$ReportSnapshotModelCopyWith(_ReportSnapshotModel value, $Res Function(_ReportSnapshotModel) _then) = __$ReportSnapshotModelCopyWithImpl;
@override @useResult
$Res call({
 String reportId, String title, String storeName, DateTime date, DateTime opensAt, DateTime closesAt, int done, int total, List<SnapshotLineModel> lines, List<String> photoUrls, List<PostTargetModel> targets, DateTime? sentAt
});




}
/// @nodoc
class __$ReportSnapshotModelCopyWithImpl<$Res>
    implements _$ReportSnapshotModelCopyWith<$Res> {
  __$ReportSnapshotModelCopyWithImpl(this._self, this._then);

  final _ReportSnapshotModel _self;
  final $Res Function(_ReportSnapshotModel) _then;

/// Create a copy of ReportSnapshotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reportId = null,Object? title = null,Object? storeName = null,Object? date = null,Object? opensAt = null,Object? closesAt = null,Object? done = null,Object? total = null,Object? lines = null,Object? photoUrls = null,Object? targets = null,Object? sentAt = freezed,}) {
  return _then(_ReportSnapshotModel(
reportId: null == reportId ? _self.reportId : reportId // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,opensAt: null == opensAt ? _self.opensAt : opensAt // ignore: cast_nullable_to_non_nullable
as DateTime,closesAt: null == closesAt ? _self.closesAt : closesAt // ignore: cast_nullable_to_non_nullable
as DateTime,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<SnapshotLineModel>,photoUrls: null == photoUrls ? _self._photoUrls : photoUrls // ignore: cast_nullable_to_non_nullable
as List<String>,targets: null == targets ? _self._targets : targets // ignore: cast_nullable_to_non_nullable
as List<PostTargetModel>,sentAt: freezed == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ClosingFormModel {

 String get taskId; String get walkthroughTaskId; DateTime get dueAt; DateTime get earlyBefore; List<Map<String, String>> get staff;
/// Create a copy of ClosingFormModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClosingFormModelCopyWith<ClosingFormModel> get copyWith => _$ClosingFormModelCopyWithImpl<ClosingFormModel>(this as ClosingFormModel, _$identity);

  /// Serializes this ClosingFormModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ClosingFormModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClosingFormModel&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.walkthroughTaskId, _this.walkthroughTaskId) || other.walkthroughTaskId == _this.walkthroughTaskId)&&(identical(other.dueAt, _this.dueAt) || other.dueAt == _this.dueAt)&&(identical(other.earlyBefore, _this.earlyBefore) || other.earlyBefore == _this.earlyBefore)&&const DeepCollectionEquality().equals(other.staff, _this.staff));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ClosingFormModel;
  return Object.hash(runtimeType,_this.taskId,_this.walkthroughTaskId,_this.dueAt,_this.earlyBefore,const DeepCollectionEquality().hash(_this.staff));
}

@override
String toString() {
  final _this = this as ClosingFormModel;
  return 'ClosingFormModel(taskId: ${_this.taskId}, walkthroughTaskId: ${_this.walkthroughTaskId}, dueAt: ${_this.dueAt}, earlyBefore: ${_this.earlyBefore}, staff: ${_this.staff})';
}


}

/// @nodoc
abstract mixin class $ClosingFormModelCopyWith<$Res>  {
  factory $ClosingFormModelCopyWith(ClosingFormModel value, $Res Function(ClosingFormModel) _then) = _$ClosingFormModelCopyWithImpl;
@useResult
$Res call({
 String taskId, String walkthroughTaskId, DateTime dueAt, DateTime earlyBefore, List<Map<String, String>> staff
});




}
/// @nodoc
class _$ClosingFormModelCopyWithImpl<$Res>
    implements $ClosingFormModelCopyWith<$Res> {
  _$ClosingFormModelCopyWithImpl(this._self, this._then);

  final ClosingFormModel _self;
  final $Res Function(ClosingFormModel) _then;

/// Create a copy of ClosingFormModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,Object? walkthroughTaskId = null,Object? dueAt = null,Object? earlyBefore = null,Object? staff = null,}) {
  return _then(ClosingFormModel(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,walkthroughTaskId: null == walkthroughTaskId ? _self.walkthroughTaskId : walkthroughTaskId // ignore: cast_nullable_to_non_nullable
as String,dueAt: null == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime,earlyBefore: null == earlyBefore ? _self.earlyBefore : earlyBefore // ignore: cast_nullable_to_non_nullable
as DateTime,staff: null == staff ? _self.staff : staff // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}

}


/// Adds pattern-matching-related methods to [ClosingFormModel].
extension ClosingFormModelPatterns on ClosingFormModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ClosingFormModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ClosingFormModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ClosingFormModel value)  $default,){
final _that = this;
switch (_that) {
case _ClosingFormModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ClosingFormModel value)?  $default,){
final _that = this;
switch (_that) {
case _ClosingFormModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String taskId,  String walkthroughTaskId,  DateTime dueAt,  DateTime earlyBefore,  List<Map<String, String>> staff)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ClosingFormModel() when $default != null:
return $default(_that.taskId,_that.walkthroughTaskId,_that.dueAt,_that.earlyBefore,_that.staff);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String taskId,  String walkthroughTaskId,  DateTime dueAt,  DateTime earlyBefore,  List<Map<String, String>> staff)  $default,) {final _that = this;
switch (_that) {
case _ClosingFormModel():
return $default(_that.taskId,_that.walkthroughTaskId,_that.dueAt,_that.earlyBefore,_that.staff);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String taskId,  String walkthroughTaskId,  DateTime dueAt,  DateTime earlyBefore,  List<Map<String, String>> staff)?  $default,) {final _that = this;
switch (_that) {
case _ClosingFormModel() when $default != null:
return $default(_that.taskId,_that.walkthroughTaskId,_that.dueAt,_that.earlyBefore,_that.staff);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ClosingFormModel extends ClosingFormModel {
  const _ClosingFormModel({required this.taskId, required this.walkthroughTaskId, required this.dueAt, required this.earlyBefore, required  List<Map<String, String>> staff}): _staff = staff,super._();
  factory _ClosingFormModel.fromJson(Map<String, dynamic> json) => _$ClosingFormModelFromJson(json);

@override final  String taskId;
@override final  String walkthroughTaskId;
@override final  DateTime dueAt;
@override final  DateTime earlyBefore;
 final  List<Map<String, String>> _staff;
@override List<Map<String, String>> get staff {
  if (_staff is EqualUnmodifiableListView) return _staff;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_staff);
}


/// Create a copy of ClosingFormModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ClosingFormModelCopyWith<_ClosingFormModel> get copyWith => __$ClosingFormModelCopyWithImpl<_ClosingFormModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ClosingFormModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ClosingFormModel&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.walkthroughTaskId, walkthroughTaskId) || other.walkthroughTaskId == walkthroughTaskId)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.earlyBefore, earlyBefore) || other.earlyBefore == earlyBefore)&&const DeepCollectionEquality().equals(other.staff, _staff));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,taskId,walkthroughTaskId,dueAt,earlyBefore,const DeepCollectionEquality().hash(_staff));
}

@override
String toString() {
    return 'ClosingFormModel(taskId: $taskId, walkthroughTaskId: $walkthroughTaskId, dueAt: $dueAt, earlyBefore: $earlyBefore, staff: $staff)';
}


}

/// @nodoc
abstract mixin class _$ClosingFormModelCopyWith<$Res> implements $ClosingFormModelCopyWith<$Res> {
  factory _$ClosingFormModelCopyWith(_ClosingFormModel value, $Res Function(_ClosingFormModel) _then) = __$ClosingFormModelCopyWithImpl;
@override @useResult
$Res call({
 String taskId, String walkthroughTaskId, DateTime dueAt, DateTime earlyBefore, List<Map<String, String>> staff
});




}
/// @nodoc
class __$ClosingFormModelCopyWithImpl<$Res>
    implements _$ClosingFormModelCopyWith<$Res> {
  __$ClosingFormModelCopyWithImpl(this._self, this._then);

  final _ClosingFormModel _self;
  final $Res Function(_ClosingFormModel) _then;

/// Create a copy of ClosingFormModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? walkthroughTaskId = null,Object? dueAt = null,Object? earlyBefore = null,Object? staff = null,}) {
  return _then(_ClosingFormModel(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,walkthroughTaskId: null == walkthroughTaskId ? _self.walkthroughTaskId : walkthroughTaskId // ignore: cast_nullable_to_non_nullable
as String,dueAt: null == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime,earlyBefore: null == earlyBefore ? _self.earlyBefore : earlyBefore // ignore: cast_nullable_to_non_nullable
as DateTime,staff: null == staff ? _self._staff : staff // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,
  ));
}


}

// dart format on
