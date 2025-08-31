import 'package:rider/src/model/announcements.model.dart';

import '../../../../core/common/app_enum.dart';
import '../data_provider/announcements_data.provider.dart';

class AnnouncementsRepository {
  final AnnouncementsDataProvider dataProvider;

  AnnouncementsRepository(this.dataProvider);

  Future<AnnouncementsModel?> fetchAnnouncements({
    int? page,
    int? limit,
    SortType? sort,
    String? sortBy,
  }) async {
    try {
      final response = await dataProvider.getAnnouncements(
        page: page,
        limit: limit,
        sort: sort,
        sortBy: sortBy,
      );
      if (response?.hasException ?? false) {
        throw response?.exception ?? Exception('Something went wrong');
      }
      return AnnouncementsModel.fromJson(response?.data?['announcements']);
    } catch (e) {
      rethrow;
    }
  }
}
