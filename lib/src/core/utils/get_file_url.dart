import '../constant/app_urls.dart';

getFileUrl({String? bucket = "", String? region = "", required String? key}) {
  String getFileUrl = AppUrlsConfiguration.getStorageBaseUrl;

  String imageUrl = "$getFileUrl/${key ?? ""}";
  // String imageUrl = "https://assets.dinebd.com/demo/$key";
  return imageUrl;
}
