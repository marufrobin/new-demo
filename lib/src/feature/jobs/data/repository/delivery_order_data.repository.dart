import 'dart:developer';

import 'package:rider/src/model/delivery.model.dart';
import 'package:rider/src/model/my_on_going_orders.model.dart';

import '../data_provider/delivery_order_data.provider.dart';

class DeliveryOrderDataRepository {
  final DeliveryOrderDataProvider deliveryOrderDataProvider;

  const DeliveryOrderDataRepository(this.deliveryOrderDataProvider);

  Future<DeliveryModel?> getDeliveryOrder(String? deliveryId) async {
    try {
      final result = await deliveryOrderDataProvider.getDeliveryOrder(
        deliveryId,
      );

      if (result?.hasException ?? true) {
        throw result?.exception ?? Exception("Something went wrong");
      }

      final deliveryOrder = DeliveryModel.fromJson(result?.data?["delivery"]);
      log(name: "DeliveryOrderDataRepository", deliveryOrder.toString());

      return deliveryOrder;
    } catch (e) {
      rethrow;
    }
  }
}
