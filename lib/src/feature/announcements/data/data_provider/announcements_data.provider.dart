import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../../core/clients/app_graphql.client.dart';
import '../../../../core/common/app_enum.dart';
import '../../../../core/config/app.dependency.dart';

class AnnouncementsDataProvider {
  String announcementsQuery =
      """query Announcements(\$input: CommonPaginationOnlyDto) {
  announcements(input: \$input) {
    meta {
      totalPages
      totalCount
      hasNextPage
      currentPage
    }
    nodes {
      _id
      body
      createdAt
      title
      updatedAt
    }
  }
}""";

  Future<QueryResult<Object?>?> getAnnouncements({
    int? page,
    int? limit,
    SortType? sort,
    String? sortBy,
  }) async {
    try {
      final client = getIt<AppGraphqlClient>();
      final variables = {
        "input": {
          "limit": limit,
          "page": page,
          "sort": sort ?? SortType.DESC.name,
          "sortBy": sortBy ?? "createdAt",
        },
      };
      log(variables.toString(), name: "variables");
      final response = await client.query(
        queryString: announcementsQuery,
        variables: variables,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
