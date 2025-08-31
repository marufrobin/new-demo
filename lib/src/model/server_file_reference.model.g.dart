// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_file_reference.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ServerFileReferenceModel _$ServerFileReferenceModelFromJson(
  Map<String, dynamic> json,
) => _ServerFileReferenceModel(
  bucket: json['bucket'] as String?,
  externalUrl: json['externalUrl'] as String?,
  key: json['key'] as String?,
  region: json['region'] as String?,
);

Map<String, dynamic> _$ServerFileReferenceModelToJson(
  _ServerFileReferenceModel instance,
) => <String, dynamic>{
  'bucket': instance.bucket,
  'externalUrl': instance.externalUrl,
  'key': instance.key,
  'region': instance.region,
};
