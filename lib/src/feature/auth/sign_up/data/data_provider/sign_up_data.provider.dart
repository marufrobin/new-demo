import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';

class SignUpDataProvider {
  String signUpQuery = """mutation Join(\$input: JoinUserInput!) {
  join(input: \$input) {
    tokenType
    refreshToken
    expiresIn
    accessToken
  }
}""";

  Future<QueryResult<Object?>?> getSignUpMutation({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String city,
    required String address,
  }) async {
    try {
      final client = getIt<AppGraphqlClient>();
      final Map<String, dynamic> variables = {
        "input": {
          "name": name,
          "email": email,
          "phoneNumber": phoneNumber,
          "city": city,
          "address": address,
          "password": password,
        },
      };

      final response = await client.mutation(
        mutateString: signUpQuery,
        variables: variables,
      );
      log(response.toString(), name: "response from sign up");
      log(name: "Signup has exception", response.hasException.toString());
      if (response.hasException) {
        log(
          error: response.exception?.graphqlErrors.first.message,
          "Error from sign up",
        );
        throw response.exception?.graphqlErrors.first.message ??
            "Something went wrong";
      }

      return response;
    } catch (e) {
      log(error: e.toString(), "Error from sign up data provider");
      rethrow;
    }
  }
}
