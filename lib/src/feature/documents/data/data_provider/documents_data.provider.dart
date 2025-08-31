import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';

class DocumentsDataProvider {
  final client = getIt<AppGraphqlClient>();

  String documentsQuery = """query Documents {
  me {
    documents {
      license {
        key
      }
      nidPhoto {
        key
      }
      vehiclePhoto {
        key
      }
    }
  }
}""";

  String documentsMutation = """mutation UpdateMe(\$input: UpdateUserInput!) {
  updateMe(input: \$input)
}""";

  Future<QueryResult<Object?>?> getDocuments() async {
    try {
      final result = await client.query(queryString: documentsQuery);
      log(name: "Documents", result.toString());
      if (result.hasException) {
        throw result.exception ?? Exception("Something went wrong");
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<QueryResult<Object?>?> uploadDocuments({
    String? drivingLicense,
    String? vehiclePicture,
    String? nidPicture,
  }) async {
    try {
      final variables = {
        "input": {
          "documents": {
            "license": {"key": drivingLicense},
            "nidPhoto": {"key": nidPicture},
            "vehiclePhoto": {"key": vehiclePicture},
          },
        },
      };
      log(name: "Variables", variables.toString());

      final result = await client.mutation(
        mutateString: documentsMutation,
        variables: variables,
      );

      if (result.hasException) {
        throw result.exception ?? Exception("Something went wrong");
      }

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
