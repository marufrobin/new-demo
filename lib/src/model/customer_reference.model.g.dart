// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer_reference.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CustomerReference _$CustomerReferenceFromJson(Map<String, dynamic> json) =>
    _CustomerReference(
      referenceId: json['referenceId'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      email: json['email'] as String?,
    );

Map<String, dynamic> _$CustomerReferenceToJson(_CustomerReference instance) =>
    <String, dynamic>{
      'referenceId': instance.referenceId,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
    };
