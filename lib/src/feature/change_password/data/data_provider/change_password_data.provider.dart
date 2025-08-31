import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rider/src/core/config/app.dependency.dart';
import 'package:rider/src/core/constant/app_storage_key.dart';

import '../../../../core/clients/app_http.client.dart';
import '../../../../core/services/storage/app_secure.storage.dart';

class ChangePasswordDataProvider {
  final _dio = getIt<AppHttpClient>().authClient();
  final _secureStorage = getIt<AppSecureStorage>();

  Future<Response> changePasswordMethod({
    required String? confirmNewPassword,
    required String? oldPassword,
    required String? newPassword,
  }) async {
    try {
      var input = {
        "oldPassword": oldPassword,
        "newPassword": newPassword,
        "confirmNewPassword": confirmNewPassword,
      };
      log(input.toString(), name: "Variable Input--> ");

      var token = await _secureStorage.get(key: AppStorageKey.accessToken);

      var headers = {"Authorization": "Bearer $token"};
      log(headers.toString(), name: "Headers--> ");

      String link = "/auth/change-my-password";
      log(link, name: "Change password link");

      var response = await _dio.patch(
        link,
        options: Options(contentType: "application/json", headers: headers),
        data: input,
      );
      log(response.toString(), name: "Response--> ");
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
