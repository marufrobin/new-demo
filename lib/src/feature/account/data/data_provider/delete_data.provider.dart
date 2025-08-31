import 'dart:developer';

import 'package:dio/src/response.dart';
import 'package:rider/src/core/constant/app_urls.dart';

import '../../../../core/clients/app_http.client.dart';
import '../../../../core/config/app.dependency.dart';

class DeleteDataProvider {
  final dioClient = getIt<AppHttpClient>().authClient();

  Future<Response?> deleteData() async {
    try {
      final response = await dioClient.post(
        AppUrlsConfiguration.deleteAccountUrl,
      );
      log("$response", name: "Delete account response");
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
}
