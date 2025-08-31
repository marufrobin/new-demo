import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:rider/src/core/clients/app_http.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';
import 'package:rider/src/core/services/storage/app_secure.storage.dart';

import '../constant/app_storage_key.dart';

class AppFileUploadAndDownloadService {
  static final dio = getIt<AppHttpClient>();
  static final secureStorage = getIt<AppSecureStorage>();

  static Future<bool> uploadFile({
    required String filePath,
    bool isUniqueKey = true,
    required Function(double value) onProgress,
    required Function(bool isComplete, {String? key}) onUploadComplete,
  }) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
        "directory": "rider_app",
        "isUniqueKey": true,
      });
      final token = await secureStorage.get(key: AppStorageKey.accessToken);

      final response = await dio.uploadStorageClient().post(
        "",
        data: formData,
        options: Options(headers: {"Authorization": "Bearer $token"}),
        onSendProgress: (count, total) {
          double progress = count / total * 100;
          log("${count / total * 100}%");
          onProgress(progress);
        },
      );

      log(response.statusMessage.toString(), name: "Status Message");
      log(response.data.toString(), name: "Data");
      log(response.statusCode.toString(), name: "Status code");

      if (response.statusCode == 201) {
        String imageKey = response.data["key"];
        String imageBucket = response.data["bucket"];
        String imageRegion = response.data["region"];

        log(imageKey, name: "imageKey");
        log(imageBucket, name: "imageBucket");
        log(imageRegion, name: "imageRegion");
        onUploadComplete(true, key: imageKey);
        return true;
      } else {
        onUploadComplete(false);
        return false;
      }
    } catch (e) {
      log('Error uploading image: $e');
      onUploadComplete(false);
      return false;
    }
  }

  static Future<bool> downloadFile({
    required String urlPath,
    required String savePath,
    required CancelToken cancelToken,
    required Function(double progress) onReceiveProgress,
  }) async {
    try {
      final response = await dio.defaultDioClient().download(
        urlPath,
        savePath,
        cancelToken: cancelToken,
        onReceiveProgress: (count, total) {
          double progress = ((count / total) * 100);
          // double percentage = .floor();
          log("Downloading $progress");
          log(name: "count", count.toString());
          log(name: "total", total.toString());
          // onDownloadComplete(true, savePath);
          onReceiveProgress(progress);
        },
      );

      log(response.statusMessage.toString(), name: "Status Message");
      log(response.data.toString(), name: "Data");
      log(response.statusCode.toString(), name: "Status code");

      if (response.statusCode == 200) {
        // onDownloadComplete(true, key);
        return true;
      } else {
        // onDownloadComplete(false, "");
        return false;
      }
    } catch (e) {
      log('Error downloading image: $e');
      // onDownloadComplete(false, "");
      return false;
    }
  }
}
