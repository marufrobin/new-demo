import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';

class OverAllReportDataProvider {
  final _client = getIt<AppGraphqlClient>();

  String overAllReportQuery = """query MyOverallReport(\$input: MyReportInput) {
  myOverallReport(input: \$input) {
    totalCancelledDeliveriesCount
    totalCashCollectedFromCustomer
    totalIncome
    totalSuccessfulDeliveriesCount
  }
}""";

  Future<QueryResult?> getOverAllReport({
    required String startDate,
    required String endDate,
  }) async {
    try {
      final variables = {
        "input": {"startDate": startDate, "endDate": endDate},
      };
      final result = await _client.query(
        queryString: overAllReportQuery,
        variables: variables,
      );
      log(name: "Result", result.toString());
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
