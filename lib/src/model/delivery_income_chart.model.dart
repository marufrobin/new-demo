import 'package:freezed_annotation/freezed_annotation.dart';

part 'delivery_income_chart.model.freezed.dart';
part 'delivery_income_chart.model.g.dart';

@freezed
abstract class MyDeliveryIncomeChart with _$MyDeliveryIncomeChart {
  const factory MyDeliveryIncomeChart({
    List<DeliveryChartItem?>? myDeliveryIncomeChart,
  }) = _MyDeliveryIncomeChart;

  factory MyDeliveryIncomeChart.fromJson(Map<String, dynamic> json) =>
      _$MyDeliveryIncomeChartFromJson(json);
}

@freezed
abstract class DeliveryChartItem with _$DeliveryChartItem {
  const factory DeliveryChartItem({
    int? deliveries,
    String? label,
    double? riderFare,
  }) = _DeliveryChartItem;

  factory DeliveryChartItem.fromJson(Map<String, dynamic> json) =>
      _$DeliveryChartItemFromJson(json);
}
