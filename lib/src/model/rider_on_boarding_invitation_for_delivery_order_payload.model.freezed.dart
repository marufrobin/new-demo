// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rider_on_boarding_invitation_for_delivery_order_payload.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RiderOnBoardingInvitationForDeliveryOrderPayload {

 String? get riderId; String? get deliveryId; String? get deliveryUID; String? get parcelReferenceId; String? get parcelUID; PARCEL_ORDER_TYPE? get parcelOrderType;
/// Create a copy of RiderOnBoardingInvitationForDeliveryOrderPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWith<RiderOnBoardingInvitationForDeliveryOrderPayload> get copyWith => _$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWithImpl<RiderOnBoardingInvitationForDeliveryOrderPayload>(this as RiderOnBoardingInvitationForDeliveryOrderPayload, _$identity);

  /// Serializes this RiderOnBoardingInvitationForDeliveryOrderPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RiderOnBoardingInvitationForDeliveryOrderPayload&&(identical(other.riderId, riderId) || other.riderId == riderId)&&(identical(other.deliveryId, deliveryId) || other.deliveryId == deliveryId)&&(identical(other.deliveryUID, deliveryUID) || other.deliveryUID == deliveryUID)&&(identical(other.parcelReferenceId, parcelReferenceId) || other.parcelReferenceId == parcelReferenceId)&&(identical(other.parcelUID, parcelUID) || other.parcelUID == parcelUID)&&(identical(other.parcelOrderType, parcelOrderType) || other.parcelOrderType == parcelOrderType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,riderId,deliveryId,deliveryUID,parcelReferenceId,parcelUID,parcelOrderType);

@override
String toString() {
  return 'RiderOnBoardingInvitationForDeliveryOrderPayload(riderId: $riderId, deliveryId: $deliveryId, deliveryUID: $deliveryUID, parcelReferenceId: $parcelReferenceId, parcelUID: $parcelUID, parcelOrderType: $parcelOrderType)';
}


}

/// @nodoc
abstract mixin class $RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWith<$Res>  {
  factory $RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWith(RiderOnBoardingInvitationForDeliveryOrderPayload value, $Res Function(RiderOnBoardingInvitationForDeliveryOrderPayload) _then) = _$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWithImpl;
@useResult
$Res call({
 String? riderId, String? deliveryId, String? deliveryUID, String? parcelReferenceId, String? parcelUID, PARCEL_ORDER_TYPE? parcelOrderType
});




}
/// @nodoc
class _$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWithImpl<$Res>
    implements $RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWith<$Res> {
  _$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWithImpl(this._self, this._then);

  final RiderOnBoardingInvitationForDeliveryOrderPayload _self;
  final $Res Function(RiderOnBoardingInvitationForDeliveryOrderPayload) _then;

/// Create a copy of RiderOnBoardingInvitationForDeliveryOrderPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? riderId = freezed,Object? deliveryId = freezed,Object? deliveryUID = freezed,Object? parcelReferenceId = freezed,Object? parcelUID = freezed,Object? parcelOrderType = freezed,}) {
  return _then(_self.copyWith(
riderId: freezed == riderId ? _self.riderId : riderId // ignore: cast_nullable_to_non_nullable
as String?,deliveryId: freezed == deliveryId ? _self.deliveryId : deliveryId // ignore: cast_nullable_to_non_nullable
as String?,deliveryUID: freezed == deliveryUID ? _self.deliveryUID : deliveryUID // ignore: cast_nullable_to_non_nullable
as String?,parcelReferenceId: freezed == parcelReferenceId ? _self.parcelReferenceId : parcelReferenceId // ignore: cast_nullable_to_non_nullable
as String?,parcelUID: freezed == parcelUID ? _self.parcelUID : parcelUID // ignore: cast_nullable_to_non_nullable
as String?,parcelOrderType: freezed == parcelOrderType ? _self.parcelOrderType : parcelOrderType // ignore: cast_nullable_to_non_nullable
as PARCEL_ORDER_TYPE?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _RiderOnBoardingInvitationForDeliveryOrderPayload implements RiderOnBoardingInvitationForDeliveryOrderPayload {
   _RiderOnBoardingInvitationForDeliveryOrderPayload({this.riderId, this.deliveryId, this.deliveryUID, this.parcelReferenceId, this.parcelUID, this.parcelOrderType});
  factory _RiderOnBoardingInvitationForDeliveryOrderPayload.fromJson(Map<String, dynamic> json) => _$RiderOnBoardingInvitationForDeliveryOrderPayloadFromJson(json);

@override final  String? riderId;
@override final  String? deliveryId;
@override final  String? deliveryUID;
@override final  String? parcelReferenceId;
@override final  String? parcelUID;
@override final  PARCEL_ORDER_TYPE? parcelOrderType;

/// Create a copy of RiderOnBoardingInvitationForDeliveryOrderPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWith<_RiderOnBoardingInvitationForDeliveryOrderPayload> get copyWith => __$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWithImpl<_RiderOnBoardingInvitationForDeliveryOrderPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RiderOnBoardingInvitationForDeliveryOrderPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RiderOnBoardingInvitationForDeliveryOrderPayload&&(identical(other.riderId, riderId) || other.riderId == riderId)&&(identical(other.deliveryId, deliveryId) || other.deliveryId == deliveryId)&&(identical(other.deliveryUID, deliveryUID) || other.deliveryUID == deliveryUID)&&(identical(other.parcelReferenceId, parcelReferenceId) || other.parcelReferenceId == parcelReferenceId)&&(identical(other.parcelUID, parcelUID) || other.parcelUID == parcelUID)&&(identical(other.parcelOrderType, parcelOrderType) || other.parcelOrderType == parcelOrderType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,riderId,deliveryId,deliveryUID,parcelReferenceId,parcelUID,parcelOrderType);

@override
String toString() {
  return 'RiderOnBoardingInvitationForDeliveryOrderPayload(riderId: $riderId, deliveryId: $deliveryId, deliveryUID: $deliveryUID, parcelReferenceId: $parcelReferenceId, parcelUID: $parcelUID, parcelOrderType: $parcelOrderType)';
}


}

/// @nodoc
abstract mixin class _$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWith<$Res> implements $RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWith<$Res> {
  factory _$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWith(_RiderOnBoardingInvitationForDeliveryOrderPayload value, $Res Function(_RiderOnBoardingInvitationForDeliveryOrderPayload) _then) = __$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWithImpl;
@override @useResult
$Res call({
 String? riderId, String? deliveryId, String? deliveryUID, String? parcelReferenceId, String? parcelUID, PARCEL_ORDER_TYPE? parcelOrderType
});




}
/// @nodoc
class __$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWithImpl<$Res>
    implements _$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWith<$Res> {
  __$RiderOnBoardingInvitationForDeliveryOrderPayloadCopyWithImpl(this._self, this._then);

  final _RiderOnBoardingInvitationForDeliveryOrderPayload _self;
  final $Res Function(_RiderOnBoardingInvitationForDeliveryOrderPayload) _then;

/// Create a copy of RiderOnBoardingInvitationForDeliveryOrderPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? riderId = freezed,Object? deliveryId = freezed,Object? deliveryUID = freezed,Object? parcelReferenceId = freezed,Object? parcelUID = freezed,Object? parcelOrderType = freezed,}) {
  return _then(_RiderOnBoardingInvitationForDeliveryOrderPayload(
riderId: freezed == riderId ? _self.riderId : riderId // ignore: cast_nullable_to_non_nullable
as String?,deliveryId: freezed == deliveryId ? _self.deliveryId : deliveryId // ignore: cast_nullable_to_non_nullable
as String?,deliveryUID: freezed == deliveryUID ? _self.deliveryUID : deliveryUID // ignore: cast_nullable_to_non_nullable
as String?,parcelReferenceId: freezed == parcelReferenceId ? _self.parcelReferenceId : parcelReferenceId // ignore: cast_nullable_to_non_nullable
as String?,parcelUID: freezed == parcelUID ? _self.parcelUID : parcelUID // ignore: cast_nullable_to_non_nullable
as String?,parcelOrderType: freezed == parcelOrderType ? _self.parcelOrderType : parcelOrderType // ignore: cast_nullable_to_non_nullable
as PARCEL_ORDER_TYPE?,
  ));
}


}

// dart format on
