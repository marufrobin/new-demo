// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_with_pagination.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DeliveryWithPaginationModel _$DeliveryWithPaginationModelFromJson(
  Map<String, dynamic> json,
) => _DeliveryWithPaginationModel(
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
                    : DeliveryModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$DeliveryWithPaginationModelToJson(
  _DeliveryWithPaginationModel instance,
) => <String, dynamic>{'meta': instance.meta, 'nodes': instance.nodes};
