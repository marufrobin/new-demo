import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/clients/app_graphql.client.dart';
import '../../../../core/common/app_enum.dart';
import '../../../../core/config/app.dependency.dart';
import '../../../../model/server_file_reference.model.dart';

class FinalizeDeliveryDataProvider {
  String finalizeDeliveryMutationQuery =
      """mutation FinalizeDeliveryByRider(\$input: FinalizeDeliveryInput!) {
  finalizeDeliveryByRider(input: \$input)
}""";

  Future<QueryResult<Object?>?> finalizeDeliveryByRider({
    String? deliveryID,
    FINALIZE_DELIVERY_TYPE? type,
    String? code,
    ServerFileReferenceModel? customerNotFoundProofImage,
  }) async {
    try {
      final client = getIt<AppGraphqlClient>();

      final variables = {
        "input": {
          "code": code,
          "customerNotFoundProveImage":
              customerNotFoundProofImage?.toJson().toString(),
          "deliveryId": deliveryID,
          "type": type?.name,
        },
      };

      log(name: "🚀 Variables", variables.toString());

      final result = await client.mutation(
        mutateString: finalizeDeliveryMutationQuery,
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
