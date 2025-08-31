import '../../../../core/common/app_enum.dart';
import '../data_provider/rider_response_to_delivery_order_data.provider.dart';

class RiderResponseToDeliveryOrderRepository {
  RiderResponseToDeliveryOrderDataProvider
  riderResponseToDeliveryOrderDataProvider;

  RiderResponseToDeliveryOrderRepository(
    this.riderResponseToDeliveryOrderDataProvider,
  );

  Future<bool?> riderResponseToDeliveryOrder({
    required RiderDeliveryOrderResponse response,
    required String deliveryOrderId,
  }) async {
    try {
      final result = await riderResponseToDeliveryOrderDataProvider
          .riderResponseToDeliveryOrder(
            response: response,
            deliveryOrderId: deliveryOrderId,
          );
      if (result?.hasException ?? true) {
        throw result?.exception?.graphqlErrors.first.message ??
            Exception("Something went wrong");
      }
      final data = bool.parse(
        result?.data?["riderResponseToDeliveryOrder"]?.toString() ?? "false",
      );

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
