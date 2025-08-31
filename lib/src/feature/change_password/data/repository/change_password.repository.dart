import 'dart:developer';

import '../data_provider/change_password_data.provider.dart';

class ChangePasswordRepository {
  final ChangePasswordDataProvider changePasswordDataProvider;

  ChangePasswordRepository(this.changePasswordDataProvider);

  Future<bool?> changePassword({
    required String? confirmNewPassword,
    required String? oldPassword,
    required String? newPassword,
  }) async {
    try {
      final response = await changePasswordDataProvider.changePasswordMethod(
        confirmNewPassword: confirmNewPassword,
        oldPassword: oldPassword,
        newPassword: newPassword,
      );
      log(response.toString(), name: "Response--> ");
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      // return false;
      rethrow;
    }
  }
}
