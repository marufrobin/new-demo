// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'delivery_income_chart.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MyDeliveryIncomeChart _$MyDeliveryIncomeChartFromJson(
  Map<String, dynamic> json,
) => _MyDeliveryIncomeChart(
  myDeliveryIncomeChart:
      (json['myDeliveryIncomeChart'] as List<dynamic>?)
          ?.map(
            (e) =>
                e == null
                    ? null
                    : DeliveryChartItem.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
);

Map<String, dynamic> _$MyDeliveryIncomeChartToJson(
  _MyDeliveryIncomeChart instance,
) => <String, dynamic>{'myDeliveryIncomeChart': instance.myDeliveryIncomeChart};

_DeliveryChartItem _$DeliveryChartItemFromJson(Map<String, dynamic> json) =>
    _DeliveryChartItem(
      deliveries: (json['deliveries'] as num?)?.toInt(),
      label: json['label'] as String?,
      riderFare: (json['riderFare'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$DeliveryChartItemToJson(_DeliveryChartItem instance) =>
    <String, dynamic>{
      'deliveries': instance.deliveries,
      'label': instance.label,
      'riderFare': instance.riderFare,
    };
