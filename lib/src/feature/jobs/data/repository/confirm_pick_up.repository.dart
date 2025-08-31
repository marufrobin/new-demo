import '../data_provider/confirm_pick_up_data.provider.dart';

class ConfirmPickUpRepository {
  final ConfirmPickUpDataProvider dataProvider;

  ConfirmPickUpRepository(this.dataProvider);

  Future<bool?> confirmPickUpByRider({String? deliveryId}) async {
    try {
      final result = await dataProvider.confirmPickUpByRider(
        deliveryId: deliveryId,
      );
      if (result == null) {
        return null;
      }
      final isOrderCollected = bool.parse(result.data?["confirmPickupByRider"]);

      return isOrderCollected;
    } catch (e) {
      rethrow;
    }
  }
}
