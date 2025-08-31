import 'dart:developer';

import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';
import 'package:rider/src/model/page.model.dart';

class TermsAndConditionsQueries {
  final appGraphqlClient = getIt<AppGraphqlClient>();

  final String termsAndConditionsQuery = """query Page(\$handle: String!) {
  page(handle: \$handle) {
    body
    createdAt
    handle
    title
  }
}""";

  Future<PageModel?> getTermsAndConditions() async {
    final result = await appGraphqlClient.query(
      queryString: termsAndConditionsQuery,
      variables: {"handle": "tnc"},
    );
    log(name: 'Result', result.toString());
    if (result.hasException) {
      throw Exception(result.exception.toString());
    }
    return result.data?['page'] != null
        ? PageModel.fromJson(result.data!['page'])
        : null;
  }
}
