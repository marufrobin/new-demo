import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/clients/app_graphql.client.dart';
import '../../../../core/config/app.dependency.dart';

class ProfileSettingsDataProvider {
  String profileQuery = """mutation UpdateMe(\$input: UpdateUserInput!) {
  updateMe(input: \$input)
}""";

  Future<QueryResult<Object?>?> updateProfileSettings({
    required String? name,
    required String? phoneNumber,
    required String? city,
    required String? address,
    required String? profileImageKey,
  }) async {
    try {
      final client = getIt<AppGraphqlClient>();
      final response = await client.mutation(
        mutateString: profileQuery,
        variables: {
          "input": {
            "name": name,
            "phoneNumber": phoneNumber,
            "city": city,
            "address": address,
            "avatar": {"key": profileImageKey},
          },
        },
      );
      log(response.toString(), name: "response from profile settings");

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
