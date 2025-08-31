// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_meta.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationMeta _$PaginationMetaFromJson(Map<String, dynamic> json) =>
    _PaginationMeta(
      currentPage: (json['currentPage'] as num?)?.toInt(),
      hasNextPage: json['hasNextPage'] as bool?,
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPages: (json['totalPages'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PaginationMetaToJson(_PaginationMeta instance) =>
    <String, dynamic>{
      'currentPage': instance.currentPage,
      'hasNextPage': instance.hasNextPage,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
    };
