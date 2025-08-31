import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../constant/app_storage_key.dart';
import '../constant/app_urls.dart';
import '../services/storage/app_secure.storage.dart';

class AppGraphqlClient {
  static final HttpLink _httpLink = HttpLink(
    "${AppUrlsConfiguration.businessUrl}/graphql",
  );

  static HttpLink get httpLink => _httpLink;
  static final AuthLink _authLink = AuthLink(
    getToken: () async {
      log('token nitasi', name: "Auth");

      // final secureStore = getIt<AppSecureStorage>();
      final secureStore = AppSecureStorage();
      if (await secureStore.exists(key: AppStorageKey.accessToken)) {
        var token = await secureStore.get(key: AppStorageKey.accessToken);
        log('Bearer $token', name: "token");
        return 'Bearer $token';
      }
      log('token nai', name: "token");

      return null;
    },
  );

  static final Link _link = _authLink.concat(_httpLink);
  static final policy = DefaultPolicies(
    query: Policies(fetch: FetchPolicy.networkOnly),
  );

  static ValueNotifier<GraphQLClient> gqlClient = ValueNotifier(
    GraphQLClient(
      link: _link,
      cache: GraphQLCache(store: InMemoryStore()),
      defaultPolicies: policy,
    ),
  );

  static final client = GraphQLClient(
    cache: GraphQLCache(store: InMemoryStore()),
    link: _link,
    defaultPolicies: policy,
    queryRequestTimeout: const Duration(minutes: 1),
  );

  Future<QueryResult> query({
    required String queryString,
    Map<String, dynamic> variables = const {},
  }) async {
    try {
      // Clear the cache to avoid conflicts
      client.cache.store.reset();

      QueryResult result = await client.query(
        QueryOptions(
          document: gql(queryString),
          variables: variables,
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );
      if (result.hasException) {
        log('GraphQL query exception: ${result.exception.toString()}');
        throw result.exception ?? Exception('GraphQL query failed');
      }
      return result;
    } catch (e) {
      log('GraphQL query error: $e');
      rethrow;
    }
  }

  Future<QueryResult> mutation({
    required String mutateString,
    Map<String, dynamic> variables = const {},
  }) async {
    try {
      QueryResult result = await client.mutate(
        MutationOptions(
          document: gql(mutateString),
          variables: variables,
          fetchPolicy: FetchPolicy.networkOnly,
        ),
      );

      // Clear the cache after mutation
      client.cache.store.reset();

      if (result.hasException) {
        log('GraphQL query exception: ${result.exception.toString()}');
        throw result.exception ?? Exception('GraphQL query failed');
      }
      return result;
    } catch (e) {
      log('GraphQL query error: $e');
      rethrow;
    }
  }
}
