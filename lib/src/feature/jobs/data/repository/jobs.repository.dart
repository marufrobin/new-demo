import 'package:rider/src/feature/jobs/data/data_provider/jobs_data.provider.dart';
import 'package:rider/src/model/my_live_orders.model.dart';

class JobsRepository {
  JobsDataProvider jobsDataProvider;

  JobsRepository(this.jobsDataProvider);

  Future<MyLiveOrdersModel?> getJobs() async {
    try {
      final result = await jobsDataProvider.getMyLiveOrders();
      if (result?.hasException ?? true) {
        throw result?.exception?.graphqlErrors.first.message ??
            Exception("Something went wrong");
      }

      final jobsOrders = MyLiveOrdersModel.fromJson(result?.data);

      return jobsOrders;
    } catch (e) {
      rethrow;
    }
  }
}
