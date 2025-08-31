import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/core/config/app.dependency.dart';

class SupportMessageDataProvider {
  final client = getIt<AppGraphqlClient>();

  String supportMessageQuery =
      """query SupportMessages(\$input: SupportMessageListInput) {
  supportMessages(input: \$input) {
    meta {
      totalCount
      currentPage
      hasNextPage
      totalPages
    }
    nodes {
      _id
      user {
        referenceId
        name
        email
        phoneNumber
      }
      threadId
      body
      softDeleted
      createdAt
      updatedAt
    }
  }
}""";
  String updateSupportMessageQuesry =
      """mutation UpdateSupportMessage(\$messageId: String!, \$input: UpdateSupportMessageInput!) {
  updateSupportMessage(messageId: \$messageId, input: \$input)
}""";

  Future<QueryResult<Object?>?> getSupportMessages({
    required String threadId,
    int? limit,
    int? page,
    SortType? sort,
    String? sortBy,
  }) async {
    try {
      final variables = {
        "input": {
          "threadId": threadId,
          "limit": limit ?? -1,
          "page": page ?? 1,
          "sort": sort?.name,
          "sortBy": sortBy,
        },
      };
      log(name: "Variables", variables.toString());
      final result = await client.query(
        queryString: supportMessageQuery,
        variables: variables,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }

  Future<QueryResult<Object?>?> updateSupportMessage({
    required String messageId,
    required String threadId,
    String? body,
    bool? softDeteled = false,
  }) async {
    try {
      final variables = {
        "messageId": messageId,
        "input": {
          "softDeleted": softDeteled,
          "threadId": threadId,
          "body": body,
        },
      };
      log(name: "Variables", variables.toString());
      final result = await client.mutation(
        mutateString: updateSupportMessageQuesry,
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
