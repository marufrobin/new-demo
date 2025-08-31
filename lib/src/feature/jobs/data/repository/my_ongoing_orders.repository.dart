import 'dart:developer';

import '../../../../model/my_on_going_orders.model.dart';
import '../data_provider/my_ongoing_orders_data.provider.dart';

class MyOngoingOrdersRepository {
  final MyOngoingOrdersDataProvider myOngoingOrdersDataProvider;

  const MyOngoingOrdersRepository(this.myOngoingOrdersDataProvider);

  Future<MyOnGoingOrdersModel?> getMyOnGoingOrders() async {
    try {
      final result = await myOngoingOrdersDataProvider.getMyOnGoingOrders();

      log(name: "DeliveryOrderDataRepository", result.toString());
      if (result?.hasException ?? true) {
        throw result?.exception ?? Exception("Something went wrong");
      }
      final myOnGoingOrders = MyOnGoingOrdersModel.fromJson(
        result?.data as Map<String, Object?>,
      );

      return myOnGoingOrders;
    } catch (e) {
      rethrow;
    }
  }
}
