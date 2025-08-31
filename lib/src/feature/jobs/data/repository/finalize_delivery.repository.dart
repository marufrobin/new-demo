import '../../../../core/common/app_enum.dart';
import '../../../../model/server_file_reference.model.dart';
import '../data_provider/finalize_delivery_data.provider.dart';

class FinalizeDeliveryRepository {
  final FinalizeDeliveryDataProvider dataProvider;

  FinalizeDeliveryRepository(this.dataProvider);

  Future<bool?> finalizeDeliveryByRider({
    String? deliveryID,
    FINALIZE_DELIVERY_TYPE? type,
    String? code,
    ServerFileReferenceModel? customerNotFoundProofImage,
  }) async {
    try {
      final result = await dataProvider.finalizeDeliveryByRider(
        deliveryID: deliveryID,
        type: type,
        code: code,
        customerNotFoundProofImage: customerNotFoundProofImage,
      );
      final data = bool.parse(result?.data?["finalizeDeliveryByRider"]);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
