import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/pagination_meta.model.dart';
import 'package:rider/src/model/support_thread.model.dart';

part 'support_thread_with_pagination.model.freezed.dart';
part 'support_thread_with_pagination.model.g.dart';

@freezed
abstract class SupportThreadWithPaginationModel
    with _$SupportThreadWithPaginationModel {
  const factory SupportThreadWithPaginationModel({
    PaginationMeta? meta,
    List<SupportThreadModel?>? nodes,
  }) = _SupportThreadWithPaginationModel;

  factory SupportThreadWithPaginationModel.fromJson(
    Map<String, Object?> json,
  ) => _$SupportThreadWithPaginationModelFromJson(json);
}
