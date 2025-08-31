import 'package:rider/src/model/delivery_income_chart.model.dart';

import '../../../../core/common/app_enum.dart';
import '../data_provider/income_chart_data.provider.dart';

class IncomeChartRepository {
  final IncomeChartDataProvider dataProvider;

  IncomeChartRepository(this.dataProvider);

  Future<MyDeliveryIncomeChart?> getIncomeChart({
    required DateFilter dateFilter,
  }) async {
    try {
      final response = await dataProvider.getIncomeChart(
        dateFilter: dateFilter,
      );

      if (response?.hasException ?? false) {
        throw response?.exception?.graphqlErrors.first.message ??
            Exception("Something went wrong");
      }

      final incomeChart = MyDeliveryIncomeChart.fromJson(response?.data ?? {});

      return incomeChart;
    } catch (e) {
      rethrow;
    }
  }
}
