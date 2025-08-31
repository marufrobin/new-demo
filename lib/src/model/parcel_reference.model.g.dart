// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'parcel_reference.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ParcelReferenceModel _$ParcelReferenceModelFromJson(
  Map<String, dynamic> json,
) => _ParcelReferenceModel(
  grossPrice: (json['grossPrice'] as num?)?.toDouble(),
  netPrice: (json['netPrice'] as num?)?.toDouble(),
  parcelReferenceId: json['parcelReferenceId'] as String?,
  parcelOrderType: $enumDecodeNullable(
    _$OrderTypeEnumMap,
    json['parcelOrderType'],
  ),
  parcelUID: json['parcelUID'] as String?,
);

Map<String, dynamic> _$ParcelReferenceModelToJson(
  _ParcelReferenceModel instance,
) => <String, dynamic>{
  'grossPrice': instance.grossPrice,
  'netPrice': instance.netPrice,
  'parcelReferenceId': instance.parcelReferenceId,
  'parcelOrderType': _$OrderTypeEnumMap[instance.parcelOrderType],
  'parcelUID': instance.parcelUID,
};

const _$OrderTypeEnumMap = {
  OrderType.FOOD_DELIVERY: 'FOOD_DELIVERY',
  OrderType.HOMEMADE: 'HOMEMADE',
};
