// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reference.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserReference _$UserReferenceFromJson(Map<String, dynamic> json) =>
    _UserReference(
      email: json['email'] as String?,
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      referenceId: json['referenceId'] as String?,
    );

Map<String, dynamic> _$UserReferenceToJson(_UserReference instance) =>
    <String, dynamic>{
      'email': instance.email,
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'referenceId': instance.referenceId,
    };
