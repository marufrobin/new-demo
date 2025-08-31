// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rider_reference.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RiderReferenceModel _$RiderReferenceModelFromJson(Map<String, dynamic> json) =>
    _RiderReferenceModel(
      address: json['address'] as String?,
      contactNumber: json['contactNumber'] as String?,
      email: json['email'] as String?,
      name: json['name'] as String?,
      riderId: json['riderId'] as String?,
      serialNumber: json['serialNumber'] as String?,
    );

Map<String, dynamic> _$RiderReferenceModelToJson(
  _RiderReferenceModel instance,
) => <String, dynamic>{
  'address': instance.address,
  'contactNumber': instance.contactNumber,
  'email': instance.email,
  'name': instance.name,
  'riderId': instance.riderId,
  'serialNumber': instance.serialNumber,
};
