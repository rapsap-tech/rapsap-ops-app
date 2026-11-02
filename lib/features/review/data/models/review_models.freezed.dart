// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SectionProgressModel {

 String get id; String get name; String get status; int get done; int get total; int get missed;
/// Create a copy of SectionProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionProgressModelCopyWith<SectionProgressModel> get copyWith => _$SectionProgressModelCopyWithImpl<SectionProgressModel>(this as SectionProgressModel, _$identity);

  /// Serializes this SectionProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SectionProgressModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SectionProgressModel&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.done, _this.done) || other.done == _this.done)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.missed, _this.missed) || other.missed == _this.missed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SectionProgressModel;
  return Object.hash(runtimeType,_this.id,_this.name,_this.status,_this.done,_this.total,_this.missed);
}

@override
String toString() {
  final _this = this as SectionProgressModel;
  return 'SectionProgressModel(id: ${_this.id}, name: ${_this.name}, status: ${_this.status}, done: ${_this.done}, total: ${_this.total}, missed: ${_this.missed})';
}


}

/// @nodoc
abstract mixin class $SectionProgressModelCopyWith<$Res>  {
  factory $SectionProgressModelCopyWith(SectionProgressModel value, $Res Function(SectionProgressModel) _then) = _$SectionProgressModelCopyWithImpl;
@useResult
$Res call({
 String id, String name, String status, int done, int total, int missed
});




}
/// @nodoc
class _$SectionProgressModelCopyWithImpl<$Res>
    implements $SectionProgressModelCopyWith<$Res> {
  _$SectionProgressModelCopyWithImpl(this._self, this._then);

  final SectionProgressModel _self;
  final $Res Function(SectionProgressModel) _then;

/// Create a copy of SectionProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? status = null,Object? done = null,Object? total = null,Object? missed = null,}) {
  return _then(SectionProgressModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,missed: null == missed ? _self.missed : missed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SectionProgressModel].
extension SectionProgressModelPatterns on SectionProgressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SectionProgressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SectionProgressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SectionProgressModel value)  $default,){
final _that = this;
switch (_that) {
case _SectionProgressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SectionProgressModel value)?  $default,){
final _that = this;
switch (_that) {
case _SectionProgressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String status,  int done,  int total,  int missed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SectionProgressModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.done,_that.total,_that.missed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String status,  int done,  int total,  int missed)  $default,) {final _that = this;
switch (_that) {
case _SectionProgressModel():
return $default(_that.id,_that.name,_that.status,_that.done,_that.total,_that.missed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String status,  int done,  int total,  int missed)?  $default,) {final _that = this;
switch (_that) {
case _SectionProgressModel() when $default != null:
return $default(_that.id,_that.name,_that.status,_that.done,_that.total,_that.missed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SectionProgressModel extends SectionProgressModel {
  const _SectionProgressModel({required this.id, required this.name, required this.status, required this.done, required this.total, this.missed = 0}): super._();
  factory _SectionProgressModel.fromJson(Map<String, dynamic> json) => _$SectionProgressModelFromJson(json);

@override final  String id;
@override final  String name;
@override final  String status;
@override final  int done;
@override final  int total;
@override@JsonKey() final  int missed;

/// Create a copy of SectionProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SectionProgressModelCopyWith<_SectionProgressModel> get copyWith => __$SectionProgressModelCopyWithImpl<_SectionProgressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SectionProgressModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SectionProgressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.status, status) || other.status == status)&&(identical(other.done, done) || other.done == done)&&(identical(other.total, total) || other.total == total)&&(identical(other.missed, missed) || other.missed == missed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,status,done,total,missed);
}

@override
String toString() {
    return 'SectionProgressModel(id: $id, name: $name, status: $status, done: $done, total: $total, missed: $missed)';
}


}

/// @nodoc
abstract mixin class _$SectionProgressModelCopyWith<$Res> implements $SectionProgressModelCopyWith<$Res> {
  factory _$SectionProgressModelCopyWith(_SectionProgressModel value, $Res Function(_SectionProgressModel) _then) = __$SectionProgressModelCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String status, int done, int total, int missed
});




}
/// @nodoc
class __$SectionProgressModelCopyWithImpl<$Res>
    implements _$SectionProgressModelCopyWith<$Res> {
  __$SectionProgressModelCopyWithImpl(this._self, this._then);

  final _SectionProgressModel _self;
  final $Res Function(_SectionProgressModel) _then;

/// Create a copy of SectionProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? status = null,Object? done = null,Object? total = null,Object? missed = null,}) {
  return _then(_SectionProgressModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,missed: null == missed ? _self.missed : missed // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$SalesSummaryModel {

 DateTime get month; num get salesMtd; num get target; DateTime get dsrDueAt;
/// Create a copy of SalesSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesSummaryModelCopyWith<SalesSummaryModel> get copyWith => _$SalesSummaryModelCopyWithImpl<SalesSummaryModel>(this as SalesSummaryModel, _$identity);

  /// Serializes this SalesSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SalesSummaryModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesSummaryModel&&(identical(other.month, _this.month) || other.month == _this.month)&&(identical(other.salesMtd, _this.salesMtd) || other.salesMtd == _this.salesMtd)&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.dsrDueAt, _this.dsrDueAt) || other.dsrDueAt == _this.dsrDueAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SalesSummaryModel;
  return Object.hash(runtimeType,_this.month,_this.salesMtd,_this.target,_this.dsrDueAt);
}

@override
String toString() {
  final _this = this as SalesSummaryModel;
  return 'SalesSummaryModel(month: ${_this.month}, salesMtd: ${_this.salesMtd}, target: ${_this.target}, dsrDueAt: ${_this.dsrDueAt})';
}


}

/// @nodoc
abstract mixin class $SalesSummaryModelCopyWith<$Res>  {
  factory $SalesSummaryModelCopyWith(SalesSummaryModel value, $Res Function(SalesSummaryModel) _then) = _$SalesSummaryModelCopyWithImpl;
@useResult
$Res call({
 DateTime month, num salesMtd, num target, DateTime dsrDueAt
});




}
/// @nodoc
class _$SalesSummaryModelCopyWithImpl<$Res>
    implements $SalesSummaryModelCopyWith<$Res> {
  _$SalesSummaryModelCopyWithImpl(this._self, this._then);

  final SalesSummaryModel _self;
  final $Res Function(SalesSummaryModel) _then;

/// Create a copy of SalesSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? month = null,Object? salesMtd = null,Object? target = null,Object? dsrDueAt = null,}) {
  return _then(SalesSummaryModel(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,salesMtd: null == salesMtd ? _self.salesMtd : salesMtd // ignore: cast_nullable_to_non_nullable
as num,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as num,dsrDueAt: null == dsrDueAt ? _self.dsrDueAt : dsrDueAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [SalesSummaryModel].
extension SalesSummaryModelPatterns on SalesSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _SalesSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _SalesSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime month,  num salesMtd,  num target,  DateTime dsrDueAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesSummaryModel() when $default != null:
return $default(_that.month,_that.salesMtd,_that.target,_that.dsrDueAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime month,  num salesMtd,  num target,  DateTime dsrDueAt)  $default,) {final _that = this;
switch (_that) {
case _SalesSummaryModel():
return $default(_that.month,_that.salesMtd,_that.target,_that.dsrDueAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime month,  num salesMtd,  num target,  DateTime dsrDueAt)?  $default,) {final _that = this;
switch (_that) {
case _SalesSummaryModel() when $default != null:
return $default(_that.month,_that.salesMtd,_that.target,_that.dsrDueAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesSummaryModel extends SalesSummaryModel {
  const _SalesSummaryModel({required this.month, required this.salesMtd, required this.target, required this.dsrDueAt}): super._();
  factory _SalesSummaryModel.fromJson(Map<String, dynamic> json) => _$SalesSummaryModelFromJson(json);

@override final  DateTime month;
@override final  num salesMtd;
@override final  num target;
@override final  DateTime dsrDueAt;

/// Create a copy of SalesSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesSummaryModelCopyWith<_SalesSummaryModel> get copyWith => __$SalesSummaryModelCopyWithImpl<_SalesSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesSummaryModel&&(identical(other.month, month) || other.month == month)&&(identical(other.salesMtd, salesMtd) || other.salesMtd == salesMtd)&&(identical(other.target, target) || other.target == target)&&(identical(other.dsrDueAt, dsrDueAt) || other.dsrDueAt == dsrDueAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,month,salesMtd,target,dsrDueAt);
}

@override
String toString() {
    return 'SalesSummaryModel(month: $month, salesMtd: $salesMtd, target: $target, dsrDueAt: $dsrDueAt)';
}


}

/// @nodoc
abstract mixin class _$SalesSummaryModelCopyWith<$Res> implements $SalesSummaryModelCopyWith<$Res> {
  factory _$SalesSummaryModelCopyWith(_SalesSummaryModel value, $Res Function(_SalesSummaryModel) _then) = __$SalesSummaryModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime month, num salesMtd, num target, DateTime dsrDueAt
});




}
/// @nodoc
class __$SalesSummaryModelCopyWithImpl<$Res>
    implements _$SalesSummaryModelCopyWith<$Res> {
  __$SalesSummaryModelCopyWithImpl(this._self, this._then);

  final _SalesSummaryModel _self;
  final $Res Function(_SalesSummaryModel) _then;

/// Create a copy of SalesSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? month = null,Object? salesMtd = null,Object? target = null,Object? dsrDueAt = null,}) {
  return _then(_SalesSummaryModel(
month: null == month ? _self.month : month // ignore: cast_nullable_to_non_nullable
as DateTime,salesMtd: null == salesMtd ? _self.salesMtd : salesMtd // ignore: cast_nullable_to_non_nullable
as num,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as num,dsrDueAt: null == dsrDueAt ? _self.dsrDueAt : dsrDueAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}


/// @nodoc
mixin _$ManagerDashboardModel {

 DateTime get date; int get done; int get total; int get toReview; int get missed; int get notDone; List<SectionProgressModel> get sections; SalesSummaryModel? get sales;
/// Create a copy of ManagerDashboardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerDashboardModelCopyWith<ManagerDashboardModel> get copyWith => _$ManagerDashboardModelCopyWithImpl<ManagerDashboardModel>(this as ManagerDashboardModel, _$identity);

  /// Serializes this ManagerDashboardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManagerDashboardModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerDashboardModel&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.done, _this.done) || other.done == _this.done)&&(identical(other.total, _this.total) || other.total == _this.total)&&(identical(other.toReview, _this.toReview) || other.toReview == _this.toReview)&&(identical(other.missed, _this.missed) || other.missed == _this.missed)&&(identical(other.notDone, _this.notDone) || other.notDone == _this.notDone)&&const DeepCollectionEquality().equals(other.sections, _this.sections)&&(identical(other.sales, _this.sales) || other.sales == _this.sales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManagerDashboardModel;
  return Object.hash(runtimeType,_this.date,_this.done,_this.total,_this.toReview,_this.missed,_this.notDone,const DeepCollectionEquality().hash(_this.sections),_this.sales);
}

@override
String toString() {
  final _this = this as ManagerDashboardModel;
  return 'ManagerDashboardModel(date: ${_this.date}, done: ${_this.done}, total: ${_this.total}, toReview: ${_this.toReview}, missed: ${_this.missed}, notDone: ${_this.notDone}, sections: ${_this.sections}, sales: ${_this.sales})';
}


}

/// @nodoc
abstract mixin class $ManagerDashboardModelCopyWith<$Res>  {
  factory $ManagerDashboardModelCopyWith(ManagerDashboardModel value, $Res Function(ManagerDashboardModel) _then) = _$ManagerDashboardModelCopyWithImpl;
@useResult
$Res call({
 DateTime date, int done, int total, int toReview, int missed, int notDone, List<SectionProgressModel> sections, SalesSummaryModel? sales
});


$SalesSummaryModelCopyWith<$Res>? get sales;

}
/// @nodoc
class _$ManagerDashboardModelCopyWithImpl<$Res>
    implements $ManagerDashboardModelCopyWith<$Res> {
  _$ManagerDashboardModelCopyWithImpl(this._self, this._then);

  final ManagerDashboardModel _self;
  final $Res Function(ManagerDashboardModel) _then;

/// Create a copy of ManagerDashboardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? done = null,Object? total = null,Object? toReview = null,Object? missed = null,Object? notDone = null,Object? sections = null,Object? sales = freezed,}) {
  return _then(ManagerDashboardModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,toReview: null == toReview ? _self.toReview : toReview // ignore: cast_nullable_to_non_nullable
as int,missed: null == missed ? _self.missed : missed // ignore: cast_nullable_to_non_nullable
as int,notDone: null == notDone ? _self.notDone : notDone // ignore: cast_nullable_to_non_nullable
as int,sections: null == sections ? _self.sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionProgressModel>,sales: freezed == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as SalesSummaryModel?,
  ));
}
/// Create a copy of ManagerDashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesSummaryModelCopyWith<$Res>? get sales {
    if (_self.sales == null) {
    return null;
  }

  return $SalesSummaryModelCopyWith<$Res>(_self.sales!, (value) {
    return _then(_self.copyWith(sales: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManagerDashboardModel].
extension ManagerDashboardModelPatterns on ManagerDashboardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagerDashboardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagerDashboardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagerDashboardModel value)  $default,){
final _that = this;
switch (_that) {
case _ManagerDashboardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagerDashboardModel value)?  $default,){
final _that = this;
switch (_that) {
case _ManagerDashboardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  int done,  int total,  int toReview,  int missed,  int notDone,  List<SectionProgressModel> sections,  SalesSummaryModel? sales)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagerDashboardModel() when $default != null:
return $default(_that.date,_that.done,_that.total,_that.toReview,_that.missed,_that.notDone,_that.sections,_that.sales);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  int done,  int total,  int toReview,  int missed,  int notDone,  List<SectionProgressModel> sections,  SalesSummaryModel? sales)  $default,) {final _that = this;
switch (_that) {
case _ManagerDashboardModel():
return $default(_that.date,_that.done,_that.total,_that.toReview,_that.missed,_that.notDone,_that.sections,_that.sales);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  int done,  int total,  int toReview,  int missed,  int notDone,  List<SectionProgressModel> sections,  SalesSummaryModel? sales)?  $default,) {final _that = this;
switch (_that) {
case _ManagerDashboardModel() when $default != null:
return $default(_that.date,_that.done,_that.total,_that.toReview,_that.missed,_that.notDone,_that.sections,_that.sales);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagerDashboardModel extends ManagerDashboardModel {
  const _ManagerDashboardModel({required this.date, required this.done, required this.total, required this.toReview, required this.missed, required this.notDone, required  List<SectionProgressModel> sections, this.sales}): _sections = sections,super._();
  factory _ManagerDashboardModel.fromJson(Map<String, dynamic> json) => _$ManagerDashboardModelFromJson(json);

@override final  DateTime date;
@override final  int done;
@override final  int total;
@override final  int toReview;
@override final  int missed;
@override final  int notDone;
 final  List<SectionProgressModel> _sections;
@override List<SectionProgressModel> get sections {
  if (_sections is EqualUnmodifiableListView) return _sections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sections);
}

@override final  SalesSummaryModel? sales;

/// Create a copy of ManagerDashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagerDashboardModelCopyWith<_ManagerDashboardModel> get copyWith => __$ManagerDashboardModelCopyWithImpl<_ManagerDashboardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagerDashboardModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagerDashboardModel&&(identical(other.date, date) || other.date == date)&&(identical(other.done, done) || other.done == done)&&(identical(other.total, total) || other.total == total)&&(identical(other.toReview, toReview) || other.toReview == toReview)&&(identical(other.missed, missed) || other.missed == missed)&&(identical(other.notDone, notDone) || other.notDone == notDone)&&const DeepCollectionEquality().equals(other.sections, _sections)&&(identical(other.sales, sales) || other.sales == sales));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,done,total,toReview,missed,notDone,const DeepCollectionEquality().hash(_sections),sales);
}

@override
String toString() {
    return 'ManagerDashboardModel(date: $date, done: $done, total: $total, toReview: $toReview, missed: $missed, notDone: $notDone, sections: $sections, sales: $sales)';
}


}

/// @nodoc
abstract mixin class _$ManagerDashboardModelCopyWith<$Res> implements $ManagerDashboardModelCopyWith<$Res> {
  factory _$ManagerDashboardModelCopyWith(_ManagerDashboardModel value, $Res Function(_ManagerDashboardModel) _then) = __$ManagerDashboardModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, int done, int total, int toReview, int missed, int notDone, List<SectionProgressModel> sections, SalesSummaryModel? sales
});


@override $SalesSummaryModelCopyWith<$Res>? get sales;

}
/// @nodoc
class __$ManagerDashboardModelCopyWithImpl<$Res>
    implements _$ManagerDashboardModelCopyWith<$Res> {
  __$ManagerDashboardModelCopyWithImpl(this._self, this._then);

  final _ManagerDashboardModel _self;
  final $Res Function(_ManagerDashboardModel) _then;

/// Create a copy of ManagerDashboardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? done = null,Object? total = null,Object? toReview = null,Object? missed = null,Object? notDone = null,Object? sections = null,Object? sales = freezed,}) {
  return _then(_ManagerDashboardModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,done: null == done ? _self.done : done // ignore: cast_nullable_to_non_nullable
as int,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,toReview: null == toReview ? _self.toReview : toReview // ignore: cast_nullable_to_non_nullable
as int,missed: null == missed ? _self.missed : missed // ignore: cast_nullable_to_non_nullable
as int,notDone: null == notDone ? _self.notDone : notDone // ignore: cast_nullable_to_non_nullable
as int,sections: null == sections ? _self._sections : sections // ignore: cast_nullable_to_non_nullable
as List<SectionProgressModel>,sales: freezed == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as SalesSummaryModel?,
  ));
}

/// Create a copy of ManagerDashboardModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SalesSummaryModelCopyWith<$Res>? get sales {
    if (_self.sales == null) {
    return null;
  }

  return $SalesSummaryModelCopyWith<$Res>(_self.sales!, (value) {
    return _then(_self.copyWith(sales: value));
  });
}
}


/// @nodoc
mixin _$ReviewItemModel {

 String get taskId; int get number; String get title; String get section; String get staffName; String get staffRole; String get kind; DateTime get at; String? get reason;
/// Create a copy of ReviewItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewItemModelCopyWith<ReviewItemModel> get copyWith => _$ReviewItemModelCopyWithImpl<ReviewItemModel>(this as ReviewItemModel, _$identity);

  /// Serializes this ReviewItemModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReviewItemModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewItemModel&&(identical(other.taskId, _this.taskId) || other.taskId == _this.taskId)&&(identical(other.number, _this.number) || other.number == _this.number)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.section, _this.section) || other.section == _this.section)&&(identical(other.staffName, _this.staffName) || other.staffName == _this.staffName)&&(identical(other.staffRole, _this.staffRole) || other.staffRole == _this.staffRole)&&(identical(other.kind, _this.kind) || other.kind == _this.kind)&&(identical(other.at, _this.at) || other.at == _this.at)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReviewItemModel;
  return Object.hash(runtimeType,_this.taskId,_this.number,_this.title,_this.section,_this.staffName,_this.staffRole,_this.kind,_this.at,_this.reason);
}

@override
String toString() {
  final _this = this as ReviewItemModel;
  return 'ReviewItemModel(taskId: ${_this.taskId}, number: ${_this.number}, title: ${_this.title}, section: ${_this.section}, staffName: ${_this.staffName}, staffRole: ${_this.staffRole}, kind: ${_this.kind}, at: ${_this.at}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $ReviewItemModelCopyWith<$Res>  {
  factory $ReviewItemModelCopyWith(ReviewItemModel value, $Res Function(ReviewItemModel) _then) = _$ReviewItemModelCopyWithImpl;
@useResult
$Res call({
 String taskId, int number, String title, String section, String staffName, String staffRole, String kind, DateTime at, String? reason
});




}
/// @nodoc
class _$ReviewItemModelCopyWithImpl<$Res>
    implements $ReviewItemModelCopyWith<$Res> {
  _$ReviewItemModelCopyWithImpl(this._self, this._then);

  final ReviewItemModel _self;
  final $Res Function(ReviewItemModel) _then;

/// Create a copy of ReviewItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? taskId = null,Object? number = null,Object? title = null,Object? section = null,Object? staffName = null,Object? staffRole = null,Object? kind = null,Object? at = null,Object? reason = freezed,}) {
  return _then(ReviewItemModel(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,staffName: null == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String,staffRole: null == staffRole ? _self.staffRole : staffRole // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ReviewItemModel].
extension ReviewItemModelPatterns on ReviewItemModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewItemModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewItemModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewItemModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewItemModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewItemModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewItemModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String taskId,  int number,  String title,  String section,  String staffName,  String staffRole,  String kind,  DateTime at,  String? reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewItemModel() when $default != null:
return $default(_that.taskId,_that.number,_that.title,_that.section,_that.staffName,_that.staffRole,_that.kind,_that.at,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String taskId,  int number,  String title,  String section,  String staffName,  String staffRole,  String kind,  DateTime at,  String? reason)  $default,) {final _that = this;
switch (_that) {
case _ReviewItemModel():
return $default(_that.taskId,_that.number,_that.title,_that.section,_that.staffName,_that.staffRole,_that.kind,_that.at,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String taskId,  int number,  String title,  String section,  String staffName,  String staffRole,  String kind,  DateTime at,  String? reason)?  $default,) {final _that = this;
switch (_that) {
case _ReviewItemModel() when $default != null:
return $default(_that.taskId,_that.number,_that.title,_that.section,_that.staffName,_that.staffRole,_that.kind,_that.at,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewItemModel extends ReviewItemModel {
  const _ReviewItemModel({required this.taskId, required this.number, required this.title, required this.section, required this.staffName, required this.staffRole, required this.kind, required this.at, this.reason}): super._();
  factory _ReviewItemModel.fromJson(Map<String, dynamic> json) => _$ReviewItemModelFromJson(json);

@override final  String taskId;
@override final  int number;
@override final  String title;
@override final  String section;
@override final  String staffName;
@override final  String staffRole;
@override final  String kind;
@override final  DateTime at;
@override final  String? reason;

/// Create a copy of ReviewItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewItemModelCopyWith<_ReviewItemModel> get copyWith => __$ReviewItemModelCopyWithImpl<_ReviewItemModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewItemModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewItemModel&&(identical(other.taskId, taskId) || other.taskId == taskId)&&(identical(other.number, number) || other.number == number)&&(identical(other.title, title) || other.title == title)&&(identical(other.section, section) || other.section == section)&&(identical(other.staffName, staffName) || other.staffName == staffName)&&(identical(other.staffRole, staffRole) || other.staffRole == staffRole)&&(identical(other.kind, kind) || other.kind == kind)&&(identical(other.at, at) || other.at == at)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,taskId,number,title,section,staffName,staffRole,kind,at,reason);
}

@override
String toString() {
    return 'ReviewItemModel(taskId: $taskId, number: $number, title: $title, section: $section, staffName: $staffName, staffRole: $staffRole, kind: $kind, at: $at, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$ReviewItemModelCopyWith<$Res> implements $ReviewItemModelCopyWith<$Res> {
  factory _$ReviewItemModelCopyWith(_ReviewItemModel value, $Res Function(_ReviewItemModel) _then) = __$ReviewItemModelCopyWithImpl;
@override @useResult
$Res call({
 String taskId, int number, String title, String section, String staffName, String staffRole, String kind, DateTime at, String? reason
});




}
/// @nodoc
class __$ReviewItemModelCopyWithImpl<$Res>
    implements _$ReviewItemModelCopyWith<$Res> {
  __$ReviewItemModelCopyWithImpl(this._self, this._then);

  final _ReviewItemModel _self;
  final $Res Function(_ReviewItemModel) _then;

/// Create a copy of ReviewItemModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? taskId = null,Object? number = null,Object? title = null,Object? section = null,Object? staffName = null,Object? staffRole = null,Object? kind = null,Object? at = null,Object? reason = freezed,}) {
  return _then(_ReviewItemModel(
taskId: null == taskId ? _self.taskId : taskId // ignore: cast_nullable_to_non_nullable
as String,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,section: null == section ? _self.section : section // ignore: cast_nullable_to_non_nullable
as String,staffName: null == staffName ? _self.staffName : staffName // ignore: cast_nullable_to_non_nullable
as String,staffRole: null == staffRole ? _self.staffRole : staffRole // ignore: cast_nullable_to_non_nullable
as String,kind: null == kind ? _self.kind : kind // ignore: cast_nullable_to_non_nullable
as String,at: null == at ? _self.at : at // ignore: cast_nullable_to_non_nullable
as DateTime,reason: freezed == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$ReviewDetailModel {

 ReviewItemModel get item; String? get photoUrl; String? get remarks; DateTime? get lockedAt; int get unlockMinutes;
/// Create a copy of ReviewDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReviewDetailModelCopyWith<ReviewDetailModel> get copyWith => _$ReviewDetailModelCopyWithImpl<ReviewDetailModel>(this as ReviewDetailModel, _$identity);

  /// Serializes this ReviewDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ReviewDetailModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReviewDetailModel&&(identical(other.item, _this.item) || other.item == _this.item)&&(identical(other.photoUrl, _this.photoUrl) || other.photoUrl == _this.photoUrl)&&(identical(other.remarks, _this.remarks) || other.remarks == _this.remarks)&&(identical(other.lockedAt, _this.lockedAt) || other.lockedAt == _this.lockedAt)&&(identical(other.unlockMinutes, _this.unlockMinutes) || other.unlockMinutes == _this.unlockMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ReviewDetailModel;
  return Object.hash(runtimeType,_this.item,_this.photoUrl,_this.remarks,_this.lockedAt,_this.unlockMinutes);
}

@override
String toString() {
  final _this = this as ReviewDetailModel;
  return 'ReviewDetailModel(item: ${_this.item}, photoUrl: ${_this.photoUrl}, remarks: ${_this.remarks}, lockedAt: ${_this.lockedAt}, unlockMinutes: ${_this.unlockMinutes})';
}


}

/// @nodoc
abstract mixin class $ReviewDetailModelCopyWith<$Res>  {
  factory $ReviewDetailModelCopyWith(ReviewDetailModel value, $Res Function(ReviewDetailModel) _then) = _$ReviewDetailModelCopyWithImpl;
@useResult
$Res call({
 ReviewItemModel item, String? photoUrl, String? remarks, DateTime? lockedAt, int unlockMinutes
});


$ReviewItemModelCopyWith<$Res> get item;

}
/// @nodoc
class _$ReviewDetailModelCopyWithImpl<$Res>
    implements $ReviewDetailModelCopyWith<$Res> {
  _$ReviewDetailModelCopyWithImpl(this._self, this._then);

  final ReviewDetailModel _self;
  final $Res Function(ReviewDetailModel) _then;

/// Create a copy of ReviewDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? photoUrl = freezed,Object? remarks = freezed,Object? lockedAt = freezed,Object? unlockMinutes = null,}) {
  return _then(ReviewDetailModel(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ReviewItemModel,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,lockedAt: freezed == lockedAt ? _self.lockedAt : lockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unlockMinutes: null == unlockMinutes ? _self.unlockMinutes : unlockMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of ReviewDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewItemModelCopyWith<$Res> get item {
  
  return $ReviewItemModelCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}


/// Adds pattern-matching-related methods to [ReviewDetailModel].
extension ReviewDetailModelPatterns on ReviewDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReviewDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReviewDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReviewDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _ReviewDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReviewDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _ReviewDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ReviewItemModel item,  String? photoUrl,  String? remarks,  DateTime? lockedAt,  int unlockMinutes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReviewDetailModel() when $default != null:
return $default(_that.item,_that.photoUrl,_that.remarks,_that.lockedAt,_that.unlockMinutes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ReviewItemModel item,  String? photoUrl,  String? remarks,  DateTime? lockedAt,  int unlockMinutes)  $default,) {final _that = this;
switch (_that) {
case _ReviewDetailModel():
return $default(_that.item,_that.photoUrl,_that.remarks,_that.lockedAt,_that.unlockMinutes);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ReviewItemModel item,  String? photoUrl,  String? remarks,  DateTime? lockedAt,  int unlockMinutes)?  $default,) {final _that = this;
switch (_that) {
case _ReviewDetailModel() when $default != null:
return $default(_that.item,_that.photoUrl,_that.remarks,_that.lockedAt,_that.unlockMinutes);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ReviewDetailModel extends ReviewDetailModel {
  const _ReviewDetailModel({required this.item, this.photoUrl, this.remarks, this.lockedAt, this.unlockMinutes = 30}): super._();
  factory _ReviewDetailModel.fromJson(Map<String, dynamic> json) => _$ReviewDetailModelFromJson(json);

@override final  ReviewItemModel item;
@override final  String? photoUrl;
@override final  String? remarks;
@override final  DateTime? lockedAt;
@override@JsonKey() final  int unlockMinutes;

/// Create a copy of ReviewDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReviewDetailModelCopyWith<_ReviewDetailModel> get copyWith => __$ReviewDetailModelCopyWithImpl<_ReviewDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ReviewDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReviewDetailModel&&(identical(other.item, item) || other.item == item)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.remarks, remarks) || other.remarks == remarks)&&(identical(other.lockedAt, lockedAt) || other.lockedAt == lockedAt)&&(identical(other.unlockMinutes, unlockMinutes) || other.unlockMinutes == unlockMinutes));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,item,photoUrl,remarks,lockedAt,unlockMinutes);
}

@override
String toString() {
    return 'ReviewDetailModel(item: $item, photoUrl: $photoUrl, remarks: $remarks, lockedAt: $lockedAt, unlockMinutes: $unlockMinutes)';
}


}

/// @nodoc
abstract mixin class _$ReviewDetailModelCopyWith<$Res> implements $ReviewDetailModelCopyWith<$Res> {
  factory _$ReviewDetailModelCopyWith(_ReviewDetailModel value, $Res Function(_ReviewDetailModel) _then) = __$ReviewDetailModelCopyWithImpl;
@override @useResult
$Res call({
 ReviewItemModel item, String? photoUrl, String? remarks, DateTime? lockedAt, int unlockMinutes
});


@override $ReviewItemModelCopyWith<$Res> get item;

}
/// @nodoc
class __$ReviewDetailModelCopyWithImpl<$Res>
    implements _$ReviewDetailModelCopyWith<$Res> {
  __$ReviewDetailModelCopyWithImpl(this._self, this._then);

  final _ReviewDetailModel _self;
  final $Res Function(_ReviewDetailModel) _then;

/// Create a copy of ReviewDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? photoUrl = freezed,Object? remarks = freezed,Object? lockedAt = freezed,Object? unlockMinutes = null,}) {
  return _then(_ReviewDetailModel(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as ReviewItemModel,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,remarks: freezed == remarks ? _self.remarks : remarks // ignore: cast_nullable_to_non_nullable
as String?,lockedAt: freezed == lockedAt ? _self.lockedAt : lockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,unlockMinutes: null == unlockMinutes ? _self.unlockMinutes : unlockMinutes // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of ReviewDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReviewItemModelCopyWith<$Res> get item {
  
  return $ReviewItemModelCopyWith<$Res>(_self.item, (value) {
    return _then(_self.copyWith(item: value));
  });
}
}

// dart format on
