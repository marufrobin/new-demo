import 'dart:developer';

import 'package:rider/src/model/user.model.dart';

import '../../../../../core/common/app_enum.dart';
import '../data_provider/on_boarding_data.provider.dart';

class OnBoardingRepository {
  final OnBoardingDataProvider onBoardingDataProvider;

  OnBoardingRepository(this.onBoardingDataProvider);

  Future<bool?> updateProfileImage({required String? profileImageKey}) async {
    try {
      final response = await onBoardingDataProvider.updateProfileImage(
        profileImageKey: profileImageKey,
      );
      if (response?.hasException ?? true) {
        throw Exception(response?.exception.toString());
      }
      return response?.data?["updateMe"];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updateVehicleDetails({
    required String? licenseNumber,
    required String? vehicleModel,
    required String? vehicleColour,
    required VehicleType? vehicleType,
    required String? insuranceDocumentKey,
  }) async {
    try {
      final result = await onBoardingDataProvider
          .getUpdateVehicleDetailsMutation(
            licenseNumber: licenseNumber,
            vehicleModel: vehicleModel,
            vehicleColour: vehicleColour,
            vehicleType: vehicleType,
            insuranceDocumentKey: insuranceDocumentKey,
          );
      log(result.toString(), name: "result from update me");
      if (result?.hasException ?? false) {
        log(
          error: result?.exception?.graphqlErrors.first.message,
          "Error from update me data provider",
        );
        throw result?.exception?.graphqlErrors.first.message ??
            "Something went wrong";
      }
      return result?.data?["updateMe"];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updateDocuments({
    required String? licenseImageKey,
    required String? vehicleImageKey,
    required String? nidImageKey,
  }) async {
    try {
      final result = await onBoardingDataProvider.getUpdateDocumentsMutation(
        licenseImageKey: licenseImageKey,
        vehicleImageKey: vehicleImageKey,
        nidImageKey: nidImageKey,
      );
      log(result.toString(), name: "result from update me");
      if (result?.hasException ?? false) {
        log(
          error: result?.exception?.graphqlErrors.first.message,
          "Error from update me data provider",
        );
        throw result?.exception?.graphqlErrors.first.message ??
            "Something went wrong";
      }
      return result?.data?["updateMe"];
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updatePaymentMethod({
    required String? accountHolderName,
    required String? bkashNumber,
    required String? bankName,
    required String? bankBranchName,
    required String? bankAccountNumber,
    required String? bankRoutingNumber,
  }) async {
    try {
      final result = await onBoardingDataProvider
          .getUpdatePaymentMethodMutation(
            accountHolderName: accountHolderName,
            bkashNumber: bkashNumber,
            bankName: bankName,
            bankBranchName: bankBranchName,
            bankAccountNumber: bankAccountNumber,
            bankRoutingNumber: bankRoutingNumber,
          );
      log(result.toString(), name: "result from update me payment method");
      if (result?.hasException ?? false) {
        log(
          error: result?.exception?.graphqlErrors.first.message,
          "Error from update me data provider payment method",
        );
        throw result?.exception?.graphqlErrors.first.message ??
            "Something went wrong";
      }
      return result?.data?["updateMe"];
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel?> applicationStatusQuery() async {
    try {
      final result = await onBoardingDataProvider.getApplicationStatusQuery();

      log(result.toString(), name: "result from application status query");
      if (result?.hasException ?? false) {
        log(
          error: result?.exception?.graphqlErrors.first.message,
          "Error from application status query",
        );
        throw result?.exception?.graphqlErrors.first.message ??
            "Something went wrong";
      }
      final approvalStatus = UserModel.fromJson(result?.data?["me"]);

      return approvalStatus;
    } catch (e) {
      rethrow;
    }
  }
}
