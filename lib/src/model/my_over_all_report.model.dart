import 'package:freezed_annotation/freezed_annotation.dart';

part 'my_over_all_report.model.freezed.dart';
part 'my_over_all_report.model.g.dart';

@freezed
abstract class MyOverAllReportModel with _$MyOverAllReportModel {
  factory MyOverAllReportModel({
    int? totalCancelledDeliveriesCount,
    double? totalCashCollectedFromCustomer,
    double? totalIncome,
    int? totalSuccessfulDeliveriesCount,
  }) = _MyOverAllReportModel;

  factory MyOverAllReportModel.fromJson(Map<String, Object?> json) =>
      _$MyOverAllReportModelFromJson(json);
}
