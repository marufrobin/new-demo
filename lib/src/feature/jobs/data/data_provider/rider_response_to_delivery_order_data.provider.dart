import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/common/app_enum.dart';

import '../../../../core/clients/app_graphql.client.dart';
import '../../../../core/config/app.dependency.dart';

class RiderResponseToDeliveryOrderDataProvider {
  String riderResponseToDeliveryOrderQuery =
      """mutation RiderResponseToDeliveryOrder(\$input: RiderResponseToDeliveryOrderInput!) {
  riderResponseToDeliveryOrder(input: \$input)
}""";

  Future<QueryResult<Object?>?> riderResponseToDeliveryOrder({
    required RiderDeliveryOrderResponse response,
    required String deliveryOrderId,
  }) async {
    try {
      final client = getIt<AppGraphqlClient>();

      final variables = {
        "input": {"deliveryId": deliveryOrderId, "response": response.name},
      };
      log(
        name: "RiderResponseToDeliveryOrderDataProvider",
        variables.toString(),
      );

      final result = await client.query(
        queryString: riderResponseToDeliveryOrderQuery,
        variables: variables,
      );

      log(name: "RiderResponseToDeliveryOrderDataProvider", result.toString());
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
