// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pending_upload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PendingUploadModel {

 String get id; UploadKind get kind; String get targetId; int get taskNumber; String get taskTitle; bool get isVideo; String get captureToken; String get remarks; DateTime get savedAt; String? get videoName; UploadStatus get status; UploadRejection? get rejection;
/// Create a copy of PendingUploadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingUploadModelCopyWith<PendingUploadModel> get copyWith => _$PendingUploadModelCopyWithImpl<PendingUploadModel>(this as PendingUploadModel, _$identity);

  /// Serializes this PendingUploadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as PendingUploadModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingUploadModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.targetId, _this.targetId) || other.targetId == _this.targetId)&&(identical(other.taskNumber, _this.taskNumber) || other.taskNumber == _this.taskNumber)&&(identical(other.taskTitle, _this.taskTitle) || other.taskTitle == _this.taskTitle)&&(identical(other.isVideo, _this.isVideo) || other.isVideo == _this.isVideo)&&(identical(other.captureToken, _this.captureToken) || other.captureToken == _this.captureToken)&&(identical(other.remarks, _this.remarks) || other.remarks == _this.remarks)&&(identical(other.savedAt, _this.savedAt) || other.savedAt == _this.savedAt)&&(identical(other.videoName, _this.videoName) || other.videoName == _this.videoName)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.rejection, _this.rejection) || other.rejection == _this.rejection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as PendingUploadModel;
  return Object.hash(runtimeType,_this.id,_this.kind,_this.targetId,_this.taskNumber,_this.taskTitle,_this.isVideo,_this.captureToken,_this.remarks,_this.savedAt,_this.videoName,_this.status,_this.rejection);
}

@override
String toString() {
  final _this = this as PendingUploadModel;
  return 'PendingUploadModel(id: ${_this.id}, kind: ${_this.kind}, targetId: ${_this.targetId}, taskNumber: ${_this.taskNumber}, taskTitle: ${_this.taskTitle}, isVideo: ${_this.isVideo}, captureToken: ${_this.captureToken}, remarks: ${_this.remarks}, savedAt: ${_this.savedAt}, videoName: ${_this.videoName}, status: ${_this.status}, rejection: ${_this.rejection})';
}


}

/// @nodoc
abstract mixin class $PendingUploadModelCopyWith<$Res>  {
  factory $PendingUploadModelCopyWith(PendingUploadModel value, $Res Function(PendingUploadModel) _then) = _$PendingUploadModelCopyWithImpl;
@useResult
$Res call({
 String id, UploadKind kind, String targetId, int taskNumber, String taskTitle, bool isVideo, String captureToken, String remarks, DateTime savedAt, String? videoName, UploadStatus status, UploadRejection? rejection
});




}
/// @nodoc
class _$PendingUploadModelCopyWithImpl<$Res>
    implements $PendingUploadModelCopyWith<$Res> {
  _$PendingUploadModelCopyWithImpl(this._self, this._then);

  final PendingUploadModel _self;
  final $Res Function(PendingUploadModel) _then;

/// Create a copy of PendingUploadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? kind = null,Object? targetId = null,Object? taskNumber = null,Object? taskTitle = null,Object? isVideo = null,Object? captureToken = null,Object? remarks = null,Object? savedAt = null,Object? videoName = freezed,Object? status = null,Object? rejection = freezed,}) {
  return _then(PendingUploadModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as UploadKind,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,taskNumber: null == taskNumber ? _self.taskNumber : taskNumber // ignore: cast_nullable_to_non_nullable
as int,taskTitle: null == taskTitle ? _self.taskTitle : taskTitle // ignore: cast_nullable_to_non_nullable
as String,isVideo: null == isVideo ? _self.isVideo : isVideo // ignore: cast_nullable_to_non_nullable
as bool,captureToken: null == captureToken ? _self.captureToken : captureToken // ignore: cast_nullable_to_non_nullable
as String,remarks: null == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,videoName: freezed == videoName ? _self.videoName : videoName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UploadStatus,rejection: freezed == rejection ? _self.rejection : rejection // ignore: cast_nullable_to_non_nullable
as UploadRejection?,
  ));
}

}


/// Adds pattern-matching-related methods to [PendingUploadModel].
extension PendingUploadModelPatterns on PendingUploadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingUploadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingUploadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingUploadModel value)  $default,){
final _that = this;
switch (_that) {
case _PendingUploadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingUploadModel value)?  $default,){
final _that = this;
switch (_that) {
case _PendingUploadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  UploadKind kind,  String targetId,  int taskNumber,  String taskTitle,  bool isVideo,  String captureToken,  String remarks,  DateTime savedAt,  String? videoName,  UploadStatus status,  UploadRejection? rejection)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingUploadModel() when $default != null:
return $default(_that.id,_that.kind,_that.targetId,_that.taskNumber,_that.taskTitle,_that.isVideo,_that.captureToken,_that.remarks,_that.savedAt,_that.videoName,_that.status,_that.rejection);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  UploadKind kind,  String targetId,  int taskNumber,  String taskTitle,  bool isVideo,  String captureToken,  String remarks,  DateTime savedAt,  String? videoName,  UploadStatus status,  UploadRejection? rejection)  $default,) {final _that = this;
switch (_that) {
case _PendingUploadModel():
return $default(_that.id,_that.kind,_that.targetId,_that.taskNumber,_that.taskTitle,_that.isVideo,_that.captureToken,_that.remarks,_that.savedAt,_that.videoName,_that.status,_that.rejection);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  UploadKind kind,  String targetId,  int taskNumber,  String taskTitle,  bool isVideo,  String captureToken,  String remarks,  DateTime savedAt,  String? videoName,  UploadStatus status,  UploadRejection? rejection)?  $default,) {final _that = this;
switch (_that) {
case _PendingUploadModel() when $default != null:
return $default(_that.id,_that.kind,_that.targetId,_that.taskNumber,_that.taskTitle,_that.isVideo,_that.captureToken,_that.remarks,_that.savedAt,_that.videoName,_that.status,_that.rejection);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingUploadModel extends PendingUploadModel {
  const _PendingUploadModel({required this.id, required this.kind, required this.targetId, required this.taskNumber, required this.taskTitle, required this.isVideo, required this.captureToken, required this.remarks, required this.savedAt, this.videoName, this.status = UploadStatus.waiting, this.rejection}): super._();
  factory _PendingUploadModel.fromJson(Map<String, dynamic> json) => _$PendingUploadModelFromJson(json);

@override final  String id;
@override final  UploadKind kind;
@override final  String targetId;
@override final  int taskNumber;
@override final  String taskTitle;
@override final  bool isVideo;
@override final  String captureToken;
@override final  String remarks;
@override final  DateTime savedAt;
@override final  String? videoName;
@override@JsonKey() final  UploadStatus status;
@override final  UploadRejection? rejection;

/// Create a copy of PendingUploadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingUploadModelCopyWith<_PendingUploadModel> get copyWith => __$PendingUploadModelCopyWithImpl<_PendingUploadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingUploadModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingUploadModel&&(identical(other.id, id) || other.id == id)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.targetId, targetId) || other.targetId == targetId)&&(identical(other.taskNumber, taskNumber) || other.taskNumber == taskNumber)&&(identical(other.taskTitle, taskTitle) || other.taskTitle == taskTitle)&&(identical(other.isVideo, isVideo) || other.isVideo == isVideo)&&(identical(other.captureToken, captureToken) || other.captureToken == captureToken)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt)&&(identical(other.videoName, videoName) || other.videoName == videoName)&&(identical(other.status, status) || other.status == status)&&(identical(other.rejection, rejection) || other.rejection == rejection));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,kind,targetId,taskNumber,taskTitle,isVideo,captureToken,remarks,savedAt,videoName,status,rejection);
}

@override
String toString() {
    return 'PendingUploadModel(id: $id, kind: $kind, targetId: $targetId, taskNumber: $taskNumber, taskTitle: $taskTitle, isVideo: $isVideo, captureToken: $captureToken, remarks: $remarks, savedAt: $savedAt, videoName: $videoName, status: $status, rejection: $rejection)';
}


}

/// @nodoc
abstract mixin class _$PendingUploadModelCopyWith<$Res> implements $PendingUploadModelCopyWith<$Res> {
  factory _$PendingUploadModelCopyWith(_PendingUploadModel value, $Res Function(_PendingUploadModel) _then) = __$PendingUploadModelCopyWithImpl;
@override @useResult
$Res call({
 String id, UploadKind kind, String targetId, int taskNumber, String taskTitle, bool isVideo, String captureToken, String remarks, DateTime savedAt, String? videoName, UploadStatus status, UploadRejection? rejection
});




}
/// @nodoc
class __$PendingUploadModelCopyWithImpl<$Res>
    implements _$PendingUploadModelCopyWith<$Res> {
  __$PendingUploadModelCopyWithImpl(this._self, this._then);

  final _PendingUploadModel _self;
  final $Res Function(_PendingUploadModel) _then;

/// Create a copy of PendingUploadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? kind = null,Object? targetId = null,Object? taskNumber = null,Object? taskTitle = null,Object? isVideo = null,Object? captureToken = null,Object? remarks = null,Object? savedAt = null,Object? videoName = freezed,Object? status = null,Object? rejection = freezed,}) {
  return _then(_PendingUploadModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as UploadKind,targetId: null == targetId ? _self.targetId : targetId // ignore: cast_nullable_to_non_nullable
as String,taskNumber: null == taskNumber ? _self.taskNumber : taskNumber // ignore: cast_nullable_to_non_nullable
as int,taskTitle: null == taskTitle ? _self.taskTitle : taskTitle // ignore: cast_nullable_to_non_nullable
as String,isVideo: null == isVideo ? _self.isVideo : isVideo // ignore: cast_nullable_to_non_nullable
as bool,captureToken: null == captureToken ? _self.captureToken : captureToken // ignore: cast_nullable_to_non_nullable
as String,remarks: null == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String,savedAt: null == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime,videoName: freezed == videoName ? _self.videoName : videoName // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as UploadStatus,rejection: freezed == rejection ? _self.rejection : rejection // ignore: cast_nullable_to_non_nullable
as UploadRejection?,
  ));
}


}

// dart format on
