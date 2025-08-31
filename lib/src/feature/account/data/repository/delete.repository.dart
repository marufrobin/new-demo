import 'dart:developer';

import '../data_provider/delete_data.provider.dart';

class DeleteRepository {
  DeleteDataProvider deleteDataProvider;

  DeleteRepository(this.deleteDataProvider);

  Future<bool> deleteAccount() async {
    try {
      final response = await deleteDataProvider.deleteData();
      log("$response", name: "Delete account response");

      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
