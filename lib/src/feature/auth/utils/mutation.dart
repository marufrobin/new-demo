import 'package:rider/src/core/clients/app_graphql.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';
import 'package:rider/src/model/token_response.model.dart';

class AuthMutation {
  final appGraphqlClient = getIt<AppGraphqlClient>();

  static const String loginWithOTPQuery =
      """mutation LoginUsingOTP(\$input: LoginUsingOTPInput!) {
  loginUsingOTP(input: \$input) {
    accessToken
    expiresIn
    refreshToken
    tokenType
  }
}""";

  static const String sendLoginOTPQuery =
      """mutation SendLoginOTP(\$input: SendLoginOtpInput!) {
  sendLoginOTP(input: \$input)
}""";

  Future<TokenResponseModel?> loginUsingOTP({
    required String phoneNumber,
    required String otp,
  }) async {
    try {
      var variables = {
        "input": {"phoneNumber": phoneNumber, "otp": otp},
      };
      final result = await appGraphqlClient.mutation(
        mutateString: loginWithOTPQuery,
        variables: variables,
      );
      if (result.hasException) throw Exception(result.exception.toString());

      return result.data?['loginUsingOTP'] != null
          ? TokenResponseModel.fromJson(result.data!['loginUsingOTP'])
          : null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool?> sendLoginOTP({required String phoneNumber}) async {
    try {
      var variables = {
        "input": {"phoneNumber": phoneNumber},
      };
      final result = await appGraphqlClient.mutation(
        mutateString: sendLoginOTPQuery,
        variables: variables,
      );
      if (result.hasException) throw Exception(result.exception.toString());
      return result.data?['sendLoginOTP'] != null
          ? result.data!['sendLoginOTP']
          : null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
