import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/clients/app_graphql.client.dart';
import '../../../../core/config/app.dependency.dart';

class MyOngoingOrdersDataProvider {
  String myOnGoingOrdersQuery = """query MyOngoingOrders {
  myOngoingOrders {
    _id
    createdAt
    deliveredAt
    deliveryUID
    parcelPaymentType
    pickupConfirmationCode
    riderFare
    status
    updatedAt
    pickupLocation {
      address
      lat
      lng
    }
    destinationLocation {
      address
      lat
      lng
    }
    amountToBePaidToVendorByRider
    amountTobeCollectedFromCustomerByRider
    vendor {
      name
    }
    note
  }
}""";

  Future<QueryResult<Object?>?> getMyOnGoingOrders() async {
    try {
      final client = getIt<AppGraphqlClient>();
      final result = await client.query(queryString: myOnGoingOrdersQuery);

      if (result.hasException) {
        throw result.exception ?? Exception("Something went wrong");
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
