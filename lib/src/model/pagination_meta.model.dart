import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination_meta.model.freezed.dart';
part 'pagination_meta.model.g.dart';

@freezed
abstract class PaginationMeta with _$PaginationMeta {
  const factory PaginationMeta({
    int? currentPage,
    bool? hasNextPage,
    int? totalCount,
    int? totalPages,
  }) = _PaginationMeta;

  factory PaginationMeta.fromJson(Map<String, Object?> json) =>
      _$PaginationMetaFromJson(json);
}
