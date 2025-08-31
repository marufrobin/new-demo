import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/delivery.model.dart';
import 'package:rider/src/model/pagination_meta.model.dart';

part 'delivery_with_pagination.model.freezed.dart';
part 'delivery_with_pagination.model.g.dart';

@freezed
abstract class DeliveryWithPaginationModel with _$DeliveryWithPaginationModel {
  const factory DeliveryWithPaginationModel({
    PaginationMeta? meta,
    List<DeliveryModel?>? nodes,
  }) = _DeliveryWithPaginationModel;

  factory DeliveryWithPaginationModel.fromJson(Map<String, Object?> json) =>
      _$DeliveryWithPaginationModelFromJson(json);
}
