// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dsr_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DsrPostingModel {

 DateTime? get date; DateTime? get postedAt; bool? get onTime;
/// Create a copy of DsrPostingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DsrPostingModelCopyWith<DsrPostingModel> get copyWith => _$DsrPostingModelCopyWithImpl<DsrPostingModel>(this as DsrPostingModel, _$identity);

  /// Serializes this DsrPostingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DsrPostingModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DsrPostingModel&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.postedAt, _this.postedAt) || other.postedAt == _this.postedAt)&&(identical(other.onTime, _this.onTime) || other.onTime == _this.onTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DsrPostingModel;
  return Object.hash(runtimeType,_this.date,_this.postedAt,_this.onTime);
}

@override
String toString() {
  final _this = this as DsrPostingModel;
  return 'DsrPostingModel(date: ${_this.date}, postedAt: ${_this.postedAt}, onTime: ${_this.onTime})';
}


}

/// @nodoc
abstract mixin class $DsrPostingModelCopyWith<$Res>  {
  factory $DsrPostingModelCopyWith(DsrPostingModel value, $Res Function(DsrPostingModel) _then) = _$DsrPostingModelCopyWithImpl;
@useResult
$Res call({
 DateTime? date, DateTime? postedAt, bool? onTime
});




}
/// @nodoc
class _$DsrPostingModelCopyWithImpl<$Res>
    implements $DsrPostingModelCopyWith<$Res> {
  _$DsrPostingModelCopyWithImpl(this._self, this._then);

  final DsrPostingModel _self;
  final $Res Function(DsrPostingModel) _then;

/// Create a copy of DsrPostingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = freezed,Object? postedAt = freezed,Object? onTime = freezed,}) {
  return _then(DsrPostingModel(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,postedAt: freezed == postedAt ? _self.postedAt : postedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,onTime: freezed == onTime ? _self.onTime : onTime // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

}


/// Adds pattern-matching-related methods to [DsrPostingModel].
extension DsrPostingModelPatterns on DsrPostingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DsrPostingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DsrPostingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DsrPostingModel value)  $default,){
final _that = this;
switch (_that) {
case _DsrPostingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DsrPostingModel value)?  $default,){
final _that = this;
switch (_that) {
case _DsrPostingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime? date,  DateTime? postedAt,  bool? onTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DsrPostingModel() when $default != null:
return $default(_that.date,_that.postedAt,_that.onTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime? date,  DateTime? postedAt,  bool? onTime)  $default,) {final _that = this;
switch (_that) {
case _DsrPostingModel():
return $default(_that.date,_that.postedAt,_that.onTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime? date,  DateTime? postedAt,  bool? onTime)?  $default,) {final _that = this;
switch (_that) {
case _DsrPostingModel() when $default != null:
return $default(_that.date,_that.postedAt,_that.onTime);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DsrPostingModel extends DsrPostingModel {
  const _DsrPostingModel({this.date, this.postedAt, this.onTime}): super._();
  factory _DsrPostingModel.fromJson(Map<String, dynamic> json) => _$DsrPostingModelFromJson(json);

@override final  DateTime? date;
@override final  DateTime? postedAt;
@override final  bool? onTime;

/// Create a copy of DsrPostingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DsrPostingModelCopyWith<_DsrPostingModel> get copyWith => __$DsrPostingModelCopyWithImpl<_DsrPostingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DsrPostingModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DsrPostingModel&&(identical(other.date, date) || other.date == date)&&(identical(other.postedAt, postedAt) || other.postedAt == postedAt)&&(identical(other.onTime, onTime) || other.onTime == onTime));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,postedAt,onTime);
}

@override
String toString() {
    return 'DsrPostingModel(date: $date, postedAt: $postedAt, onTime: $onTime)';
}


}

/// @nodoc
abstract mixin class _$DsrPostingModelCopyWith<$Res> implements $DsrPostingModelCopyWith<$Res> {
  factory _$DsrPostingModelCopyWith(_DsrPostingModel value, $Res Function(_DsrPostingModel) _then) = __$DsrPostingModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime? date, DateTime? postedAt, bool? onTime
});




}
/// @nodoc
class __$DsrPostingModelCopyWithImpl<$Res>
    implements _$DsrPostingModelCopyWith<$Res> {
  __$DsrPostingModelCopyWithImpl(this._self, this._then);

  final _DsrPostingModel _self;
  final $Res Function(_DsrPostingModel) _then;

/// Create a copy of DsrPostingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = freezed,Object? postedAt = freezed,Object? onTime = freezed,}) {
  return _then(_DsrPostingModel(
date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,postedAt: freezed == postedAt ? _self.postedAt : postedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,onTime: freezed == onTime ? _self.onTime : onTime // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}


}


/// @nodoc
mixin _$TrendPointModel {

@DayOfMonthConverter() int get day; num get current; num? get previous;
/// Create a copy of TrendPointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendPointModelCopyWith<TrendPointModel> get copyWith => _$TrendPointModelCopyWithImpl<TrendPointModel>(this as TrendPointModel, _$identity);

  /// Serializes this TrendPointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TrendPointModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendPointModel&&(identical(other.day, _this.day) || other.day == _this.day)&&(identical(other.current, _this.current) || other.current == _this.current)&&(identical(other.previous, _this.previous) || other.previous == _this.previous));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TrendPointModel;
  return Object.hash(runtimeType,_this.day,_this.current,_this.previous);
}

@override
String toString() {
  final _this = this as TrendPointModel;
  return 'TrendPointModel(day: ${_this.day}, current: ${_this.current}, previous: ${_this.previous})';
}


}

/// @nodoc
abstract mixin class $TrendPointModelCopyWith<$Res>  {
  factory $TrendPointModelCopyWith(TrendPointModel value, $Res Function(TrendPointModel) _then) = _$TrendPointModelCopyWithImpl;
@useResult
$Res call({
@DayOfMonthConverter() int day, num current, num? previous
});




}
/// @nodoc
class _$TrendPointModelCopyWithImpl<$Res>
    implements $TrendPointModelCopyWith<$Res> {
  _$TrendPointModelCopyWithImpl(this._self, this._then);

  final TrendPointModel _self;
  final $Res Function(TrendPointModel) _then;

/// Create a copy of TrendPointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? day = null,Object? current = null,Object? previous = freezed,}) {
  return _then(TrendPointModel(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as num,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrendPointModel].
extension TrendPointModelPatterns on TrendPointModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrendPointModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrendPointModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrendPointModel value)  $default,){
final _that = this;
switch (_that) {
case _TrendPointModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrendPointModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrendPointModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@DayOfMonthConverter()  int day,  num current,  num? previous)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrendPointModel() when $default != null:
return $default(_that.day,_that.current,_that.previous);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@DayOfMonthConverter()  int day,  num current,  num? previous)  $default,) {final _that = this;
switch (_that) {
case _TrendPointModel():
return $default(_that.day,_that.current,_that.previous);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@DayOfMonthConverter()  int day,  num current,  num? previous)?  $default,) {final _that = this;
switch (_that) {
case _TrendPointModel() when $default != null:
return $default(_that.day,_that.current,_that.previous);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrendPointModel extends TrendPointModel {
  const _TrendPointModel({@DayOfMonthConverter() required this.day, required this.current, this.previous}): super._();
  factory _TrendPointModel.fromJson(Map<String, dynamic> json) => _$TrendPointModelFromJson(json);

@override@DayOfMonthConverter() final  int day;
@override final  num current;
@override final  num? previous;

/// Create a copy of TrendPointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendPointModelCopyWith<_TrendPointModel> get copyWith => __$TrendPointModelCopyWithImpl<_TrendPointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrendPointModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendPointModel&&(identical(other.day, day) || other.day == day)&&(identical(other.current, current) || other.current == current)&&(identical(other.previous, previous) || other.previous == previous));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,day,current,previous);
}

@override
String toString() {
    return 'TrendPointModel(day: $day, current: $current, previous: $previous)';
}


}

/// @nodoc
abstract mixin class _$TrendPointModelCopyWith<$Res> implements $TrendPointModelCopyWith<$Res> {
  factory _$TrendPointModelCopyWith(_TrendPointModel value, $Res Function(_TrendPointModel) _then) = __$TrendPointModelCopyWithImpl;
@override @useResult
$Res call({
@DayOfMonthConverter() int day, num current, num? previous
});




}
/// @nodoc
class __$TrendPointModelCopyWithImpl<$Res>
    implements _$TrendPointModelCopyWith<$Res> {
  __$TrendPointModelCopyWithImpl(this._self, this._then);

  final _TrendPointModel _self;
  final $Res Function(_TrendPointModel) _then;

/// Create a copy of TrendPointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? day = null,Object? current = null,Object? previous = freezed,}) {
  return _then(_TrendPointModel(
day: null == day ? _self.day : day // ignore: cast_nullable_to_non_nullable
as int,current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as num,previous: freezed == previous ? _self.previous : previous // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}


}


/// @nodoc
mixin _$SalesOverviewModel {

 DateTime get date; DateTime get dueAt; num get salesMtd; num get target; num get needPerDay; List<TrendPointModel> get trend; num get changePercent; List<DsrPostingModel> get history; DsrPostingModel? get todaysPosting;
/// Create a copy of SalesOverviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SalesOverviewModelCopyWith<SalesOverviewModel> get copyWith => _$SalesOverviewModelCopyWithImpl<SalesOverviewModel>(this as SalesOverviewModel, _$identity);

  /// Serializes this SalesOverviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SalesOverviewModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SalesOverviewModel&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.dueAt, _this.dueAt) || other.dueAt == _this.dueAt)&&(identical(other.salesMtd, _this.salesMtd) || other.salesMtd == _this.salesMtd)&&(identical(other.target, _this.target) || other.target == _this.target)&&(identical(other.needPerDay, _this.needPerDay) || other.needPerDay == _this.needPerDay)&&const DeepCollectionEquality().equals(other.trend, _this.trend)&&(identical(other.changePercent, _this.changePercent) || other.changePercent == _this.changePercent)&&const DeepCollectionEquality().equals(other.history, _this.history)&&(identical(other.todaysPosting, _this.todaysPosting) || other.todaysPosting == _this.todaysPosting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SalesOverviewModel;
  return Object.hash(runtimeType,_this.date,_this.dueAt,_this.salesMtd,_this.target,_this.needPerDay,const DeepCollectionEquality().hash(_this.trend),_this.changePercent,const DeepCollectionEquality().hash(_this.history),_this.todaysPosting);
}

@override
String toString() {
  final _this = this as SalesOverviewModel;
  return 'SalesOverviewModel(date: ${_this.date}, dueAt: ${_this.dueAt}, salesMtd: ${_this.salesMtd}, target: ${_this.target}, needPerDay: ${_this.needPerDay}, trend: ${_this.trend}, changePercent: ${_this.changePercent}, history: ${_this.history}, todaysPosting: ${_this.todaysPosting})';
}


}

/// @nodoc
abstract mixin class $SalesOverviewModelCopyWith<$Res>  {
  factory $SalesOverviewModelCopyWith(SalesOverviewModel value, $Res Function(SalesOverviewModel) _then) = _$SalesOverviewModelCopyWithImpl;
@useResult
$Res call({
 DateTime date, DateTime dueAt, num salesMtd, num target, num needPerDay, List<TrendPointModel> trend, num changePercent, List<DsrPostingModel> history, DsrPostingModel? todaysPosting
});


$DsrPostingModelCopyWith<$Res>? get todaysPosting;

}
/// @nodoc
class _$SalesOverviewModelCopyWithImpl<$Res>
    implements $SalesOverviewModelCopyWith<$Res> {
  _$SalesOverviewModelCopyWithImpl(this._self, this._then);

  final SalesOverviewModel _self;
  final $Res Function(SalesOverviewModel) _then;

/// Create a copy of SalesOverviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? dueAt = null,Object? salesMtd = null,Object? target = null,Object? needPerDay = null,Object? trend = null,Object? changePercent = null,Object? history = null,Object? todaysPosting = freezed,}) {
  return _then(SalesOverviewModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,dueAt: null == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime,salesMtd: null == salesMtd ? _self.salesMtd : salesMtd // ignore: cast_nullable_to_non_nullable
as num,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as num,needPerDay: null == needPerDay ? _self.needPerDay : needPerDay // ignore: cast_nullable_to_non_nullable
as num,trend: null == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as List<TrendPointModel>,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as num,history: null == history ? _self.history : history // ignore: cast_nullable_to_non_nullable
as List<DsrPostingModel>,todaysPosting: freezed == todaysPosting ? _self.todaysPosting : todaysPosting // ignore: cast_nullable_to_non_nullable
as DsrPostingModel?,
  ));
}
/// Create a copy of SalesOverviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DsrPostingModelCopyWith<$Res>? get todaysPosting {
    if (_self.todaysPosting == null) {
    return null;
  }

  return $DsrPostingModelCopyWith<$Res>(_self.todaysPosting!, (value) {
    return _then(_self.copyWith(todaysPosting: value));
  });
}
}


/// Adds pattern-matching-related methods to [SalesOverviewModel].
extension SalesOverviewModelPatterns on SalesOverviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SalesOverviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SalesOverviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SalesOverviewModel value)  $default,){
final _that = this;
switch (_that) {
case _SalesOverviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SalesOverviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _SalesOverviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  DateTime dueAt,  num salesMtd,  num target,  num needPerDay,  List<TrendPointModel> trend,  num changePercent,  List<DsrPostingModel> history,  DsrPostingModel? todaysPosting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SalesOverviewModel() when $default != null:
return $default(_that.date,_that.dueAt,_that.salesMtd,_that.target,_that.needPerDay,_that.trend,_that.changePercent,_that.history,_that.todaysPosting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  DateTime dueAt,  num salesMtd,  num target,  num needPerDay,  List<TrendPointModel> trend,  num changePercent,  List<DsrPostingModel> history,  DsrPostingModel? todaysPosting)  $default,) {final _that = this;
switch (_that) {
case _SalesOverviewModel():
return $default(_that.date,_that.dueAt,_that.salesMtd,_that.target,_that.needPerDay,_that.trend,_that.changePercent,_that.history,_that.todaysPosting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  DateTime dueAt,  num salesMtd,  num target,  num needPerDay,  List<TrendPointModel> trend,  num changePercent,  List<DsrPostingModel> history,  DsrPostingModel? todaysPosting)?  $default,) {final _that = this;
switch (_that) {
case _SalesOverviewModel() when $default != null:
return $default(_that.date,_that.dueAt,_that.salesMtd,_that.target,_that.needPerDay,_that.trend,_that.changePercent,_that.history,_that.todaysPosting);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SalesOverviewModel extends SalesOverviewModel {
  const _SalesOverviewModel({required this.date, required this.dueAt, required this.salesMtd, required this.target, required this.needPerDay, required  List<TrendPointModel> trend, required this.changePercent, required  List<DsrPostingModel> history, this.todaysPosting}): _trend = trend,_history = history,super._();
  factory _SalesOverviewModel.fromJson(Map<String, dynamic> json) => _$SalesOverviewModelFromJson(json);

@override final  DateTime date;
@override final  DateTime dueAt;
@override final  num salesMtd;
@override final  num target;
@override final  num needPerDay;
 final  List<TrendPointModel> _trend;
@override List<TrendPointModel> get trend {
  if (_trend is EqualUnmodifiableListView) return _trend;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trend);
}

@override final  num changePercent;
 final  List<DsrPostingModel> _history;
@override List<DsrPostingModel> get history {
  if (_history is EqualUnmodifiableListView) return _history;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_history);
}

@override final  DsrPostingModel? todaysPosting;

/// Create a copy of SalesOverviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SalesOverviewModelCopyWith<_SalesOverviewModel> get copyWith => __$SalesOverviewModelCopyWithImpl<_SalesOverviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SalesOverviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SalesOverviewModel&&(identical(other.date, date) || other.date == date)&&(identical(other.dueAt, dueAt) || other.dueAt == dueAt)&&(identical(other.salesMtd, salesMtd) || other.salesMtd == salesMtd)&&(identical(other.target, target) || other.target == target)&&(identical(other.needPerDay, needPerDay) || other.needPerDay == needPerDay)&&const DeepCollectionEquality().equals(other.trend, _trend)&&(identical(other.changePercent, changePercent) || other.changePercent == changePercent)&&const DeepCollectionEquality().equals(other.history, _history)&&(identical(other.todaysPosting, todaysPosting) || other.todaysPosting == todaysPosting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,dueAt,salesMtd,target,needPerDay,const DeepCollectionEquality().hash(_trend),changePercent,const DeepCollectionEquality().hash(_history),todaysPosting);
}

@override
String toString() {
    return 'SalesOverviewModel(date: $date, dueAt: $dueAt, salesMtd: $salesMtd, target: $target, needPerDay: $needPerDay, trend: $trend, changePercent: $changePercent, history: $history, todaysPosting: $todaysPosting)';
}


}

/// @nodoc
abstract mixin class _$SalesOverviewModelCopyWith<$Res> implements $SalesOverviewModelCopyWith<$Res> {
  factory _$SalesOverviewModelCopyWith(_SalesOverviewModel value, $Res Function(_SalesOverviewModel) _then) = __$SalesOverviewModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, DateTime dueAt, num salesMtd, num target, num needPerDay, List<TrendPointModel> trend, num changePercent, List<DsrPostingModel> history, DsrPostingModel? todaysPosting
});


@override $DsrPostingModelCopyWith<$Res>? get todaysPosting;

}
/// @nodoc
class __$SalesOverviewModelCopyWithImpl<$Res>
    implements _$SalesOverviewModelCopyWith<$Res> {
  __$SalesOverviewModelCopyWithImpl(this._self, this._then);

  final _SalesOverviewModel _self;
  final $Res Function(_SalesOverviewModel) _then;

/// Create a copy of SalesOverviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? dueAt = null,Object? salesMtd = null,Object? target = null,Object? needPerDay = null,Object? trend = null,Object? changePercent = null,Object? history = null,Object? todaysPosting = freezed,}) {
  return _then(_SalesOverviewModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,dueAt: null == dueAt ? _self.dueAt : dueAt // ignore: cast_nullable_to_non_nullable
as DateTime,salesMtd: null == salesMtd ? _self.salesMtd : salesMtd // ignore: cast_nullable_to_non_nullable
as num,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as num,needPerDay: null == needPerDay ? _self.needPerDay : needPerDay // ignore: cast_nullable_to_non_nullable
as num,trend: null == trend ? _self._trend : trend // ignore: cast_nullable_to_non_nullable
as List<TrendPointModel>,changePercent: null == changePercent ? _self.changePercent : changePercent // ignore: cast_nullable_to_non_nullable
as num,history: null == history ? _self._history : history // ignore: cast_nullable_to_non_nullable
as List<DsrPostingModel>,todaysPosting: freezed == todaysPosting ? _self.todaysPosting : todaysPosting // ignore: cast_nullable_to_non_nullable
as DsrPostingModel?,
  ));
}

/// Create a copy of SalesOverviewModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DsrPostingModelCopyWith<$Res>? get todaysPosting {
    if (_self.todaysPosting == null) {
    return null;
  }

  return $DsrPostingModelCopyWith<$Res>(_self.todaysPosting!, (value) {
    return _then(_self.copyWith(todaysPosting: value));
  });
}
}


/// @nodoc
mixin _$DsrCheckLineModel {

 String get field;@IdConverter() String get value; bool get ok;
/// Create a copy of DsrCheckLineModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DsrCheckLineModelCopyWith<DsrCheckLineModel> get copyWith => _$DsrCheckLineModelCopyWithImpl<DsrCheckLineModel>(this as DsrCheckLineModel, _$identity);

  /// Serializes this DsrCheckLineModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DsrCheckLineModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DsrCheckLineModel&&(identical(other.field, _this.field) || other.field == _this.field)&&(identical(other.value, _this.value) || other.value == _this.value)&&(identical(other.ok, _this.ok) || other.ok == _this.ok));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DsrCheckLineModel;
  return Object.hash(runtimeType,_this.field,_this.value,_this.ok);
}

@override
String toString() {
  final _this = this as DsrCheckLineModel;
  return 'DsrCheckLineModel(field: ${_this.field}, value: ${_this.value}, ok: ${_this.ok})';
}


}

/// @nodoc
abstract mixin class $DsrCheckLineModelCopyWith<$Res>  {
  factory $DsrCheckLineModelCopyWith(DsrCheckLineModel value, $Res Function(DsrCheckLineModel) _then) = _$DsrCheckLineModelCopyWithImpl;
@useResult
$Res call({
 String field,@IdConverter() String value, bool ok
});




}
/// @nodoc
class _$DsrCheckLineModelCopyWithImpl<$Res>
    implements $DsrCheckLineModelCopyWith<$Res> {
  _$DsrCheckLineModelCopyWithImpl(this._self, this._then);

  final DsrCheckLineModel _self;
  final $Res Function(DsrCheckLineModel) _then;

/// Create a copy of DsrCheckLineModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? field = null,Object? value = null,Object? ok = null,}) {
  return _then(DsrCheckLineModel(
field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DsrCheckLineModel].
extension DsrCheckLineModelPatterns on DsrCheckLineModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DsrCheckLineModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DsrCheckLineModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DsrCheckLineModel value)  $default,){
final _that = this;
switch (_that) {
case _DsrCheckLineModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DsrCheckLineModel value)?  $default,){
final _that = this;
switch (_that) {
case _DsrCheckLineModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String field, @IdConverter()  String value,  bool ok)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DsrCheckLineModel() when $default != null:
return $default(_that.field,_that.value,_that.ok);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String field, @IdConverter()  String value,  bool ok)  $default,) {final _that = this;
switch (_that) {
case _DsrCheckLineModel():
return $default(_that.field,_that.value,_that.ok);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String field, @IdConverter()  String value,  bool ok)?  $default,) {final _that = this;
switch (_that) {
case _DsrCheckLineModel() when $default != null:
return $default(_that.field,_that.value,_that.ok);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DsrCheckLineModel extends DsrCheckLineModel {
  const _DsrCheckLineModel({required this.field, @IdConverter() required this.value, required this.ok}): super._();
  factory _DsrCheckLineModel.fromJson(Map<String, dynamic> json) => _$DsrCheckLineModelFromJson(json);

@override final  String field;
@override@IdConverter() final  String value;
@override final  bool ok;

/// Create a copy of DsrCheckLineModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DsrCheckLineModelCopyWith<_DsrCheckLineModel> get copyWith => __$DsrCheckLineModelCopyWithImpl<_DsrCheckLineModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DsrCheckLineModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DsrCheckLineModel&&(identical(other.field, field) || other.field == field)&&(identical(other.value, value) || other.value == value)&&(identical(other.ok, ok) || other.ok == ok));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,field,value,ok);
}

@override
String toString() {
    return 'DsrCheckLineModel(field: $field, value: $value, ok: $ok)';
}


}

/// @nodoc
abstract mixin class _$DsrCheckLineModelCopyWith<$Res> implements $DsrCheckLineModelCopyWith<$Res> {
  factory _$DsrCheckLineModelCopyWith(_DsrCheckLineModel value, $Res Function(_DsrCheckLineModel) _then) = __$DsrCheckLineModelCopyWithImpl;
@override @useResult
$Res call({
 String field,@IdConverter() String value, bool ok
});




}
/// @nodoc
class __$DsrCheckLineModelCopyWithImpl<$Res>
    implements _$DsrCheckLineModelCopyWith<$Res> {
  __$DsrCheckLineModelCopyWithImpl(this._self, this._then);

  final _DsrCheckLineModel _self;
  final $Res Function(_DsrCheckLineModel) _then;

/// Create a copy of DsrCheckLineModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? field = null,Object? value = null,Object? ok = null,}) {
  return _then(_DsrCheckLineModel(
field: null == field ? _self.field : field // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,ok: null == ok ? _self.ok : ok // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DsrCheckModel {

@IdConverter() String get uploadId; String get fileName; int get size; List<DsrCheckLineModel> get lines; List<String> get warnings; bool get replacesExisting;
/// Create a copy of DsrCheckModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DsrCheckModelCopyWith<DsrCheckModel> get copyWith => _$DsrCheckModelCopyWithImpl<DsrCheckModel>(this as DsrCheckModel, _$identity);

  /// Serializes this DsrCheckModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DsrCheckModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DsrCheckModel&&(identical(other.uploadId, _this.uploadId) || other.uploadId == _this.uploadId)&&(identical(other.fileName, _this.fileName) || other.fileName == _this.fileName)&&(identical(other.size, _this.size) || other.size == _this.size)&&const DeepCollectionEquality().equals(other.lines, _this.lines)&&const DeepCollectionEquality().equals(other.warnings, _this.warnings)&&(identical(other.replacesExisting, _this.replacesExisting) || other.replacesExisting == _this.replacesExisting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DsrCheckModel;
  return Object.hash(runtimeType,_this.uploadId,_this.fileName,_this.size,const DeepCollectionEquality().hash(_this.lines),const DeepCollectionEquality().hash(_this.warnings),_this.replacesExisting);
}

@override
String toString() {
  final _this = this as DsrCheckModel;
  return 'DsrCheckModel(uploadId: ${_this.uploadId}, fileName: ${_this.fileName}, size: ${_this.size}, lines: ${_this.lines}, warnings: ${_this.warnings}, replacesExisting: ${_this.replacesExisting})';
}


}

/// @nodoc
abstract mixin class $DsrCheckModelCopyWith<$Res>  {
  factory $DsrCheckModelCopyWith(DsrCheckModel value, $Res Function(DsrCheckModel) _then) = _$DsrCheckModelCopyWithImpl;
@useResult
$Res call({
@IdConverter() String uploadId, String fileName, int size, List<DsrCheckLineModel> lines, List<String> warnings, bool replacesExisting
});




}
/// @nodoc
class _$DsrCheckModelCopyWithImpl<$Res>
    implements $DsrCheckModelCopyWith<$Res> {
  _$DsrCheckModelCopyWithImpl(this._self, this._then);

  final DsrCheckModel _self;
  final $Res Function(DsrCheckModel) _then;

/// Create a copy of DsrCheckModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uploadId = null,Object? fileName = null,Object? size = null,Object? lines = null,Object? warnings = null,Object? replacesExisting = null,}) {
  return _then(DsrCheckModel(
uploadId: null == uploadId ? _self.uploadId : uploadId // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,lines: null == lines ? _self.lines : lines // ignore: cast_nullable_to_non_nullable
as List<DsrCheckLineModel>,warnings: null == warnings ? _self.warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<String>,replacesExisting: null == replacesExisting ? _self.replacesExisting : replacesExisting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DsrCheckModel].
extension DsrCheckModelPatterns on DsrCheckModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DsrCheckModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DsrCheckModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DsrCheckModel value)  $default,){
final _that = this;
switch (_that) {
case _DsrCheckModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DsrCheckModel value)?  $default,){
final _that = this;
switch (_that) {
case _DsrCheckModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@IdConverter()  String uploadId,  String fileName,  int size,  List<DsrCheckLineModel> lines,  List<String> warnings,  bool replacesExisting)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DsrCheckModel() when $default != null:
return $default(_that.uploadId,_that.fileName,_that.size,_that.lines,_that.warnings,_that.replacesExisting);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@IdConverter()  String uploadId,  String fileName,  int size,  List<DsrCheckLineModel> lines,  List<String> warnings,  bool replacesExisting)  $default,) {final _that = this;
switch (_that) {
case _DsrCheckModel():
return $default(_that.uploadId,_that.fileName,_that.size,_that.lines,_that.warnings,_that.replacesExisting);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@IdConverter()  String uploadId,  String fileName,  int size,  List<DsrCheckLineModel> lines,  List<String> warnings,  bool replacesExisting)?  $default,) {final _that = this;
switch (_that) {
case _DsrCheckModel() when $default != null:
return $default(_that.uploadId,_that.fileName,_that.size,_that.lines,_that.warnings,_that.replacesExisting);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DsrCheckModel extends DsrCheckModel {
  const _DsrCheckModel({@IdConverter() required this.uploadId, required this.fileName, required this.size, required  List<DsrCheckLineModel> lines,  List<String> warnings = const <String>[], this.replacesExisting = false}): _lines = lines,_warnings = warnings,super._();
  factory _DsrCheckModel.fromJson(Map<String, dynamic> json) => _$DsrCheckModelFromJson(json);

@override@IdConverter() final  String uploadId;
@override final  String fileName;
@override final  int size;
 final  List<DsrCheckLineModel> _lines;
@override List<DsrCheckLineModel> get lines {
  if (_lines is EqualUnmodifiableListView) return _lines;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lines);
}

 final  List<String> _warnings;
@override@JsonKey() List<String> get warnings {
  if (_warnings is EqualUnmodifiableListView) return _warnings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_warnings);
}

@override@JsonKey() final  bool replacesExisting;

/// Create a copy of DsrCheckModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DsrCheckModelCopyWith<_DsrCheckModel> get copyWith => __$DsrCheckModelCopyWithImpl<_DsrCheckModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DsrCheckModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DsrCheckModel&&(identical(other.uploadId, uploadId) || other.uploadId == uploadId)&&(identical(other.fileName, fileName) || other.fileName == fileName)&&(identical(other.size, size) || other.size == size)&&const DeepCollectionEquality().equals(other.lines, _lines)&&const DeepCollectionEquality().equals(other.warnings, _warnings)&&(identical(other.replacesExisting, replacesExisting) || other.replacesExisting == replacesExisting));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,uploadId,fileName,size,const DeepCollectionEquality().hash(_lines),const DeepCollectionEquality().hash(_warnings),replacesExisting);
}

@override
String toString() {
    return 'DsrCheckModel(uploadId: $uploadId, fileName: $fileName, size: $size, lines: $lines, warnings: $warnings, replacesExisting: $replacesExisting)';
}


}

/// @nodoc
abstract mixin class _$DsrCheckModelCopyWith<$Res> implements $DsrCheckModelCopyWith<$Res> {
  factory _$DsrCheckModelCopyWith(_DsrCheckModel value, $Res Function(_DsrCheckModel) _then) = __$DsrCheckModelCopyWithImpl;
@override @useResult
$Res call({
@IdConverter() String uploadId, String fileName, int size, List<DsrCheckLineModel> lines, List<String> warnings, bool replacesExisting
});




}
/// @nodoc
class __$DsrCheckModelCopyWithImpl<$Res>
    implements _$DsrCheckModelCopyWith<$Res> {
  __$DsrCheckModelCopyWithImpl(this._self, this._then);

  final _DsrCheckModel _self;
  final $Res Function(_DsrCheckModel) _then;

/// Create a copy of DsrCheckModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uploadId = null,Object? fileName = null,Object? size = null,Object? lines = null,Object? warnings = null,Object? replacesExisting = null,}) {
  return _then(_DsrCheckModel(
uploadId: null == uploadId ? _self.uploadId : uploadId // ignore: cast_nullable_to_non_nullable
as String,fileName: null == fileName ? _self.fileName : fileName // ignore: cast_nullable_to_non_nullable
as String,size: null == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int,lines: null == lines ? _self._lines : lines // ignore: cast_nullable_to_non_nullable
as List<DsrCheckLineModel>,warnings: null == warnings ? _self._warnings : warnings // ignore: cast_nullable_to_non_nullable
as List<String>,replacesExisting: null == replacesExisting ? _self.replacesExisting : replacesExisting // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DsrSavedModel {

 DateTime get date; num get sales; int get bills; num get mtdPercent; bool get onTime; String get storeName; DateTime? get savedAt;
/// Create a copy of DsrSavedModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DsrSavedModelCopyWith<DsrSavedModel> get copyWith => _$DsrSavedModelCopyWithImpl<DsrSavedModel>(this as DsrSavedModel, _$identity);

  /// Serializes this DsrSavedModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DsrSavedModel;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DsrSavedModel&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.sales, _this.sales) || other.sales == _this.sales)&&(identical(other.bills, _this.bills) || other.bills == _this.bills)&&(identical(other.mtdPercent, _this.mtdPercent) || other.mtdPercent == _this.mtdPercent)&&(identical(other.onTime, _this.onTime) || other.onTime == _this.onTime)&&(identical(other.storeName, _this.storeName) || other.storeName == _this.storeName)&&(identical(other.savedAt, _this.savedAt) || other.savedAt == _this.savedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DsrSavedModel;
  return Object.hash(runtimeType,_this.date,_this.sales,_this.bills,_this.mtdPercent,_this.onTime,_this.storeName,_this.savedAt);
}

@override
String toString() {
  final _this = this as DsrSavedModel;
  return 'DsrSavedModel(date: ${_this.date}, sales: ${_this.sales}, bills: ${_this.bills}, mtdPercent: ${_this.mtdPercent}, onTime: ${_this.onTime}, storeName: ${_this.storeName}, savedAt: ${_this.savedAt})';
}


}

/// @nodoc
abstract mixin class $DsrSavedModelCopyWith<$Res>  {
  factory $DsrSavedModelCopyWith(DsrSavedModel value, $Res Function(DsrSavedModel) _then) = _$DsrSavedModelCopyWithImpl;
@useResult
$Res call({
 DateTime date, num sales, int bills, num mtdPercent, bool onTime, String storeName, DateTime? savedAt
});




}
/// @nodoc
class _$DsrSavedModelCopyWithImpl<$Res>
    implements $DsrSavedModelCopyWith<$Res> {
  _$DsrSavedModelCopyWithImpl(this._self, this._then);

  final DsrSavedModel _self;
  final $Res Function(DsrSavedModel) _then;

/// Create a copy of DsrSavedModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? sales = null,Object? bills = null,Object? mtdPercent = null,Object? onTime = null,Object? storeName = null,Object? savedAt = freezed,}) {
  return _then(DsrSavedModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as num,bills: null == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as int,mtdPercent: null == mtdPercent ? _self.mtdPercent : mtdPercent // ignore: cast_nullable_to_non_nullable
as num,onTime: null == onTime ? _self.onTime : onTime // ignore: cast_nullable_to_non_nullable
as bool,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,savedAt: freezed == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DsrSavedModel].
extension DsrSavedModelPatterns on DsrSavedModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DsrSavedModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DsrSavedModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DsrSavedModel value)  $default,){
final _that = this;
switch (_that) {
case _DsrSavedModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DsrSavedModel value)?  $default,){
final _that = this;
switch (_that) {
case _DsrSavedModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  num sales,  int bills,  num mtdPercent,  bool onTime,  String storeName,  DateTime? savedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DsrSavedModel() when $default != null:
return $default(_that.date,_that.sales,_that.bills,_that.mtdPercent,_that.onTime,_that.storeName,_that.savedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  num sales,  int bills,  num mtdPercent,  bool onTime,  String storeName,  DateTime? savedAt)  $default,) {final _that = this;
switch (_that) {
case _DsrSavedModel():
return $default(_that.date,_that.sales,_that.bills,_that.mtdPercent,_that.onTime,_that.storeName,_that.savedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  num sales,  int bills,  num mtdPercent,  bool onTime,  String storeName,  DateTime? savedAt)?  $default,) {final _that = this;
switch (_that) {
case _DsrSavedModel() when $default != null:
return $default(_that.date,_that.sales,_that.bills,_that.mtdPercent,_that.onTime,_that.storeName,_that.savedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DsrSavedModel extends DsrSavedModel {
  const _DsrSavedModel({required this.date, required this.sales, required this.bills, required this.mtdPercent, required this.onTime, this.storeName = '', this.savedAt}): super._();
  factory _DsrSavedModel.fromJson(Map<String, dynamic> json) => _$DsrSavedModelFromJson(json);

@override final  DateTime date;
@override final  num sales;
@override final  int bills;
@override final  num mtdPercent;
@override final  bool onTime;
@override@JsonKey() final  String storeName;
@override final  DateTime? savedAt;

/// Create a copy of DsrSavedModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DsrSavedModelCopyWith<_DsrSavedModel> get copyWith => __$DsrSavedModelCopyWithImpl<_DsrSavedModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DsrSavedModelToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DsrSavedModel&&(identical(other.date, date) || other.date == date)&&(identical(other.sales, sales) || other.sales == sales)&&(identical(other.bills, bills) || other.bills == bills)&&(identical(other.mtdPercent, mtdPercent) || other.mtdPercent == mtdPercent)&&(identical(other.onTime, onTime) || other.onTime == onTime)&&(identical(other.storeName, storeName) || other.storeName == storeName)&&(identical(other.savedAt, savedAt) || other.savedAt == savedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,date,sales,bills,mtdPercent,onTime,storeName,savedAt);
}

@override
String toString() {
    return 'DsrSavedModel(date: $date, sales: $sales, bills: $bills, mtdPercent: $mtdPercent, onTime: $onTime, storeName: $storeName, savedAt: $savedAt)';
}


}

/// @nodoc
abstract mixin class _$DsrSavedModelCopyWith<$Res> implements $DsrSavedModelCopyWith<$Res> {
  factory _$DsrSavedModelCopyWith(_DsrSavedModel value, $Res Function(_DsrSavedModel) _then) = __$DsrSavedModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, num sales, int bills, num mtdPercent, bool onTime, String storeName, DateTime? savedAt
});




}
/// @nodoc
class __$DsrSavedModelCopyWithImpl<$Res>
    implements _$DsrSavedModelCopyWith<$Res> {
  __$DsrSavedModelCopyWithImpl(this._self, this._then);

  final _DsrSavedModel _self;
  final $Res Function(_DsrSavedModel) _then;

/// Create a copy of DsrSavedModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? sales = null,Object? bills = null,Object? mtdPercent = null,Object? onTime = null,Object? storeName = null,Object? savedAt = freezed,}) {
  return _then(_DsrSavedModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,sales: null == sales ? _self.sales : sales // ignore: cast_nullable_to_non_nullable
as num,bills: null == bills ? _self.bills : bills // ignore: cast_nullable_to_non_nullable
as int,mtdPercent: null == mtdPercent ? _self.mtdPercent : mtdPercent // ignore: cast_nullable_to_non_nullable
as num,onTime: null == onTime ? _self.onTime : onTime // ignore: cast_nullable_to_non_nullable
as bool,storeName: null == storeName ? _self.storeName : storeName // ignore: cast_nullable_to_non_nullable
as String,savedAt: freezed == savedAt ? _self.savedAt : savedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
