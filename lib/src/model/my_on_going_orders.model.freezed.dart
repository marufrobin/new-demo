// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_on_going_orders.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MyOnGoingOrdersModel {

 List<DeliveryModel?>? get myOngoingOrders;
/// Create a copy of MyOnGoingOrdersModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MyOnGoingOrdersModelCopyWith<MyOnGoingOrdersModel> get copyWith => _$MyOnGoingOrdersModelCopyWithImpl<MyOnGoingOrdersModel>(this as MyOnGoingOrdersModel, _$identity);

  /// Serializes this MyOnGoingOrdersModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MyOnGoingOrdersModel&&const DeepCollectionEquality().equals(other.myOngoingOrders, myOngoingOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(myOngoingOrders));

@override
String toString() {
  return 'MyOnGoingOrdersModel(myOngoingOrders: $myOngoingOrders)';
}


}

/// @nodoc
abstract mixin class $MyOnGoingOrdersModelCopyWith<$Res>  {
  factory $MyOnGoingOrdersModelCopyWith(MyOnGoingOrdersModel value, $Res Function(MyOnGoingOrdersModel) _then) = _$MyOnGoingOrdersModelCopyWithImpl;
@useResult
$Res call({
 List<DeliveryModel?>? myOngoingOrders
});




}
/// @nodoc
class _$MyOnGoingOrdersModelCopyWithImpl<$Res>
    implements $MyOnGoingOrdersModelCopyWith<$Res> {
  _$MyOnGoingOrdersModelCopyWithImpl(this._self, this._then);

  final MyOnGoingOrdersModel _self;
  final $Res Function(MyOnGoingOrdersModel) _then;

/// Create a copy of MyOnGoingOrdersModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? myOngoingOrders = freezed,}) {
  return _then(_self.copyWith(
myOngoingOrders: freezed == myOngoingOrders ? _self.myOngoingOrders : myOngoingOrders // ignore: cast_nullable_to_non_nullable
as List<DeliveryModel?>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _MyOnGoingOrdersModel implements MyOnGoingOrdersModel {
  const _MyOnGoingOrdersModel({final  List<DeliveryModel?>? myOngoingOrders}): _myOngoingOrders = myOngoingOrders;
  factory _MyOnGoingOrdersModel.fromJson(Map<String, dynamic> json) => _$MyOnGoingOrdersModelFromJson(json);

 final  List<DeliveryModel?>? _myOngoingOrders;
@override List<DeliveryModel?>? get myOngoingOrders {
  final value = _myOngoingOrders;
  if (value == null) return null;
  if (_myOngoingOrders is EqualUnmodifiableListView) return _myOngoingOrders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MyOnGoingOrdersModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MyOnGoingOrdersModelCopyWith<_MyOnGoingOrdersModel> get copyWith => __$MyOnGoingOrdersModelCopyWithImpl<_MyOnGoingOrdersModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MyOnGoingOrdersModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MyOnGoingOrdersModel&&const DeepCollectionEquality().equals(other._myOngoingOrders, _myOngoingOrders));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_myOngoingOrders));

@override
String toString() {
  return 'MyOnGoingOrdersModel(myOngoingOrders: $myOngoingOrders)';
}


}

/// @nodoc
abstract mixin class _$MyOnGoingOrdersModelCopyWith<$Res> implements $MyOnGoingOrdersModelCopyWith<$Res> {
  factory _$MyOnGoingOrdersModelCopyWith(_MyOnGoingOrdersModel value, $Res Function(_MyOnGoingOrdersModel) _then) = __$MyOnGoingOrdersModelCopyWithImpl;
@override @useResult
$Res call({
 List<DeliveryModel?>? myOngoingOrders
});




}
/// @nodoc
class __$MyOnGoingOrdersModelCopyWithImpl<$Res>
    implements _$MyOnGoingOrdersModelCopyWith<$Res> {
  __$MyOnGoingOrdersModelCopyWithImpl(this._self, this._then);

  final _MyOnGoingOrdersModel _self;
  final $Res Function(_MyOnGoingOrdersModel) _then;

/// Create a copy of MyOnGoingOrdersModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? myOngoingOrders = freezed,}) {
  return _then(_MyOnGoingOrdersModel(
myOngoingOrders: freezed == myOngoingOrders ? _self._myOngoingOrders : myOngoingOrders // ignore: cast_nullable_to_non_nullable
as List<DeliveryModel?>?,
  ));
}


}

// dart format on
