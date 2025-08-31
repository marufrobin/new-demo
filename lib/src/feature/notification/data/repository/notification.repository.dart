import 'package:rider/src/model/notifications.model.dart';

import '../../../../core/common/app_enum.dart';
import '../data_provider/notification.provider.dart';

class NotificationRepository {
  final NotificationProvider notificationProvider;

  NotificationRepository(this.notificationProvider);

  Future<NotificationsModel?> getNotifications({
    required int page,
    required int limit,
    String? sortBy,
    SortType? sortType,
  }) async {
    try {
      final response = await notificationProvider.getNotifications(
        page: page,
        limit: limit,
        sortBy: sortBy,
        sortType: sortType,
      );

      if (response?.hasException ?? false) {
        throw response?.exception ?? Exception("Something went wrong");
      }

      final data = NotificationsModel.fromJson(
        response?.data?["notifications"],
      );

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
