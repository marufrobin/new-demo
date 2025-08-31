import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';

class VehicleDetailsDataProvider {
  final client = getIt<AppGraphqlClient>();

  String vehicleDetailsQuery = """query Vehicle {
  me {
    vehicle {
      licenseNumber
      vehicleColor
      vehicleModel
      vehicleType
      insuranceDocument {
        key
      }
    }
  }
}""";

  String updateVehicleDetailsQuery =
      """mutation UpdateMe(\$input: UpdateUserInput!) {
  updateMe(input: \$input)
}""";

  Future<QueryResult<Object?>?> getVehicleDetails() async {
    try {
      final result = await client.query(queryString: vehicleDetailsQuery);

      if (result.hasException) {
        throw result.exception ?? Exception("Something went wrong");
      }

      log(name: "Vehicle details result", result.toString());

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<QueryResult<Object?>?> updateVehicleDetails({
    required String? licenseNumber,
    required String? vehicleColor,
    required String? vehicleModel,
    required String? vehicleType,
    required String? insuranceDocumentImagePath,
  }) async {
    try {
      final variables = {
        "input": {
          "vehicle": {
            "insuranceDocument": {"key": insuranceDocumentImagePath},
            "licenseNumber": licenseNumber,
            "vehicleColor": vehicleColor,
            "vehicleModel": vehicleModel,
            "vehicleType": vehicleType,
          },
        },
      };
      log(name: "Vehicle details variables", variables.toString());

      final result = await client.mutation(
        mutateString: updateVehicleDetailsQuery,
        variables: variables,
      );

      if (result.hasException) {
        throw result.exception ?? Exception("Something went wrong");
      }

      log(name: "Vehicle details result", result.toString());

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
