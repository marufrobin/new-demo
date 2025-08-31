// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource_commit_history_reference.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ResourceCommitHistoryReference _$ResourceCommitHistoryReferenceFromJson(
  Map<String, dynamic> json,
) => _ResourceCommitHistoryReference(
  action: json['action'] as String?,
  commitedBy:
      json['commitedBy'] == null
          ? null
          : UserReference.fromJson(json['commitedBy'] as Map<String, dynamic>),
  committedAt:
      json['committedAt'] == null
          ? null
          : DateTime.parse(json['committedAt'] as String),
);

Map<String, dynamic> _$ResourceCommitHistoryReferenceToJson(
  _ResourceCommitHistoryReference instance,
) => <String, dynamic>{
  'action': instance.action,
  'commitedBy': instance.commitedBy,
  'committedAt': instance.committedAt?.toIso8601String(),
};
