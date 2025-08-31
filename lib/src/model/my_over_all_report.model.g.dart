// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_over_all_report.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyOverAllReportModel _$MyOverAllReportModelFromJson(
  Map<String, dynamic> json,
) => _MyOverAllReportModel(
  totalCancelledDeliveriesCount:
      (json['totalCancelledDeliveriesCount'] as num?)?.toInt(),
  totalCashCollectedFromCustomer:
      (json['totalCashCollectedFromCustomer'] as num?)?.toDouble(),
  totalIncome: (json['totalIncome'] as num?)?.toDouble(),
  totalSuccessfulDeliveriesCount:
      (json['totalSuccessfulDeliveriesCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$MyOverAllReportModelToJson(
  _MyOverAllReportModel instance,
) => <String, dynamic>{
  'totalCancelledDeliveriesCount': instance.totalCancelledDeliveriesCount,
  'totalCashCollectedFromCustomer': instance.totalCashCollectedFromCustomer,
  'totalIncome': instance.totalIncome,
  'totalSuccessfulDeliveriesCount': instance.totalSuccessfulDeliveriesCount,
};
