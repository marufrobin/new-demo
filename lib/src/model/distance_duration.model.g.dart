// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'distance_duration.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DistanceDurationModel _$DistanceDurationModelFromJson(
  Map<String, dynamic> json,
) => _DistanceDurationModel(
  distance:
      json['distance'] == null
          ? null
          : DistanceDurationResponse.fromJson(
            json['distance'] as Map<String, dynamic>,
          ),
  duration:
      json['duration'] == null
          ? null
          : DistanceDurationResponse.fromJson(
            json['duration'] as Map<String, dynamic>,
          ),
);

Map<String, dynamic> _$DistanceDurationModelToJson(
  _DistanceDurationModel instance,
) => <String, dynamic>{
  'distance': instance.distance,
  'duration': instance.duration,
};

_DistanceDurationResponse _$DistanceDurationResponseFromJson(
  Map<String, dynamic> json,
) => _DistanceDurationResponse(
  text: json['text'] as String?,
  value: (json['value'] as num?)?.toInt(),
);

Map<String, dynamic> _$DistanceDurationResponseToJson(
  _DistanceDurationResponse instance,
) => <String, dynamic>{'text': instance.text, 'value': instance.value};
