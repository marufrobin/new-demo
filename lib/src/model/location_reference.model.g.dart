// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_reference.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LocationReference _$LocationReferenceFromJson(Map<String, dynamic> json) =>
    _LocationReference(
      title: json['title'] as String?,
      address: json['address'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lng: (json['lng'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$LocationReferenceToJson(_LocationReference instance) =>
    <String, dynamic>{
      'title': instance.title,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
    };
