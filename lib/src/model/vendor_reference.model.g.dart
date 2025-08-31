// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_reference.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VendorReference _$VendorReferenceFromJson(Map<String, dynamic> json) =>
    _VendorReference(
      name: json['name'] as String?,
      referenceId: json['referenceId'] as String?,
      VendorUID: json['VendorUID'] as String?,
    );

Map<String, dynamic> _$VendorReferenceToJson(_VendorReference instance) =>
    <String, dynamic>{
      'name': instance.name,
      'referenceId': instance.referenceId,
      'VendorUID': instance.VendorUID,
    };
