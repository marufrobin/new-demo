import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';

import '../../../../core/common/app_enum.dart';

class NotificationProvider {
  final client = getIt<AppGraphqlClient>();

  String notificationQuery = """query Nodes(\$input: NotificationListInput) {
  notifications(input: \$input) {
    nodes {
      _id
      body
      createdAt
      payload
      recipients
      title
      topic
      updatedAt
    }
  }
}""";

  Future<QueryResult<Object?>?> getNotifications({
    required int page,
    required int limit,
    String? sortBy,
    SortType? sortType,
  }) async {
    try {
      final input = {
        "input": {
          "limit": limit,
          "page": page,
          "sort": sortType?.name,
          "sortBy": sortBy,
        },
      };
      log(input.toString(), name: "Notification Provider input");

      final response = await client.query(
        queryString: notificationQuery,
        variables: input,
      );
      log(response.toString(), name: "Notification Provider");

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
