import 'dart:developer';

import 'package:rider/src/feature/income_and_delivery_history/delivery_history/data/data_provider/delivery_history_data.provider.dart';
import 'package:rider/src/model/delivery_with_pagination.model.dart';

import '../../../../../core/common/app_enum.dart';

class DeliveryHistoryRepository {
  final DeliveryHistoryDataProvider deliveryHistoryDataProvider;

  DeliveryHistoryRepository(this.deliveryHistoryDataProvider);

  Future<DeliveryWithPaginationModel?> getDeliveryHistory({
    required int page,
    required int limit,
    String? sort,
    SortType? sortBy,
    MyOrderHistoryStatus? status,
  }) async {
    try {
      final result = await deliveryHistoryDataProvider.getDeliveryHistory(
        page: page,
        limit: limit,
        sort: sort,
        sortBy: sortBy,
        status: status,
      );

      final data = DeliveryWithPaginationModel.fromJson(
        result?.data?["myOrderHistory"],
      );
      log(name: "Delivery History Repository", data.toJson().toString());

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
