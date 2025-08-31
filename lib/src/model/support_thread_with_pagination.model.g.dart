// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_thread_with_pagination.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportThreadWithPaginationModel _$SupportThreadWithPaginationModelFromJson(
  Map<String, dynamic> json,
) => _SupportThreadWithPaginationModel(
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
                    : SupportThreadModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$SupportThreadWithPaginationModelToJson(
  _SupportThreadWithPaginationModel instance,
) => <String, dynamic>{'meta': instance.meta, 'nodes': instance.nodes};
