// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'parcel_reference.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ParcelReferenceModel {

 double? get grossPrice; double? get netPrice; String? get parcelReferenceId; OrderType? get parcelOrderType; String? get parcelUID;
/// Create a copy of ParcelReferenceModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ParcelReferenceModelCopyWith<ParcelReferenceModel> get copyWith => _$ParcelReferenceModelCopyWithImpl<ParcelReferenceModel>(this as ParcelReferenceModel, _$identity);

  /// Serializes this ParcelReferenceModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ParcelReferenceModel&&(identical(other.grossPrice, grossPrice) || other.grossPrice == grossPrice)&&(identical(other.netPrice, netPrice) || other.netPrice == netPrice)&&(identical(other.parcelReferenceId, parcelReferenceId) || other.parcelReferenceId == parcelReferenceId)&&(identical(other.parcelOrderType, parcelOrderType) || other.parcelOrderType == parcelOrderType)&&(identical(other.parcelUID, parcelUID) || other.parcelUID == parcelUID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,grossPrice,netPrice,parcelReferenceId,parcelOrderType,parcelUID);

@override
String toString() {
  return 'ParcelReferenceModel(grossPrice: $grossPrice, netPrice: $netPrice, parcelReferenceId: $parcelReferenceId, parcelOrderType: $parcelOrderType, parcelUID: $parcelUID)';
}


}

/// @nodoc
abstract mixin class $ParcelReferenceModelCopyWith<$Res>  {
  factory $ParcelReferenceModelCopyWith(ParcelReferenceModel value, $Res Function(ParcelReferenceModel) _then) = _$ParcelReferenceModelCopyWithImpl;
@useResult
$Res call({
 double? grossPrice, double? netPrice, String? parcelReferenceId, OrderType? parcelOrderType, String? parcelUID
});




}
/// @nodoc
class _$ParcelReferenceModelCopyWithImpl<$Res>
    implements $ParcelReferenceModelCopyWith<$Res> {
  _$ParcelReferenceModelCopyWithImpl(this._self, this._then);

  final ParcelReferenceModel _self;
  final $Res Function(ParcelReferenceModel) _then;

/// Create a copy of ParcelReferenceModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? grossPrice = freezed,Object? netPrice = freezed,Object? parcelReferenceId = freezed,Object? parcelOrderType = freezed,Object? parcelUID = freezed,}) {
  return _then(_self.copyWith(
grossPrice: freezed == grossPrice ? _self.grossPrice : grossPrice // ignore: cast_nullable_to_non_nullable
as double?,netPrice: freezed == netPrice ? _self.netPrice : netPrice // ignore: cast_nullable_to_non_nullable
as double?,parcelReferenceId: freezed == parcelReferenceId ? _self.parcelReferenceId : parcelReferenceId // ignore: cast_nullable_to_non_nullable
as String?,parcelOrderType: freezed == parcelOrderType ? _self.parcelOrderType : parcelOrderType // ignore: cast_nullable_to_non_nullable
as OrderType?,parcelUID: freezed == parcelUID ? _self.parcelUID : parcelUID // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _ParcelReferenceModel implements ParcelReferenceModel {
  const _ParcelReferenceModel({this.grossPrice, this.netPrice, this.parcelReferenceId, this.parcelOrderType, this.parcelUID});
  factory _ParcelReferenceModel.fromJson(Map<String, dynamic> json) => _$ParcelReferenceModelFromJson(json);

@override final  double? grossPrice;
@override final  double? netPrice;
@override final  String? parcelReferenceId;
@override final  OrderType? parcelOrderType;
@override final  String? parcelUID;

/// Create a copy of ParcelReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ParcelReferenceModelCopyWith<_ParcelReferenceModel> get copyWith => __$ParcelReferenceModelCopyWithImpl<_ParcelReferenceModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ParcelReferenceModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ParcelReferenceModel&&(identical(other.grossPrice, grossPrice) || other.grossPrice == grossPrice)&&(identical(other.netPrice, netPrice) || other.netPrice == netPrice)&&(identical(other.parcelReferenceId, parcelReferenceId) || other.parcelReferenceId == parcelReferenceId)&&(identical(other.parcelOrderType, parcelOrderType) || other.parcelOrderType == parcelOrderType)&&(identical(other.parcelUID, parcelUID) || other.parcelUID == parcelUID));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,grossPrice,netPrice,parcelReferenceId,parcelOrderType,parcelUID);

@override
String toString() {
  return 'ParcelReferenceModel(grossPrice: $grossPrice, netPrice: $netPrice, parcelReferenceId: $parcelReferenceId, parcelOrderType: $parcelOrderType, parcelUID: $parcelUID)';
}


}

/// @nodoc
abstract mixin class _$ParcelReferenceModelCopyWith<$Res> implements $ParcelReferenceModelCopyWith<$Res> {
  factory _$ParcelReferenceModelCopyWith(_ParcelReferenceModel value, $Res Function(_ParcelReferenceModel) _then) = __$ParcelReferenceModelCopyWithImpl;
@override @useResult
$Res call({
 double? grossPrice, double? netPrice, String? parcelReferenceId, OrderType? parcelOrderType, String? parcelUID
});




}
/// @nodoc
class __$ParcelReferenceModelCopyWithImpl<$Res>
    implements _$ParcelReferenceModelCopyWith<$Res> {
  __$ParcelReferenceModelCopyWithImpl(this._self, this._then);

  final _ParcelReferenceModel _self;
  final $Res Function(_ParcelReferenceModel) _then;

/// Create a copy of ParcelReferenceModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? grossPrice = freezed,Object? netPrice = freezed,Object? parcelReferenceId = freezed,Object? parcelOrderType = freezed,Object? parcelUID = freezed,}) {
  return _then(_ParcelReferenceModel(
grossPrice: freezed == grossPrice ? _self.grossPrice : grossPrice // ignore: cast_nullable_to_non_nullable
as double?,netPrice: freezed == netPrice ? _self.netPrice : netPrice // ignore: cast_nullable_to_non_nullable
as double?,parcelReferenceId: freezed == parcelReferenceId ? _self.parcelReferenceId : parcelReferenceId // ignore: cast_nullable_to_non_nullable
as String?,parcelOrderType: freezed == parcelOrderType ? _self.parcelOrderType : parcelOrderType // ignore: cast_nullable_to_non_nullable
as OrderType?,parcelUID: freezed == parcelUID ? _self.parcelUID : parcelUID // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
