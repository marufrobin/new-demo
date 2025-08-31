// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_thread.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportThreadModel _$SupportThreadModelFromJson(Map<String, dynamic> json) =>
    _SupportThreadModel(
      id: json['_id'] as String?,
      attachments:
          (json['attachments'] as List<dynamic>?)
              ?.map(
                (e) =>
                    e == null
                        ? null
                        : ServerFileReferenceModel.fromJson(
                          e as Map<String, dynamic>,
                        ),
              )
              .toList(),
      body: json['body'] as String?,
      createdAt:
          json['createdAt'] == null
              ? null
              : DateTime.parse(json['createdAt'] as String),
      softDeteled: json['softDeteled'] as bool?,
      status: $enumDecodeNullable(
        _$SUPPORT_THREAD_STATUSEnumMap,
        json['status'],
      ),
      supportThreadDomain: $enumDecodeNullable(
        _$SUPPORT_DOMAINEnumMap,
        json['supportThreadDomain'],
      ),
      title: json['title'] as String?,
      updatedAt:
          json['updatedAt'] == null
              ? null
              : DateTime.parse(json['updatedAt'] as String),
      user:
          json['user'] == null
              ? null
              : UserReference.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SupportThreadModelToJson(
  _SupportThreadModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'attachments': instance.attachments,
  'body': instance.body,
  'createdAt': instance.createdAt?.toIso8601String(),
  'softDeteled': instance.softDeteled,
  'status': _$SUPPORT_THREAD_STATUSEnumMap[instance.status],
  'supportThreadDomain': _$SUPPORT_DOMAINEnumMap[instance.supportThreadDomain],
  'title': instance.title,
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'user': instance.user,
};

const _$SUPPORT_THREAD_STATUSEnumMap = {
  SUPPORT_THREAD_STATUS.OPEN: 'OPEN',
  SUPPORT_THREAD_STATUS.IN_PROGRESS: 'IN_PROGRESS',
  SUPPORT_THREAD_STATUS.COMPLETE: 'COMPLETE',
};

const _$SUPPORT_DOMAINEnumMap = {
  SUPPORT_DOMAIN.CUSTOMER_AND_VENDOR: 'CUSTOMER_AND_VENDOR',
  SUPPORT_DOMAIN.VENDOR_AND_SYSTEM: 'VENDOR_AND_SYSTEM',
};
