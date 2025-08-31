// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcements.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AnnouncementsModel _$AnnouncementsModelFromJson(Map<String, dynamic> json) =>
    _AnnouncementsModel(
      meta:
          json['meta'] == null
              ? null
              : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
      nodes:
          (json['nodes'] as List<dynamic>?)
              ?.map(
                (e) =>
                    e == null
                        ? null
                        : Announcement.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$AnnouncementsModelToJson(_AnnouncementsModel instance) =>
    <String, dynamic>{'meta': instance.meta, 'nodes': instance.nodes};

_Announcement _$AnnouncementFromJson(Map<String, dynamic> json) =>
    _Announcement(
      id: json['_id'] as String?,
      body: json['body'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      title: json['title'] as String?,
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$AnnouncementToJson(_Announcement instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'body': instance.body,
      'createdAt': instance.createdAt?.toIso8601String(),
      'title': instance.title,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
