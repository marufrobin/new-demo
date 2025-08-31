import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rider/src/core/clients/app_http.client.dart';
import 'package:rider/src/feature/auth/utils/mutation.dart';
import 'package:rider/src/model/token_response.model.dart';

import '../../core/constant/app_storage_key.dart';
import '../../core/constant/app_urls.dart';
import '../../core/services/storage/app_secure.storage.dart';
import '../../core/utils/app_user_role_guard.dart';

class AuthPayload {
  String? email;
  String? password;
  String? code;

  AuthPayload({this.email, this.password, this.code});

  AuthPayload.toJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    code = json['code'];
  }
}

abstract class AuthRepository {
  Future<TokenResponseModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<bool?> sendLoginOTP(String phoneNumber);

  Future<TokenResponseModel?> loginWithOTP({
    required String phoneNumber,
    required String otp,
  });

  Future<void> signInProcedure(TokenResponseModel tokenResponse);

  Future<Response> forgotPassword(AuthPayload payload);

  Future<Response> resetPassword(AuthPayload payload);

  Future<void> logout();
}

class AuthRepositoryImpl implements AuthRepository {
  final AppHttpClient _appHttpClient;
  final AppSecureStorage _secureStorage;

  AuthRepositoryImpl({
    required AppHttpClient appHttpClient,
    required AppSecureStorage secureStorage,
  }) : _appHttpClient = appHttpClient,
       _secureStorage = secureStorage;

  @override
  Future<TokenResponseModel?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var data = {
        "appId": AppUrlsConfiguration.appId,
        "grant_type": AppUrlsConfiguration.passwordGrandType,
        "allowed_roles": ["rider"],
        "email": email,
        "password": password,
      };
      log("$data", name: " before login");
      Response<Map> res = await _appHttpClient.authClient().post(
        "/auth/oauth/token",
        data: data,
      );

      log("${res.data}", name: "res.data");

      if (res.statusCode == 403) log("${res.statusCode}", name: "Login error");

      log(res.data?['accessToken'], name: 'access_token');
      log(res.data?['refreshToken'], name: 'refresh_Token');

      return res.data != null
          ? TokenResponseModel.fromJson(res.data as Map<String, Object?>)
          : null;
    } catch (e) {
      log(e.toString(), error: "Login");
      // Handle Dio errors
      if (e is DioException) {
        log(e.toString(), error: "DioException");
        String? errorMessage = e.response?.data["message"].toString();
        throw Exception(errorMessage ?? "Login failed");
      } else {
        throw Exception("Login failed: ${e.toString()}");
      }
    }
  }

  @override
  Future<bool?> sendLoginOTP(String phoneNumber) async {
    return await AuthMutation().sendLoginOTP(phoneNumber: phoneNumber);
  }

  @override
  Future<TokenResponseModel?> loginWithOTP({
    required String phoneNumber,
    required String otp,
  }) async {
    return await AuthMutation().loginUsingOTP(
      phoneNumber: phoneNumber,
      otp: otp,
    );
  }

  @override
  Future<Response> forgotPassword(AuthPayload payload) {
    return _appHttpClient.authClient().post(
      "/auth/forgot-password",
      data: {"email": payload.email},
    );
  }

  @override
  Future<bool?> logout() async {
    try {
      final token = await _secureStorage.get(key: AppStorageKey.refreshToken);

      if (token != null) return true;
      final response = await _appHttpClient.authClient().delete(
        "/auth/signout",
        data: {"refresh_token": token},
      );
      log("${response.data}", name: "Logout response");
      return true;

      // if (token != null) {
      //   _appHttpClient
      //       .authClient()
      //       .delete("/auth/signout", data: {"refresh_token": token})
      // .then((value) async {
      //   await _cleanUpProcedure();
      //   log('Logout user with refresh token success');
      //   Future.value();
      // })
      // .catchError((error, stackTrace) {
      //   log(
      //     'Logout user with refresh token failed: ${error.response.data.toString()}',
      //   );
      //   Future.error('Failed to logout user');
      // });
      // } else {
      //   await _secureStorage.destroy(key: AppStorageKey.accessToken);
      //   await _secureStorage.destroy(key: AppStorageKey.refreshToken);
      //
      //   log('Logout user without refresh token success');
      //   Future.value();
      // }
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  /// For resetting password we will need to send [otp]/[code], [email] and [password]
  @override
  Future<Response> resetPassword(AuthPayload payload) {
    return _appHttpClient.authClient().post(
      "/auth/reset-password",
      data: {
        "email": payload.email,
        "password": payload.password,
        "code": payload.code,
      },
    );
  }

  @override
  Future<void> signInProcedure(TokenResponseModel tokenResponse) async {
    try {
      if (tokenResponse.accessToken == null ||
          tokenResponse.refreshToken == null) {
        throw Exception("Token response is null");
      }
      await _secureStorage.set(
        key: AppStorageKey.accessToken,
        value: tokenResponse.accessToken!,
      );
      await _secureStorage.set(
        key: AppStorageKey.refreshToken,
        value: tokenResponse.refreshToken!,
      );

      /// TODO: is user Rider checking ----------------------------------
      final isRider = await AppUserRoleGuard().isRider();
      log(isRider.toString(), name: "isRider");
      if (!isRider) {
        throw Exception("User is not a rider");
      }

      /// TODO: Init user after login
      // ------------------------------

      ///
      /// TODO: FCM token
      ///

      /// TODO: Socket subscription
      ///

      /// TODO: Checking Onboarding status
      /// TODO: If Onboarding status is not completed, redirect to onboarding
      /// TODO: If Onboarding status is completed, redirect to dashboard
      ///       ``` dart
      ///       ``` dart
      ///       bool isOnboardingCompleted = false;
      ///      if (!isOnboardingCompleted) {
      ///         context.pushNamed(AppRoutesNames.onboardingStatusScreen);
      ///       } else {
      ///         context.pushNamed(AppRoutesNames.dashboardScreen);
      ///       }```
    } catch (e) {
      log(error: e, stackTrace: StackTrace.current, "AuthRepositoryImpl");
      rethrow;
    }
  }

  Future<void> signInCleanUpProcedure() async {
    // Socket un-subscription logic would go here
    /// Todo: Add socket un-subscription logic

    /// Todo: Add socket un-subscription logic
    await _secureStorage.destroy(key: AppStorageKey.accessToken);
    await _secureStorage.destroy(key: AppStorageKey.refreshToken);

    // Add any other keys that need to be cleared
  }
}
