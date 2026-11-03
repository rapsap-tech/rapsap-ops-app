// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ConversationModel {

 String get id; String get title; String get kind; int get memberCount; int get unread; bool get muted; bool get canPost; String? get lastPreview; DateTime? get lastAt; String? get pinnedText;
/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ConversationModelCopyWith<ConversationModel> get copyWith => _$ConversationModelCopyWithImpl<ConversationModel>(this as ConversationModel, _$identity);

  /// Serializes this ConversationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ConversationModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ConversationModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.memberCount, _this.memberCount) || other.memberCount == _this.memberCount)&&(identical(other.unread, _this.unread) || other.unread == _this.unread)&&(identical(other.muted, _this.muted) || other.muted == _this.muted)&&(identical(other.canPost, _this.canPost) || other.canPost == _this.canPost)&&(identical(other.lastPreview, _this.lastPreview) || other.lastPreview == _this.lastPreview)&&(identical(other.lastAt, _this.lastAt) || other.lastAt == _this.lastAt)&&(identical(other.pinnedText, _this.pinnedText) || other.pinnedText == _this.pinnedText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ConversationModel;
  return Object.hash(runtimeType,_this.id,_this.title,_this.kind,_this.memberCount,_this.unread,_this.muted,_this.canPost,_this.lastPreview,_this.lastAt,_this.pinnedText);
}

@override
String toString() {
  final _this = this as ConversationModel;
  return 'ConversationModel(id: ${_this.id}, title: ${_this.title}, kind: ${_this.kind}, memberCount: ${_this.memberCount}, unread: ${_this.unread}, muted: ${_this.muted}, canPost: ${_this.canPost}, lastPreview: ${_this.lastPreview}, lastAt: ${_this.lastAt}, pinnedText: ${_this.pinnedText})';
}


}

/// @nodoc
abstract mixin class $ConversationModelCopyWith<$Res>  {
  factory $ConversationModelCopyWith(ConversationModel value, $Res Function(ConversationModel) _then) = _$ConversationModelCopyWithImpl;
@useResult
$Res call({
 String id, String title, String kind, int memberCount, int unread, bool muted, bool canPost, String? lastPreview, DateTime? lastAt, String? pinnedText
});




}
/// @nodoc
class _$ConversationModelCopyWithImpl<$Res>
    implements $ConversationModelCopyWith<$Res> {
  _$ConversationModelCopyWithImpl(this._self, this._then);

  final ConversationModel _self;
  final $Res Function(ConversationModel) _then;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? kind = null,Object? memberCount = null,Object? unread = null,Object? muted = null,Object? canPost = null,Object? lastPreview = freezed,Object? lastAt = freezed,Object? pinnedText = freezed,}) {
  return _then(ConversationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as bool,canPost: null == canPost ? _self.canPost : canPost // ignore: cast_nullable_to_non_nullable
as bool,lastPreview: freezed == lastPreview ? _self.lastPreview : lastPreview // ignore: cast_nullable_to_non_nullable
as String?,lastAt: freezed == lastAt ? _self.lastAt : lastAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pinnedText: freezed == pinnedText ? _self.pinnedText : pinnedText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ConversationModel].
extension ConversationModelPatterns on ConversationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ConversationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ConversationModel value)  $default,){
final _that = this;
switch (_that) {
case _ConversationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ConversationModel value)?  $default,){
final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String title,  String kind,  int memberCount,  int unread,  bool muted,  bool canPost,  String? lastPreview,  DateTime? lastAt,  String? pinnedText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
return $default(_that.id,_that.title,_that.kind,_that.memberCount,_that.unread,_that.muted,_that.canPost,_that.lastPreview,_that.lastAt,_that.pinnedText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String title,  String kind,  int memberCount,  int unread,  bool muted,  bool canPost,  String? lastPreview,  DateTime? lastAt,  String? pinnedText)  $default,) {final _that = this;
switch (_that) {
case _ConversationModel():
return $default(_that.id,_that.title,_that.kind,_that.memberCount,_that.unread,_that.muted,_that.canPost,_that.lastPreview,_that.lastAt,_that.pinnedText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String title,  String kind,  int memberCount,  int unread,  bool muted,  bool canPost,  String? lastPreview,  DateTime? lastAt,  String? pinnedText)?  $default,) {final _that = this;
switch (_that) {
case _ConversationModel() when $default != null:
return $default(_that.id,_that.title,_that.kind,_that.memberCount,_that.unread,_that.muted,_that.canPost,_that.lastPreview,_that.lastAt,_that.pinnedText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ConversationModel extends ConversationModel {
  const _ConversationModel({required this.id, required this.title, required this.kind, this.memberCount = 0, this.unread = 0, this.muted = false, this.canPost = true, this.lastPreview, this.lastAt, this.pinnedText}): super._();
  factory _ConversationModel.fromJson(Map<String, dynamic> json) => _$ConversationModelFromJson(json);

@override final  String id;
@override final  String title;
@override final  String kind;
@override@JsonKey() final  int memberCount;
@override@JsonKey() final  int unread;
@override@JsonKey() final  bool muted;
@override@JsonKey() final  bool canPost;
@override final  String? lastPreview;
@override final  DateTime? lastAt;
@override final  String? pinnedText;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ConversationModelCopyWith<_ConversationModel> get copyWith => __$ConversationModelCopyWithImpl<_ConversationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ConversationModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ConversationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.memberCount, memberCount) || other.memberCount == memberCount)&&(identical(other.unread, unread) || other.unread == unread)&&(identical(other.muted, muted) || other.muted == muted)&&(identical(other.canPost, canPost) || other.canPost == canPost)&&(identical(other.lastPreview, lastPreview) || other.lastPreview == lastPreview)&&(identical(other.lastAt, lastAt) || other.lastAt == lastAt)&&(identical(other.pinnedText, pinnedText) || other.pinnedText == pinnedText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,kind,memberCount,unread,muted,canPost,lastPreview,lastAt,pinnedText);
}

@override
String toString() {
    return 'ConversationModel(id: $id, title: $title, kind: $kind, memberCount: $memberCount, unread: $unread, muted: $muted, canPost: $canPost, lastPreview: $lastPreview, lastAt: $lastAt, pinnedText: $pinnedText)';
}


}

/// @nodoc
abstract mixin class _$ConversationModelCopyWith<$Res> implements $ConversationModelCopyWith<$Res> {
  factory _$ConversationModelCopyWith(_ConversationModel value, $Res Function(_ConversationModel) _then) = __$ConversationModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String title, String kind, int memberCount, int unread, bool muted, bool canPost, String? lastPreview, DateTime? lastAt, String? pinnedText
});




}
/// @nodoc
class __$ConversationModelCopyWithImpl<$Res>
    implements _$ConversationModelCopyWith<$Res> {
  __$ConversationModelCopyWithImpl(this._self, this._then);

  final _ConversationModel _self;
  final $Res Function(_ConversationModel) _then;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? kind = null,Object? memberCount = null,Object? unread = null,Object? muted = null,Object? canPost = null,Object? lastPreview = freezed,Object? lastAt = freezed,Object? pinnedText = freezed,}) {
  return _then(_ConversationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,memberCount: null == memberCount ? _self.memberCount : memberCount // ignore: cast_nullable_to_non_nullable
as int,unread: null == unread ? _self.unread : unread // ignore: cast_nullable_to_non_nullable
as int,muted: null == muted ? _self.muted : muted // ignore: cast_nullable_to_non_nullable
as bool,canPost: null == canPost ? _self.canPost : canPost // ignore: cast_nullable_to_non_nullable
as bool,lastPreview: freezed == lastPreview ? _self.lastPreview : lastPreview // ignore: cast_nullable_to_non_nullable
as String?,lastAt: freezed == lastAt ? _self.lastAt : lastAt // ignore: cast_nullable_to_non_nullable
as DateTime?,pinnedText: freezed == pinnedText ? _self.pinnedText : pinnedText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ChatMessageModel {

 String get id; String get senderName; DateTime get sentAt; bool get isMine; String? get senderRole; String? get text; String? get photoUrl; String? get videoUrl; int get seenBy;
/// Create a copy of ChatMessageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChatMessageModelCopyWith<ChatMessageModel> get copyWith => _$ChatMessageModelCopyWithImpl<ChatMessageModel>(this as ChatMessageModel, _$identity);

  /// Serializes this ChatMessageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ChatMessageModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChatMessageModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.senderName, _this.senderName) || other.senderName == _this.senderName)&&(identical(other.sentAt, _this.sentAt) || other.sentAt == _this.sentAt)&&(identical(other.isMine, _this.isMine) || other.isMine == _this.isMine)&&(identical(other.senderRole, _this.senderRole) || other.senderRole == _this.senderRole)&&(identical(other.text, _this.text) || other.text == _this.text)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.videoUrl, _this.videoUrl) || other.videoUrl == _this.videoUrl)&&(identical(other.seenBy, _this.seenBy) || other.seenBy == _this.seenBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ChatMessageModel;
  return Object.hash(runtimeType,_this.id,_this.senderName,_this.sentAt,_this.isMine,_this.senderRole,_this.text,_this.photoUrl,_this.videoUrl,_this.seenBy);
}

@override
String toString() {
  final _this = this as ChatMessageModel;
  return 'ChatMessageModel(id: ${_this.id}, senderName: ${_this.senderName}, sentAt: ${_this.sentAt}, isMine: ${_this.isMine}, senderRole: ${_this.senderRole}, text: ${_this.text}, photoUrl: ${_this.photoUrl}, videoUrl: ${_this.videoUrl}, seenBy: ${_this.seenBy})';
}


}

/// @nodoc
abstract mixin class $ChatMessageModelCopyWith<$Res>  {
  factory $ChatMessageModelCopyWith(ChatMessageModel value, $Res Function(ChatMessageModel) _then) = _$ChatMessageModelCopyWithImpl;
@useResult
$Res call({
 String id, String senderName, DateTime sentAt, bool isMine, String? senderRole, String? text, String? photoUrl, String? videoUrl, int seenBy
});




}
/// @nodoc
class _$ChatMessageModelCopyWithImpl<$Res>
    implements $ChatMessageModelCopyWith<$Res> {
  _$ChatMessageModelCopyWithImpl(this._self, this._then);

  final ChatMessageModel _self;
  final $Res Function(ChatMessageModel) _then;

/// Create a copy of ChatMessageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? senderName = null,Object? sentAt = null,Object? isMine = null,Object? senderRole = freezed,Object? text = freezed,Object? photoUrl = freezed,Object? videoUrl = freezed,Object? seenBy = null,}) {
  return _then(ChatMessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,senderRole: freezed == senderRole ? _self.senderRole : senderRole // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,seenBy: null == seenBy ? _self.seenBy : seenBy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChatMessageModel].
extension ChatMessageModelPatterns on ChatMessageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChatMessageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChatMessageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChatMessageModel value)  $default,){
final _that = this;
switch (_that) {
case _ChatMessageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChatMessageModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChatMessageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String senderName,  DateTime sentAt,  bool isMine,  String? senderRole,  String? text,  String? photoUrl,  String? videoUrl,  int seenBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChatMessageModel() when $default != null:
return $default(_that.id,_that.senderName,_that.sentAt,_that.isMine,_that.senderRole,_that.text,_that.photoUrl,_that.videoUrl,_that.seenBy);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String senderName,  DateTime sentAt,  bool isMine,  String? senderRole,  String? text,  String? photoUrl,  String? videoUrl,  int seenBy)  $default,) {final _that = this;
switch (_that) {
case _ChatMessageModel():
return $default(_that.id,_that.senderName,_that.sentAt,_that.isMine,_that.senderRole,_that.text,_that.photoUrl,_that.videoUrl,_that.seenBy);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String senderName,  DateTime sentAt,  bool isMine,  String? senderRole,  String? text,  String? photoUrl,  String? videoUrl,  int seenBy)?  $default,) {final _that = this;
switch (_that) {
case _ChatMessageModel() when $default != null:
return $default(_that.id,_that.senderName,_that.sentAt,_that.isMine,_that.senderRole,_that.text,_that.photoUrl,_that.videoUrl,_that.seenBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChatMessageModel extends ChatMessageModel {
  const _ChatMessageModel({required this.id, required this.senderName, required this.sentAt, this.isMine = false, this.senderRole, this.text, this.photoUrl, this.videoUrl, this.seenBy = 0}): super._();
  factory _ChatMessageModel.fromJson(Map<String, dynamic> json) => _$ChatMessageModelFromJson(json);

@override final  String id;
@override final  String senderName;
@override final  DateTime sentAt;
@override@JsonKey() final  bool isMine;
@override final  String? senderRole;
@override final  String? text;
@override final  String? photoUrl;
@override final  String? videoUrl;
@override@JsonKey() final  int seenBy;

/// Create a copy of ChatMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChatMessageModelCopyWith<_ChatMessageModel> get copyWith => __$ChatMessageModelCopyWithImpl<_ChatMessageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChatMessageModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChatMessageModel&&(identical(other.id, id) || other.id == id)&&(identical(other.senderName, senderName) || other.senderName == senderName)&&(identical(other.sentAt, sentAt) || other.sentAt == sentAt)&&(identical(other.isMine, isMine) || other.isMine == isMine)&&(identical(other.senderRole, senderRole) || other.senderRole == senderRole)&&(identical(other.text, text) || other.text == text)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.videoUrl, videoUrl) || other.videoUrl == videoUrl)&&(identical(other.seenBy, seenBy) || other.seenBy == seenBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,senderName,sentAt,isMine,senderRole,text,photoUrl,videoUrl,seenBy);
}

@override
String toString() {
    return 'ChatMessageModel(id: $id, senderName: $senderName, sentAt: $sentAt, isMine: $isMine, senderRole: $senderRole, text: $text, photoUrl: $photoUrl, videoUrl: $videoUrl, seenBy: $seenBy)';
}


}

/// @nodoc
abstract mixin class _$ChatMessageModelCopyWith<$Res> implements $ChatMessageModelCopyWith<$Res> {
  factory _$ChatMessageModelCopyWith(_ChatMessageModel value, $Res Function(_ChatMessageModel) _then) = __$ChatMessageModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String senderName, DateTime sentAt, bool isMine, String? senderRole, String? text, String? photoUrl, String? videoUrl, int seenBy
});




}
/// @nodoc
class __$ChatMessageModelCopyWithImpl<$Res>
    implements _$ChatMessageModelCopyWith<$Res> {
  __$ChatMessageModelCopyWithImpl(this._self, this._then);

  final _ChatMessageModel _self;
  final $Res Function(_ChatMessageModel) _then;

/// Create a copy of ChatMessageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? senderName = null,Object? sentAt = null,Object? isMine = null,Object? senderRole = freezed,Object? text = freezed,Object? photoUrl = freezed,Object? videoUrl = freezed,Object? seenBy = null,}) {
  return _then(_ChatMessageModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,senderName: null == senderName ? _self.senderName : senderName // ignore: cast_nullable_to_non_nullable
as String,sentAt: null == sentAt ? _self.sentAt : sentAt // ignore: cast_nullable_to_non_nullable
as DateTime,isMine: null == isMine ? _self.isMine : isMine // ignore: cast_nullable_to_non_nullable
as bool,senderRole: freezed == senderRole ? _self.senderRole : senderRole // ignore: cast_nullable_to_non_nullable
as String?,text: freezed == text ? _self.text : text // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,videoUrl: freezed == videoUrl ? _self.videoUrl : videoUrl // ignore: cast_nullable_to_non_nullable
as String?,seenBy: null == seenBy ? _self.seenBy : seenBy // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$MessagePageModel {

 List<ChatMessageModel> get messages; bool get hasMore;
/// Create a copy of MessagePageModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MessagePageModelCopyWith<MessagePageModel> get copyWith => _$MessagePageModelCopyWithImpl<MessagePageModel>(this as MessagePageModel, _$identity);

  /// Serializes this MessagePageModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as MessagePageModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MessagePageModel&&const DeepCollectionEquality().equals(other.messages, _this.messages)&&(identical(other.hasMore, _this.hasMore) || other.hasMore == _this.hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as MessagePageModel;
  return Object.hash(runtimeType,const DeepCollectionEquality().hash(_this.messages),_this.hasMore);
}

@override
String toString() {
  final _this = this as MessagePageModel;
  return 'MessagePageModel(messages: ${_this.messages}, hasMore: ${_this.hasMore})';
}


}

/// @nodoc
abstract mixin class $MessagePageModelCopyWith<$Res>  {
  factory $MessagePageModelCopyWith(MessagePageModel value, $Res Function(MessagePageModel) _then) = _$MessagePageModelCopyWithImpl;
@useResult
$Res call({
 List<ChatMessageModel> messages, bool hasMore
});




}
/// @nodoc
class _$MessagePageModelCopyWithImpl<$Res>
    implements $MessagePageModelCopyWith<$Res> {
  _$MessagePageModelCopyWithImpl(this._self, this._then);

  final MessagePageModel _self;
  final $Res Function(MessagePageModel) _then;

/// Create a copy of MessagePageModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? messages = null,Object? hasMore = null,}) {
  return _then(MessagePageModel(
messages: null == messages ? _self.messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageModel>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [MessagePageModel].
extension MessagePageModelPatterns on MessagePageModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MessagePageModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MessagePageModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MessagePageModel value)  $default,){
final _that = this;
switch (_that) {
case _MessagePageModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MessagePageModel value)?  $default,){
final _that = this;
switch (_that) {
case _MessagePageModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ChatMessageModel> messages,  bool hasMore)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MessagePageModel() when $default != null:
return $default(_that.messages,_that.hasMore);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ChatMessageModel> messages,  bool hasMore)  $default,) {final _that = this;
switch (_that) {
case _MessagePageModel():
return $default(_that.messages,_that.hasMore);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ChatMessageModel> messages,  bool hasMore)?  $default,) {final _that = this;
switch (_that) {
case _MessagePageModel() when $default != null:
return $default(_that.messages,_that.hasMore);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MessagePageModel extends MessagePageModel {
  const _MessagePageModel({required  List<ChatMessageModel> messages, this.hasMore = false}): _messages = messages,super._();
  factory _MessagePageModel.fromJson(Map<String, dynamic> json) => _$MessagePageModelFromJson(json);

 final  List<ChatMessageModel> _messages;
@override List<ChatMessageModel> get messages {
  if (_messages is EqualUnmodifiableListView) return _messages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_messages);
}

@override@JsonKey() final  bool hasMore;

/// Create a copy of MessagePageModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MessagePageModelCopyWith<_MessagePageModel> get copyWith => __$MessagePageModelCopyWithImpl<_MessagePageModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MessagePageModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _MessagePageModel&&const DeepCollectionEquality().equals(other.messages, _messages)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,const DeepCollectionEquality().hash(_messages),hasMore);
}

@override
String toString() {
    return 'MessagePageModel(messages: $messages, hasMore: $hasMore)';
}


}

/// @nodoc
abstract mixin class _$MessagePageModelCopyWith<$Res> implements $MessagePageModelCopyWith<$Res> {
  factory _$MessagePageModelCopyWith(_MessagePageModel value, $Res Function(_MessagePageModel) _then) = __$MessagePageModelCopyWithImpl;
@override @useResult
$Res call({
 List<ChatMessageModel> messages, bool hasMore
});




}
/// @nodoc
class __$MessagePageModelCopyWithImpl<$Res>
    implements _$MessagePageModelCopyWith<$Res> {
  __$MessagePageModelCopyWithImpl(this._self, this._then);

  final _MessagePageModel _self;
  final $Res Function(_MessagePageModel) _then;

/// Create a copy of MessagePageModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? messages = null,Object? hasMore = null,}) {
  return _then(_MessagePageModel(
messages: null == messages ? _self._messages : messages // ignore: cast_nullable_to_non_nullable
as List<ChatMessageModel>,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
