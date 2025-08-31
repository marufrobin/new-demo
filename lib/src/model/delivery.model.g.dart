// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryModel _$DeliveryModelFromJson(
  Map<String, dynamic> json,
) => _DeliveryModel(
  id: json['_id'] as String?,
  amountToBePaidToVendorByRider:
      (json['amountToBePaidToVendorByRider'] as num?)?.toDouble(),
  amountTobeCollectedFromCustomerByRider:
      (json['amountTobeCollectedFromCustomerByRider'] as num?)?.toDouble(),
  assignedRider:
      json['assignedRider'] == null
          ? null
          : UserModel.fromJson(json['assignedRider'] as Map<String, dynamic>),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  customer:
      json['customer'] == null
          ? null
          : CustomerReference.fromJson(
            json['customer'] as Map<String, dynamic>,
          ),
  deliveredAt:
      json['deliveredAt'] == null
          ? null
          : DateTime.parse(json['deliveredAt'] as String),
  deliveryUID: json['deliveryUID'] as String?,
  destinationLocation:
      json['destinationLocation'] == null
          ? null
          : LocationReference.fromJson(
            json['destinationLocation'] as Map<String, dynamic>,
          ),
  invoice:
      json['invoice'] == null
          ? null
          : InvoiceModel.fromJson(json['invoice'] as Map<String, dynamic>),
  lastLookupRadius: (json['lastLookupRadius'] as num?)?.toInt(),
  note: json['note'] as String?,
  onBoardingRiderId: json['onBoardingRiderId'] as String?,
  parcel:
      json['parcel'] == null
          ? null
          : ParcelReferenceModel.fromJson(
            json['parcel'] as Map<String, dynamic>,
          ),
  parcelPaymentType: $enumDecodeNullable(
    _$ParcelPaymentTypeEnumMap,
    json['parcelPaymentType'],
  ),
  pickupConfirmationCode: json['pickupConfirmationCode'] as String?,
  pickupLocation:
      json['pickupLocation'] == null
          ? null
          : LocationReference.fromJson(
            json['pickupLocation'] as Map<String, dynamic>,
          ),
  requestReceivedByRiders:
      (json['requestReceivedByRiders'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null
                    ? null
                    : UserModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  requestRejectedByRiders:
      (json['requestRejectedByRiders'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null
                    ? null
                    : UserModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  riderFare: (json['riderFare'] as num?)?.toDouble(),
  status: $enumDecodeNullable(_$DeliveryStatusEnumMap, json['status']),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  vendor:
      json['vendor'] == null
          ? null
          : VendorReference.fromJson(json['vendor'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DeliveryModelToJson(
  _DeliveryModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'amountToBePaidToVendorByRider': instance.amountToBePaidToVendorByRider,
  'amountTobeCollectedFromCustomerByRider':
      instance.amountTobeCollectedFromCustomerByRider,
  'assignedRider': instance.assignedRider,
  'createdAt': instance.createdAt?.toIso8601String(),
  'customer': instance.customer,
  'deliveredAt': instance.deliveredAt?.toIso8601String(),
  'deliveryUID': instance.deliveryUID,
  'destinationLocation': instance.destinationLocation,
  'invoice': instance.invoice,
  'lastLookupRadius': instance.lastLookupRadius,
  'note': instance.note,
  'onBoardingRiderId': instance.onBoardingRiderId,
  'parcel': instance.parcel,
  'parcelPaymentType': _$ParcelPaymentTypeEnumMap[instance.parcelPaymentType],
  'pickupConfirmationCode': instance.pickupConfirmationCode,
  'pickupLocation': instance.pickupLocation,
  'requestReceivedByRiders': instance.requestReceivedByRiders,
  'requestRejectedByRiders': instance.requestRejectedByRiders,
  'riderFare': instance.riderFare,
  'status': _$DeliveryStatusEnumMap[instance.status],
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'vendor': instance.vendor,
};

const _$ParcelPaymentTypeEnumMap = {
  ParcelPaymentType.CASH: 'CASH',
  ParcelPaymentType.ONLINE: 'ONLINE',
};

const _$DeliveryStatusEnumMap = {
  DeliveryStatus.PENDING: 'PENDING',
  DeliveryStatus.FINDING_RIDER: 'FINDING_RIDER',
  DeliveryStatus.NO_RIDER_FOUND: 'NO_RIDER_FOUND',
  DeliveryStatus.RIDER_ON_THE_WAY_TO_PICKUP: 'RIDER_ON_THE_WAY_TO_PICKUP',
  DeliveryStatus.RIDER_PICKED_UP: 'RIDER_PICKED_UP',
  DeliveryStatus.RIDER_ON_THE_WAY_TO_DROPOFF: 'RIDER_ON_THE_WAY_TO_DROPOFF',
  DeliveryStatus.RIDER_NEARBY_DROPOFF: 'RIDER_NEARBY_DROPOFF',
  DeliveryStatus.DELIVERED: 'DELIVERED',
  DeliveryStatus.CANCELLED: 'CANCELLED',
};
