import '../../../../model/my_over_all_report.model.dart';
import '../data_provider/over_all_report_data.provider.dart';

class OverAllReportRepository {
  final OverAllReportDataProvider dataProvider;

  OverAllReportRepository(this.dataProvider);

  Future<MyOverAllReportModel?> getOverAllReport({
    required String startDate,
    required String endDate,
  }) async {
    try {
      final response = await dataProvider.getOverAllReport(
        startDate: startDate,
        endDate: endDate,
      );

      if (response?.hasException ?? false) {
        throw response?.exception ?? Exception("Something went wrong");
      }

      final overAllReport = MyOverAllReportModel.fromJson(
        response?.data?["myOverallReport"],
      );

      return overAllReport;
    } catch (e) {
      rethrow;
    }
  }
}
