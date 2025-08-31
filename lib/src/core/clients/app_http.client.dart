import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rider/src/core/config/app.dependency.dart';
import 'package:rider/src/core/constant/app_storage_key.dart';
import 'package:rider/src/core/services/storage/app_secure.storage.dart';

import '../constant/app_urls.dart';

class AppHttpClient {
  // static final _dio = Dio();

  Dio authClient() {
    final options = BaseOptions(
      baseUrl: AppUrlsConfiguration.authBaseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
    );
    return Dio(options);
  }

  Future<Dio> authClientWithToken() async {
    // Or create `Dio` with a `BaseOptions` instance.
    final storage = getIt<AppSecureStorage>();
    final token = await storage.get(key: AppStorageKey.accessToken);
    log(name: "access token", token.toString());
    final options = BaseOptions(
      baseUrl: AppUrlsConfiguration.authBaseUrl,
      headers: {"Authorization": "Bearer $token"},
    );
    log(name: "options", "${options}");
    return Dio(options);
  }

  static Dio businessClient() {
    final options = BaseOptions(baseUrl: AppUrlsConfiguration.businessUrl);
    return Dio(options);
  }

  Dio uploadStorageClient() {
    final options = BaseOptions(
      baseUrl: AppUrlsConfiguration.uploadStorageBaseUrl,
    );
    return Dio(options);
  }

  Dio geoApiClient() {
    final options = BaseOptions(baseUrl: AppUrlsConfiguration.geoApi);
    return Dio(options);
  }

  Dio defaultDioClient() => Dio();
}
