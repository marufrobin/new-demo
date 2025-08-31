import 'dart:developer';

import 'package:rider/src/feature/help/data/data_provider/support_message_data.provider.dart';
import 'package:rider/src/model/support_message_with_pagination.model.dart';

import '../../../../core/common/app_enum.dart';

class SupportMessageRepository {
  SupportMessageDataProvider dataProvider;

  SupportMessageRepository(this.dataProvider);

  Future<SupportMessageWithPaginationModel?> getSupportMessages({
    required String threadId,
    int? limit,
    int? page,
    SortType? sort,
    String? sortBy,
  }) async {
    try {
      final result = await dataProvider.getSupportMessages(
        threadId: threadId,
        sort: sort ?? SortType.DESC,
      );

      if (result?.hasException ?? false) {
        throw result?.exception?.toString() ??
            "Error on fetching support messages";
      }

      final data = SupportMessageWithPaginationModel.fromJson(
        result?.data?["supportMessages"],
      );
      log(name: "Data from message", "${data.nodes?.map((e) => e?.body)}");

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updateSupportMessage({
    required String messageId,
    required String threadId,
    String? body,
    bool? softDeteled,
  }) async {
    try {
      final result = await dataProvider.updateSupportMessage(
        messageId: messageId,
        threadId: threadId,
        softDeteled: softDeteled,
        body: body,
      );

      if (result?.hasException ?? false) {
        throw result?.exception?.toString() ??
            "Error on updating support message";
      }
      final data = bool.tryParse(
        (result?.data?["updateSupportMessage"] ?? false).toString(),
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
