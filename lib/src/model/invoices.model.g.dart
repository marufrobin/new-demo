// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoices.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InvoicesModel _$InvoicesModelFromJson(Map<String, dynamic> json) =>
    _InvoicesModel(
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
                        : InvoiceModel.fromJson(e as Map<String, dynamic>),
              )
              .toList(),
    );

Map<String, dynamic> _$InvoicesModelToJson(_InvoicesModel instance) =>
    <String, dynamic>{'meta': instance.meta, 'nodes': instance.nodes};

_InvoiceModel _$InvoiceModelFromJson(
  Map<String, dynamic> json,
) => _InvoiceModel(
  id: json['_id'] as String?,
  createdAt:
      json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
  updatedAt:
      json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
  disbursedAmount: (json['disbursedAmount'] as num?)?.toDouble(),
  incomeAmount: (json['incomeAmount'] as num?)?.toDouble(),
  items:
      (json['items'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null
                    ? null
                    : InvoiceItemsModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
  paymentDisbursementChannel: $enumDecodeNullable(
    _$InvoicePaymentDispatchMethodEnumMap,
    json['paymentDisbursementChannel'],
  ),
  paymentDisbursementStatus: $enumDecodeNullable(
    _$InvoicePaymentDispatchStatusEnumMap,
    json['paymentDisbursementStatus'],
  ),
  rider:
      json['rider'] == null
          ? null
          : RiderReferenceModel.fromJson(json['rider'] as Map<String, dynamic>),
  uid: json['uid'] as String?,
);

Map<String, dynamic> _$InvoiceModelToJson(
  _InvoiceModel instance,
) => <String, dynamic>{
  '_id': instance.id,
  'createdAt': instance.createdAt?.toIso8601String(),
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'disbursedAmount': instance.disbursedAmount,
  'incomeAmount': instance.incomeAmount,
  'items': instance.items,
  'paymentDisbursementChannel':
      _$InvoicePaymentDispatchMethodEnumMap[instance
          .paymentDisbursementChannel],
  'paymentDisbursementStatus':
      _$InvoicePaymentDispatchStatusEnumMap[instance.paymentDisbursementStatus],
  'rider': instance.rider,
  'uid': instance.uid,
};

const _$InvoicePaymentDispatchMethodEnumMap = {
  InvoicePaymentDispatchMethod.BKASH: 'BKASH',
  InvoicePaymentDispatchMethod.BANK_TRANSFER: 'BANK_TRANSFER',
};

const _$InvoicePaymentDispatchStatusEnumMap = {
  InvoicePaymentDispatchStatus.NOT_PAYABLE: 'NOT_PAYABLE',
  InvoicePaymentDispatchStatus.PENDING: 'PENDING',
  InvoicePaymentDispatchStatus.CLEARED: 'CLEARED',
  InvoicePaymentDispatchStatus.PARTIALLY_CLEARED: 'PARTIALLY_CLEARED',
};

_InvoiceItemsModel _$InvoiceItemsModelFromJson(Map<String, dynamic> json) =>
    _InvoiceItemsModel(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      deliveryId: json['deliveryId'] as String?,
      deliveryUID: json['deliveryUID'] as String?,
      riderFare: (json['riderFare'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$InvoiceItemsModelToJson(_InvoiceItemsModel instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'deliveryId': instance.deliveryId,
      'deliveryUID': instance.deliveryUID,
      'riderFare': instance.riderFare,
    };
