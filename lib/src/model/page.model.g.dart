// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PageModel _$PageModelFromJson(Map<String, dynamic> json) => _PageModel(
  id: json['_id'] as String?,
  body: json['body'] as String?,
  commits:
      json['commits'] == null
          ? null
          : ResourceCommitHistoryReference.fromJson(
            json['commits'] as Map<String, dynamic>,
          ),
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  handel: json['handel'] as String?,
  title: json['title'] as String?,
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$PageModelToJson(_PageModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'body': instance.body,
      'commits': instance.commits,
      'createdAt': instance.createdAt?.toIso8601String(),
      'handel': instance.handel,
      'title': instance.title,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
