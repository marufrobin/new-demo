import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/clients/app_graphql.client.dart';
import '../../../../core/config/app.dependency.dart';

class ConfirmPickUpDataProvider {
  String confirmPickUpMutationQuery =
      """mutation ConfirmPickupByRider(\$deliveryId: String!) {
  confirmPickupByRider(deliveryId: \$deliveryId)
}""";

  Future<QueryResult<Object?>?> confirmPickUpByRider({
    String? deliveryId,
  }) async {
    try {
      final client = getIt<AppGraphqlClient>();

      final variables = {"deliveryId": deliveryId};

      log(name: "🚀 Variables", variables.toString());

      final result = await client.mutation(
        mutateString: confirmPickUpMutationQuery,
        variables: variables,
      );

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
