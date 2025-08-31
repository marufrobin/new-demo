import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';

class UserDataProvider {
  String userQuery = """query User {
  me {
    _id
    serialNumber
    name
    accountStatus
    approvalStatus
    avatar {
      key
    }
    email
    phone_number
    city
    address
    isOnline
    profileCompletionSteps
    lastLocation {
      coordinates
      type
    }
    vehicle {
      licenseNumber
      vehicleColor
      vehicleModel
      vehicleType
    }
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
    paymentInfo {
      accountHolderName
      bankAccountNumber
      bankBranchName
      bankName
      bankRoutingNumber
      bkashNumber
    }
    createdAt
    updatedAt
  }
}""";

  Future<QueryResult<Object?>?> getUserData() async {
    try {
      final client = getIt<AppGraphqlClient>();
      final response = await client.query(queryString: userQuery);
      log(response.toString(), name: "response from user data");

      return response;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
