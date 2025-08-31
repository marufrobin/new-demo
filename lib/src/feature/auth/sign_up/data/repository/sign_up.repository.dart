import 'dart:developer';

import 'package:rider/src/feature/auth/sign_up/data/data_provider/sign_up_data.provider.dart';
import 'package:rider/src/model/token_response.model.dart';

class SignUpRepository {
  final SignUpDataProvider signUpDataProvider;

  SignUpRepository(this.signUpDataProvider);

  Future<TokenResponseModel?> fetchSignUp({
    required String name,
    required String email,
    required String password,
    required String phoneNumber,
    required String city,
    required String address,
  }) async {
    try {
      final result = await signUpDataProvider.getSignUpMutation(
        name: name,
        email: email,
        password: password,
        phoneNumber: phoneNumber,
        city: city,
        address: address,
      );
      log(
        (result?.hasException ?? false).toString(),
        name: "result from sign up",
      );
      if (result?.hasException ?? false) {
        log(
          error: result?.exception?.graphqlErrors.first.message,
          "Error from sign up data provider",
        );
        throw result?.exception?.graphqlErrors.first.message ??
            "Something went wrong";
      }

      final tokenResponse = TokenResponseModel.fromJson(result?.data?["join"]);
      log(tokenResponse.toString(), name: "token response from sign up");

      return tokenResponse;
    } catch (e) {
      log(error: e.toString(), "Error from sign up repository catch");
      rethrow;
    }
  }
}
