// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifications.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NotificationsModel _$NotificationsModelFromJson(Map<String, dynamic> json) =>
    _NotificationsModel(
      nodes:
          (json['nodes'] as List<dynamic>?)
              ?.map(
                (e) =>
                    e == null
                        ? null
                        : NotificationModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
      meta:
          json['meta'] == null
              ? null
              : PaginationMeta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NotificationsModelToJson(_NotificationsModel instance) =>
    <String, dynamic>{'nodes': instance.nodes, 'meta': instance.meta};

_NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    _NotificationModel(
      id: json['_id'] as String?,
      body: json['body'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      payload: json['payload'] as String?,
      recipients:
          (json['recipients'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList(),
      title: json['title'] as String?,
      topic: json['topic'] as String?,
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$NotificationModelToJson(_NotificationModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'body': instance.body,
      'createdAt': instance.createdAt?.toIso8601String(),
      'payload': instance.payload,
      'recipients': instance.recipients,
      'title': instance.title,
      'topic': instance.topic,
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
