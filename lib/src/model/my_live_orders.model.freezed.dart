// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_live_orders.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyLiveOrdersModel {

 List<DeliveryModel?>? get myJobs;
/// Create a copy of MyLiveOrdersModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyLiveOrdersModelCopyWith<MyLiveOrdersModel> get copyWith => _$MyLiveOrdersModelCopyWithImpl<MyLiveOrdersModel>(this as MyLiveOrdersModel, _$identity);

  /// Serializes this MyLiveOrdersModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyLiveOrdersModel&&const DeepCollectionEquality().equals(other.myJobs, myJobs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(myJobs));

@override
String toString() {
  return 'MyLiveOrdersModel(myJobs: $myJobs)';
}


}

/// @nodoc
abstract mixin class $MyLiveOrdersModelCopyWith<$Res>  {
  factory $MyLiveOrdersModelCopyWith(MyLiveOrdersModel value, $Res Function(MyLiveOrdersModel) _then) = _$MyLiveOrdersModelCopyWithImpl;
@useResult
$Res call({
 List<DeliveryModel?>? myJobs
});




}
/// @nodoc
class _$MyLiveOrdersModelCopyWithImpl<$Res>
    implements $MyLiveOrdersModelCopyWith<$Res> {
  _$MyLiveOrdersModelCopyWithImpl(this._self, this._then);

  final MyLiveOrdersModel _self;
  final $Res Function(MyLiveOrdersModel) _then;

/// Create a copy of MyLiveOrdersModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? myJobs = freezed,}) {
  return _then(_self.copyWith(
myJobs: freezed == myJobs ? _self.myJobs : myJobs // ignore: cast_nullable_to_non_nullable
as List<DeliveryModel?>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MyLiveOrdersModel implements MyLiveOrdersModel {
  const _MyLiveOrdersModel({final  List<DeliveryModel?>? myJobs}): _myJobs = myJobs;
  factory _MyLiveOrdersModel.fromJson(Map<String, dynamic> json) => _$MyLiveOrdersModelFromJson(json);

 final  List<DeliveryModel?>? _myJobs;
@override List<DeliveryModel?>? get myJobs {
  final value = _myJobs;
  if (value == null) return null;
  if (_myJobs is EqualUnmodifiableListView) return _myJobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MyLiveOrdersModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyLiveOrdersModelCopyWith<_MyLiveOrdersModel> get copyWith => __$MyLiveOrdersModelCopyWithImpl<_MyLiveOrdersModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyLiveOrdersModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyLiveOrdersModel&&const DeepCollectionEquality().equals(other._myJobs, _myJobs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_myJobs));

@override
String toString() {
  return 'MyLiveOrdersModel(myJobs: $myJobs)';
}


}

/// @nodoc
abstract mixin class _$MyLiveOrdersModelCopyWith<$Res> implements $MyLiveOrdersModelCopyWith<$Res> {
  factory _$MyLiveOrdersModelCopyWith(_MyLiveOrdersModel value, $Res Function(_MyLiveOrdersModel) _then) = __$MyLiveOrdersModelCopyWithImpl;
@override @useResult
$Res call({
 List<DeliveryModel?>? myJobs
});




}
/// @nodoc
class __$MyLiveOrdersModelCopyWithImpl<$Res>
    implements _$MyLiveOrdersModelCopyWith<$Res> {
  __$MyLiveOrdersModelCopyWithImpl(this._self, this._then);

  final _MyLiveOrdersModel _self;
  final $Res Function(_MyLiveOrdersModel) _then;

/// Create a copy of MyLiveOrdersModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myJobs = freezed,}) {
  return _then(_MyLiveOrdersModel(
myJobs: freezed == myJobs ? _self._myJobs : myJobs // ignore: cast_nullable_to_non_nullable
as List<DeliveryModel?>?,
  ));
}


}

// dart format on
