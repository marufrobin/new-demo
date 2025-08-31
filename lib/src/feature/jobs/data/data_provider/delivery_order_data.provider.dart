import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/clients/app_graphql.client.dart';
import '../../../../core/config/app.dependency.dart';

class DeliveryOrderDataProvider {
  String deliveryOrderQuery = """query Delivery(\$deliveryId: String!) {
  delivery(deliveryID: \$deliveryId) {
    _id
    deliveryUID
    customer {
      name
      phoneNumber
      email
    }
    pickupLocation {
      lat
      lng
      address
    }
    destinationLocation {
      lat
      lng
      address
    }
    amountToBePaidToVendorByRider
    riderFare
    note
    parcelPaymentType
    status
    vendor {
      name
    }
    amountTobeCollectedFromCustomerByRider
  }
}""";

  Future<QueryResult<Object?>?> getDeliveryOrder(String? deliveryId) async {
    try {
      final client = getIt<AppGraphqlClient>();

      final variables = {"deliveryId": deliveryId};
      log(name: "DeliveryOrderDataProvider", variables.toString());

      final result = await client.query(
        queryString: deliveryOrderQuery,
        variables: variables,
      );

      log(name: "DeliveryOrderDataProvider", result.toString());
      if (result.hasException) {
        throw result.exception ?? Exception("Something went wrong");
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
