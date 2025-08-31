import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/model/pagination_meta.model.dart';
import 'package:rider/src/model/rider_reference.model.dart';

part 'invoices.model.freezed.dart';
part 'invoices.model.g.dart';

@freezed
abstract class InvoicesModel with _$InvoicesModel {
  factory InvoicesModel({PaginationMeta? meta, List<InvoiceModel?>? nodes}) =
      _InvoicesModel;

  factory InvoicesModel.fromJson(Map<String, Object?> json) =>
      _$InvoicesModelFromJson(json);
}

@freezed
abstract class InvoiceModel with _$InvoiceModel {
  factory InvoiceModel({
    @JsonKey(name: "_id") String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    double? disbursedAmount,
    double? incomeAmount,
    List<InvoiceItemsModel?>? items,
    InvoicePaymentDispatchMethod? paymentDisbursementChannel,
    InvoicePaymentDispatchStatus? paymentDisbursementStatus,
    RiderReferenceModel? rider,
    String? uid,
  }) = _InvoiceModel;

  factory InvoiceModel.fromJson(Map<String, Object?> json) =>
      _$InvoiceModelFromJson(json);
}

@freezed
abstract class InvoiceItemsModel with _$InvoiceItemsModel {
  factory InvoiceItemsModel({
    DateTime? date,
    String? deliveryId,
    String? deliveryUID,
    double? riderFare,
  }) = _InvoiceItemsModel;

  factory InvoiceItemsModel.fromJson(Map<String, Object?> json) =>
      _$InvoiceItemsModelFromJson(json);
}
