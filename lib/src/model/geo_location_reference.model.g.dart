// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geo_location_reference.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeoLocationReferenceModel _$GeoLocationReferenceModelFromJson(
  Map<String, dynamic> json,
) => _GeoLocationReferenceModel(
  coordinates:
      (json['coordinates'] as List<dynamic>?)
          ?.map((e) => (e as num?)?.toDouble())
          .toList(),
  type: json['type'] as String?,
);

Map<String, dynamic> _$GeoLocationReferenceModelToJson(
  _GeoLocationReferenceModel instance,
) => <String, dynamic>{
  'coordinates': instance.coordinates,
  'type': instance.type,
};
