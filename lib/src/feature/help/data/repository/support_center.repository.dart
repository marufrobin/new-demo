import 'dart:developer';

import 'package:rider/src/model/support_thread_with_pagination.model.dart';

import '../../../../core/common/app_enum.dart';
import '../data_provider/support_center_data.provider.dart';

class SupportCenterRepository {
  final SupportCenterDataProvider supportCenterDataProvider;

  SupportCenterRepository(this.supportCenterDataProvider);

  Future<SupportThreadWithPaginationModel?> getSupportThreads({
    int? limit,
    int? page,
    SortType? sort,
    String? sortBy,
    SUPPORT_THREAD_STATUS? status,
  }) async {
    try {
      final result = await supportCenterDataProvider.getSupportThreads(
        limit: limit,
        page: page,
        sort: sort,
        sortBy: sortBy,
        status: status,
      );

      if (result?.hasException ?? false) {
        throw result?.exception ?? Exception("Something went wrong");
      }
      final supportResult = result?.data?["mySupportThreads"];
      log(name: "SupportResult Type", supportResult.runtimeType.toString());
      log(name: "SupportResult Data", supportResult.toString());
      final data = SupportThreadWithPaginationModel.fromJson(supportResult);
      log(name: "Data", data.toString());
      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> createSupportThread({
    required String title,
    required String body,
    String? imageKey,
  }) async {
    try {
      final result = await supportCenterDataProvider.createSupportThread(
        title: title,
        body: body,
        imageKey: imageKey,
      );

      if (result?.hasException ?? false) {
        throw result?.exception ?? Exception("Something went wrong");
      }

      return result?.data != null;
    } catch (e) {
      rethrow;
    }
  }
}
