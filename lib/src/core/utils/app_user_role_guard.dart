import 'dart:developer';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:rider/src/core/config/app.dependency.dart';
import 'package:rider/src/model/user_info_from_token.model.dart';

import '../common/app_enum.dart';
import '../constant/app_storage_key.dart';
import '../services/storage/app_secure.storage.dart';

/// check user role
/// after [login], and saving user token in secure storage [AppSecureStorage]
/// for Rider app call [isRider] method to check user role
///
class AppUserRoleGuard {
  Future<bool> isRider() async {
    try {
      final userInfoFromToken = await getUserInfoFromToken();
      log(userInfoFromToken.toString(), name: "userInformationFromToken");
      if (userInfoFromToken?.roles?.contains(IdentityUserRole.Rider) ?? false) {
        return true;
      }
      return false;
    } catch (e) {
      log(e.toString(), name: "AppUserRoleGuard");
      return false;
    }
  }

  Future<UserInfoFromTokenModel?> getUserInfoFromToken() async {
    final secureStorage = getIt<AppSecureStorage>();
    Map<String, Object?>? userDecodedInfo;

    String? token = await secureStorage.get(key: AppStorageKey.accessToken);

    if (token != null) userDecodedInfo = JwtDecoder.decode(token);
    log(userDecodedInfo.toString(), name: "userDecodedInfo");

    final userInfoFromToken =
        userDecodedInfo == null
            ? null
            : UserInfoFromTokenModel.fromJson(userDecodedInfo);
    log("""
    -------------------- userInfoFromToken --------------------------
            token -> $token
            Login count -> ${userInfoFromToken?.logins_count}
            name -> ${userInfoFromToken?.name}
            email -> ${userInfoFromToken?.email}
            email_verified -> ${userInfoFromToken?.email_verified}
            roles -> ${userInfoFromToken?.roles?.map((e) => e?.name)}
            permissions -> ${userInfoFromToken?.permissions?.map((e) => e)}
            tenantId -> ${userInfoFromToken?.tenantId}
            logins_count -> ${userInfoFromToken?.logins_count}
            iat -> ${userInfoFromToken?.iat}
            exp -> ${userInfoFromToken?.exp}
            aud -> ${userInfoFromToken?.aud}
            iss -> ${userInfoFromToken?.iss}
            sub -> ${userInfoFromToken?.sub}
    -------------------- userInfoFromToken --------------------------
            """);
    return userInfoFromToken;
  }
}
