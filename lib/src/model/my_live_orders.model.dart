import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rider/src/model/delivery.model.dart';

part 'my_live_orders.model.freezed.dart';
part 'my_live_orders.model.g.dart';

@freezed
abstract class MyLiveOrdersModel with _$MyLiveOrdersModel {
  const factory MyLiveOrdersModel({List<DeliveryModel?>? myJobs}) =
      _MyLiveOrdersModel;

  factory MyLiveOrdersModel.fromJson(Map<String, Object?>? json) =>
      _$MyLiveOrdersModelFromJson(json ?? {});
}
