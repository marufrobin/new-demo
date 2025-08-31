import 'package:freezed_annotation/freezed_annotation.dart';

import 'delivery.model.dart';

part 'my_on_going_orders.model.freezed.dart';
part 'my_on_going_orders.model.g.dart';

@freezed
abstract class MyOnGoingOrdersModel with _$MyOnGoingOrdersModel {
  const factory MyOnGoingOrdersModel({List<DeliveryModel?>? myOngoingOrders}) =
      _MyOnGoingOrdersModel;

  factory MyOnGoingOrdersModel.fromJson(Map<String, Object?> json) =>
      _$MyOnGoingOrdersModelFromJson(json);
}
