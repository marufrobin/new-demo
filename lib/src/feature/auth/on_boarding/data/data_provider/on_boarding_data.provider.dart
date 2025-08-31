import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../../core/clients/app_graphql.client.dart';
import '../../../../../core/common/app_enum.dart';
import '../../../../../core/config/app.dependency.dart';

class OnBoardingDataProvider {
  String updateMeMutationQuery = """mutation Join(\$input: UpdateUserInput!) {
  updateMe(input: \$input)
}""";

  String applicationStatusQuery = """query Me {
  me {
    approvalStatus
    accountStatus
  }
}""";

  String profileQuery = """mutation UpdateMe(\$input: UpdateUserInput!) {
  updateMe(input: \$input)
}""";

  Future<QueryResult<Object?>?> updateProfileImage({
    required String? profileImageKey,
  }) async {
    try {
      final client = getIt<AppGraphqlClient>();
      final response = await client.mutation(
        mutateString: profileQuery,
        variables: {
          "input": {
            "avatar": {"key": profileImageKey},
          },
        },
      );
      log(response.toString(), name: "response from profile settings");

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<QueryResult<Object?>?> getUpdateVehicleDetailsMutation({
    required String? licenseNumber,
    required String? vehicleModel,
    required String? vehicleColour,
    required VehicleType? vehicleType,
    required String? insuranceDocumentKey,
  }) async {
    try {
      final client = getIt<AppGraphqlClient>();
      final Map<String, dynamic> variables = {
        "input": {
          "vehicle": {
            "licenseNumber": licenseNumber,
            "vehicleColor": vehicleColour,
            "vehicleModel": vehicleModel,
            "vehicleType": vehicleType?.name,
            "insuranceDocument": {"key": insuranceDocumentKey},
          },
        },
      };
      log(name: "variables", variables.toString());
      final response = await client.mutation(
        mutateString: updateMeMutationQuery,
        variables: variables,
      );
      log(response.toString(), name: "response from update me");
      log(name: "Update me has exception", response.hasException.toString());
      if (response.hasException) {
        throw response.exception?.graphqlErrors.first.message ??
            "Something went wrong";
      }

      return response;
    } catch (e) {
      log(error: e.toString(), "Error from sign up data provider");
      rethrow;
    }
  }

  Future<QueryResult<Object?>?> getUpdateDocumentsMutation({
    required String? licenseImageKey,
    required String? vehicleImageKey,
    required String? nidImageKey,
  }) async {
    try {
      final client = getIt<AppGraphqlClient>();
      final Map<String, dynamic> variables = {
        "input": {
          "documents": {
            "license": {"key": licenseImageKey},
            "nidPhoto": {"key": nidImageKey},
            "vehiclePhoto": {"key": vehicleImageKey},
          },
        },
      };
      log(name: "variables", variables.toString());
      final response = await client.mutation(
        mutateString: updateMeMutationQuery,
        variables: variables,
      );
      log(response.toString(), name: "response from update me");
      log(name: "Update me has exception", response.hasException.toString());
      if (response.hasException) {
        throw response.exception?.graphqlErrors.first.message ??
            "Something went wrong";
      }

      return response;
    } catch (e) {
      log(error: e.toString(), "Error from sign up data provider");
      rethrow;
    }
  }

  Future<QueryResult<Object?>?> getUpdatePaymentMethodMutation({
    required String? accountHolderName,
    required String? bkashNumber,
    required String? bankName,
    required String? bankBranchName,
    required String? bankAccountNumber,
    required String? bankRoutingNumber,
  }) async {
    try {
      final client = getIt<AppGraphqlClient>();
      final Map<String, dynamic> variables = {
        "input": {
          "paymentInfo": {
            "accountHolderName": accountHolderName,
            "bkashNumber": bkashNumber,
            "bankName": bankName,
            "bankBranchName": bankBranchName,
            "bankAccountNumber": bankAccountNumber,
            "bankRoutingNumber": bankRoutingNumber,
          },
        },
      };
      log(name: "variables", variables.toString());
      final response = await client.mutation(
        mutateString: updateMeMutationQuery,
        variables: variables,
      );
      log(response.toString(), name: "response from update me payment method");
      log(
        name: "Update me has exception payment method",
        response.hasException.toString(),
      );
      if (response.hasException) {
        throw response.exception?.graphqlErrors.first.message ??
            "Something went wrong";
      }

      return response;
    } catch (e) {
      log(
        error: e.toString(),
        "Error from sign up data provider payment method",
      );
      rethrow;
    }
  }

  Future<QueryResult<Object?>?> getApplicationStatusQuery() async {
    try {
      final client = getIt<AppGraphqlClient>();

      final response = await client.query(queryString: applicationStatusQuery);
      log(response.toString(), name: "response from application status query");
      log(
        name: "Application status has exception",
        response.hasException.toString(),
      );
      if (response.hasException) {
        throw response.exception?.graphqlErrors.first.message ??
            "Something went wrong";
      }

      return response;
    } catch (e) {
      log(error: e.toString(), "Error from application status query");
      rethrow;
    }
  }
}
