// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_message.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportMessageModel _$SupportMessageModelFromJson(Map<String, dynamic> json) =>
    _SupportMessageModel(
      id: json['_id'] as String?,
      body: json['body'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      softDeteled: json['softDeteled'] as bool?,
      threadId: json['threadId'] as String?,
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      user:
          json['user'] == null
              ? null
              : UserReference.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SupportMessageModelToJson(
  _SupportMessageModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'body': instance.body,
  'createdAt': instance.createdAt?.toIso8601String(),
  'softDeteled': instance.softDeteled,
  'threadId': instance.threadId,
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'user': instance.user,
};
