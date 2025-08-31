import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/pagination_meta.model.dart';
import 'package:rider/src/model/support_message.model.dart';

part 'support_message_with_pagination.model.freezed.dart';
part 'support_message_with_pagination.model.g.dart';

@freezed
abstract class SupportMessageWithPaginationModel
    with _$SupportMessageWithPaginationModel {
  const factory SupportMessageWithPaginationModel({
    PaginationMeta? meta,
    List<SupportMessageModel?>? nodes,
  }) = _SupportMessageWithPaginationModel;

  factory SupportMessageWithPaginationModel.fromJson(
    Map<String, Object?> json,
  ) => _$SupportMessageWithPaginationModelFromJson(json);
}
