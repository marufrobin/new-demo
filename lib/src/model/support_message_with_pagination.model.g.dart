// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_message_with_pagination.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportMessageWithPaginationModel _$SupportMessageWithPaginationModelFromJson(
  Map<String, dynamic> json,
) => _SupportMessageWithPaginationModel(
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
                    : SupportMessageModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$SupportMessageWithPaginationModelToJson(
  _SupportMessageWithPaginationModel instance,
) => <String, dynamic>{'meta': instance.meta, 'nodes': instance.nodes};
