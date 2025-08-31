import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/config/app.dependency.dart';

class DeliveryHistoryDataProvider {
  final client = getIt<AppGraphqlClient>();
  String deliveryHistoryQuery =
      """query MyOrderHistory(\$input: MyOrderHistoryInput) {
  myOrderHistory(input:\$input) {
    meta {
      currentPage
      hasNextPage
      totalCount
      totalPages
    }
    nodes {
      _id
      createdAt
      deliveredAt
      deliveryUID
      destinationLocation {
        lng
        lat
        address
      }
      riderFare
      updatedAt
      customer {
        name
      }
      pickupLocation {
        lng
        lat
        address
      }
      status
    }
  }
}""";

  Future<QueryResult<Object?>?> getDeliveryHistory({
    required int page,
    required int limit,
    String? sort,
    SortType? sortBy,
    MyOrderHistoryStatus? status,
  }) async {
    try {
      final variables = {
        "input": {
          "limit": limit,
          "status": status?.name ?? MyOrderHistoryStatus.ALL.name,
          "page": page,
          "sort": sort,
          "sortBy": sortBy,
        },
      };
      final result = await client.query(
        queryString: deliveryHistoryQuery,
        variables: variables,
      );

      log(result.toString(), name: "Delivery History data provider");

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
