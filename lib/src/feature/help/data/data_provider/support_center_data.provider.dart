import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/config/app.dependency.dart';

class SupportCenterDataProvider {
  final client = getIt<AppGraphqlClient>();

  String supportThreadQuery =
      """query SupportThreads(\$input: SupportThreadListInput) {
  mySupportThreads(input: \$input) {
    nodes {
      _id
      title
      body
      status
      softDeleted
      createdAt
      updatedAt
      user {
        referenceId
        name
        email
      }
      attachments {
        key
      }
    }
    meta {
      totalCount
      currentPage
      hasNextPage
      totalPages
    }
  }
}""";

  String createSupportThreadQuery =
      """mutation CreateSupportThread(\$input: CreateSupportThreadInput!) {
  createSupportThread(input: \$input) {
    _id
  }
}""";

  Future<QueryResult<Object?>?> getSupportThreads({
    int? limit,
    int? page,
    SortType? sort,
    String? sortBy,
    SUPPORT_THREAD_STATUS? status,
  }) async {
    try {
      final variables = {
        "input": {
          "limit": limit ?? 10,
          "page": page ?? 1,
          "sort": sort?.name,
          "sortBy": sortBy,
          "status": status?.name,
        },
      };
      log(name: "Variables", variables.toString());
      final result = await client.query(
        queryString: supportThreadQuery,
        variables: variables,
      );

      return result;
    } catch (e) {
      if (e is OperationException) {
        throw e.graphqlErrors.first.message;
      } else {
        rethrow;
      }
    }
  }

  Future<QueryResult<Object?>?> createSupportThread({
    required String title,
    required String body,
    String? imageKey,
  }) async {
    try {
      final variables = {
        "input": {
          "title": title,
          "body": body,
          "attachments": [
            {"key": imageKey},
          ],
        },
      };
      log(name: "Variables", variables.toString());
      final result = await client.mutation(
        mutateString: createSupportThreadQuery,
        variables: variables,
      );

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
