import 'dart:developer';

import 'package:rider/src/model/user_vehicle.model.dart';

import '../data_provider/vehicle_details_data.provider.dart';

class VehicleDetailsRepository {
  VehicleDetailsDataProvider vehicleDetailsDataProvider;

  VehicleDetailsRepository(this.vehicleDetailsDataProvider);

  Future<UserVehicleModel?> getVehicleDetails() async {
    try {
      final result = await vehicleDetailsDataProvider.getVehicleDetails();

      if (result?.hasException ?? false) {
        throw result?.exception ?? Exception("Something went wrong");
      }

      final data = UserVehicleModel.fromJson(result?.data?["me"]["vehicle"]);
      log(name: "Vehicle details data", data.toJson().toString());

      return data;
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updateVehicleDetails({
    required String? licenseNumber,
    required String? vehicleColor,
    required String? vehicleModel,
    required String? vehicleType,
    required String? insuranceDocumentImagePath,
  }) async {
    try {
      final result = await vehicleDetailsDataProvider.updateVehicleDetails(
        licenseNumber: licenseNumber,
        vehicleColor: vehicleColor,
        vehicleModel: vehicleModel,
        vehicleType: vehicleType,
        insuranceDocumentImagePath: insuranceDocumentImagePath,
      );

      if (result?.hasException ?? false) {
        throw result?.exception ?? Exception("Something went wrong");
      }

      return result?.data?["updateMe"];
    } catch (e) {
      rethrow;
    }
  }
}
