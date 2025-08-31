import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';

class JobsDataProvider {
  final client = getIt<AppGraphqlClient>();

  String jobsQuery = """query MyLiveOrders {
  myJobs {
    _id
    amountToBePaidToVendorByRider
    amountTobeCollectedFromCustomerByRider
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
  }
}""";

  Future<QueryResult<Object?>?> getMyLiveOrders() async {
    try {
      final result = await client.query(queryString: jobsQuery);

      log(name: "JobsDataProvider", result.toString());
      if (result.hasException) {
        throw result.exception?.graphqlErrors.first.message ??
            Exception("Something went wrong");
      }

      return result;
    } catch (e) {
      if (e is OperationException) {
        throw e.graphqlErrors.first.message;
      } else {
        rethrow;
      }
    }
  }
}
