import '../utils/app_env.utils.dart';

class AppUrlsConfiguration {
  static late String appId;
  static late String passwordGrandType;
  static late String googleApiKey;
  static late String privacyPolicy;
  static late String businessUrl;
  static late String socketUrl;
  static late String authBaseUrl;
  static late String getStorageBaseUrl;
  static late String uploadStorageBaseUrl;
  static late String deleteAccountUrl;
  static late String oAuthConsumerKey;
  static late String oAuthSignatureMethod;
  static late String oAuthTimestamp;
  static late String oAuthNonce;
  static late String oAuthSignature;
  static late String magazinesLinkUrl;
  static late String dinebdDineiverseUrl;
  static late String geoApi;

  /// Emergency contact - hardcoded URL
  static String emergencyContact = "https://dinebd.com/contact-us/";
  static String dinebdPhoneNumber = "+8801339865045";

  /// Call this method after dotenv.load() in main()
  static void initialize() {
    appId = AppEnvUtils.getEnv("APP_ID");
    passwordGrandType = AppEnvUtils.getEnv("PASSWORD_GRAND_TYPE");
    googleApiKey = AppEnvUtils.getEnv("GOOGLE_API_KEY");
    privacyPolicy = AppEnvUtils.getEnv("PRIVACY_POLICY");
    businessUrl = AppEnvUtils.getEnv("RAIDER_API_URL");
    socketUrl = "$businessUrl/socket.io";
    authBaseUrl = AppEnvUtils.getEnv("AUTHORIZATION_URL");
    getStorageBaseUrl = AppEnvUtils.getEnv("GET_STORAGE_API_URL");
    uploadStorageBaseUrl = AppEnvUtils.getEnv("UPLOAD_STORAGE_API_URL");
    deleteAccountUrl = AppEnvUtils.getEnv("DELETE_ACCOUNT_URL");
    oAuthConsumerKey = AppEnvUtils.getEnv("OAUTH_CONSUMER_KEY");
    oAuthSignatureMethod = AppEnvUtils.getEnv("OAUTH_SIGNATURE_METHOD");
    oAuthTimestamp = AppEnvUtils.getEnv("OAUTH_TIMESTAMP");
    oAuthNonce = AppEnvUtils.getEnv("OAUTH_NONCE");
    oAuthSignature = AppEnvUtils.getEnv("OAUTH_SIGNATURE");
    magazinesLinkUrl = AppEnvUtils.getEnv("MAGAZINES_LINK");
    dinebdDineiverseUrl = AppEnvUtils.getEnv("DINEBD_DINEIVERSE");
    geoApi = AppEnvUtils.getEnv("GEO_API");
  }
}

// class AppUrlsConfiguration {
//   static String appId = AppEnvUtils.getEnv("APP_ID");
//   static String passwordGrandType = AppEnvUtils.getEnv("PASSWORD_GRAND_TYPE");
//
//   static String googleApiKey = AppEnvUtils.getEnv("GOOGLE_API_KEY");
//
//   static String privacyPolicy = AppEnvUtils.getEnv("PRIVACY_POLICY");
//
//   static String businessUrl = AppEnvUtils.getEnv("RAIDER_API_URL");
//   static String socketUrl = "$businessUrl/socket.io";
//   static String authBaseUrl = AppEnvUtils.getEnv("AUTHORIZATION_URL");
//   static String getStorageBaseUrl = AppEnvUtils.getEnv("GET_STORAGE_API_URL");
//   static String uploadStorageBaseUrl = AppEnvUtils.getEnv(
//     "UPLOAD_STORAGE_API_URL",
//   );
//   static String deleteAccountUrl = AppEnvUtils.getEnv("DELETE_ACCOUNT_URL");
//
//   static String oAuthConsumerKey = AppEnvUtils.getEnv("OAUTH_CONSUMER_KEY");
//   static String oAuthSignatureMethod = AppEnvUtils.getEnv(
//     "OAUTH_SIGNATURE_METHOD",
//   );
//   static String oAuthTimestamp = AppEnvUtils.getEnv("OAUTH_TIMESTAMP");
//   static String oAuthNonce = AppEnvUtils.getEnv("OAUTH_NONCE");
//   static String oAuthSignature = AppEnvUtils.getEnv("OAUTH_SIGNATURE");
//
//   /// Magazines link --------------------------------------------------------
//   static String magazinesLinkUrl = AppEnvUtils.getEnv("MAGAZINES_LINK");
//   static String dinebdDineiverseUrl = AppEnvUtils.getEnv("DINEBD_DINEIVERSE");
//
//   /// Emergency contact --------------------------------------------------------
//   static String emergencyContact = "https://dinebd.com/contact-us/";
// }
