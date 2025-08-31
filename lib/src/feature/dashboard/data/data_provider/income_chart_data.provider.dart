import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rider/src/core/common/app_enum.dart';

import '../../../../core/clients/app_graphql.client.dart';
import '../../../../core/config/app.dependency.dart';

class IncomeChartDataProvider {
  final _client = getIt<AppGraphqlClient>();

  static const String incomeChartQuery =
      """query MyDeliveryIncomeChart(\$input: MyDeliveryIncomeChartInput!) {
  myDeliveryIncomeChart(input: \$input) {
    deliveries
    label
    riderFare
  }
}""";

  Future<QueryResult?> getIncomeChart({required DateFilter dateFilter}) async {
    try {
      final variables = {
        "input": {"days": dateFilter.name},
      };
      final result = await _client.query(
        queryString: incomeChartQuery,
        variables: variables,
      );
      return result;
    } catch (e) {
      rethrow;
    }
  }
}
