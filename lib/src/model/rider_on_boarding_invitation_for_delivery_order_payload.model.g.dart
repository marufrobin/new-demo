// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rider_on_boarding_invitation_for_delivery_order_payload.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RiderOnBoardingInvitationForDeliveryOrderPayload
_$RiderOnBoardingInvitationForDeliveryOrderPayloadFromJson(
  Map<String, dynamic> json,
) => _RiderOnBoardingInvitationForDeliveryOrderPayload(
  riderId: json['riderId'] as String?,
  deliveryId: json['deliveryId'] as String?,
  deliveryUID: json['deliveryUID'] as String?,
  parcelReferenceId: json['parcelReferenceId'] as String?,
  parcelUID: json['parcelUID'] as String?,
  parcelOrderType: $enumDecodeNullable(
    _$PARCEL_ORDER_TYPEEnumMap,
    json['parcelOrderType'],
  ),
);

Map<String, dynamic> _$RiderOnBoardingInvitationForDeliveryOrderPayloadToJson(
  _RiderOnBoardingInvitationForDeliveryOrderPayload instance,
) => <String, dynamic>{
  'riderId': instance.riderId,
  'deliveryId': instance.deliveryId,
  'deliveryUID': instance.deliveryUID,
  'parcelReferenceId': instance.parcelReferenceId,
  'parcelUID': instance.parcelUID,
  'parcelOrderType': _$PARCEL_ORDER_TYPEEnumMap[instance.parcelOrderType],
};

const _$PARCEL_ORDER_TYPEEnumMap = {
  PARCEL_ORDER_TYPE.FOOD_DELIVERY: 'FOOD_DELIVERY',
  PARCEL_ORDER_TYPE.HOMEMADE: 'HOMEMADE',
};
