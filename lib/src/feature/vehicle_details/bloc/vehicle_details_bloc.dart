import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/services/file_uploading_downloading_service.dart';
import '../../../model/user_vehicle.model.dart';
import '../data/repository/vehicle_details.repository.dart';

part 'vehicle_details_event.dart';
part 'vehicle_details_state.dart';

class VehicleDetailsBloc
    extends Bloc<VehicleDetailsEvent, VehicleDetailsState> {
  final VehicleDetailsRepository repository;

  VehicleDetailsBloc(this.repository) : super(VehicleDetailsInitial()) {
    on<VehicleDetailsFetchEvent>(_onFetch);
    on<VehicleDetailsUpdateEvent>(_onUpdate);
  }

  _onFetch(
    VehicleDetailsFetchEvent event,
    Emitter<VehicleDetailsState> emit,
  ) async {
    try {
      emit(VehicleDetailsLoading());

      final vehicleDetails = await repository.getVehicleDetails();
      log(name: "Vehicle details", "${vehicleDetails?.toJson()}");

      emit(VehicleDetailsData(vehicleDetails: vehicleDetails));
    } catch (e) {
      emit(VehicleDetailsError(errorMessage: e.toString()));
    }
  }

  _onUpdate(
    VehicleDetailsUpdateEvent event,
    Emitter<VehicleDetailsState> emit,
  ) async {
    try {
      emit(VehicleDetailsLoading());

      String? existingLicenseNumber;
      String? existingVehicleColor;
      String? existingVehicleModel;
      String? existingVehicleType;
      String? existingInsuranceDocumentKey;

      String? newInsuranceDocumentImageKey;

      if (state is VehicleDetailsData) {
        final currentData = state as VehicleDetailsData;
        existingLicenseNumber = currentData.vehicleDetails?.licenseNumber;
        existingVehicleColor = currentData.vehicleDetails?.vehicleColor;
        existingVehicleModel = currentData.vehicleDetails?.vehicleModel;
        existingVehicleType = currentData.vehicleDetails?.vehicleType;
        existingInsuranceDocumentKey =
            currentData.vehicleDetails?.insuranceDocument?.key;
      }
      if (event.insuranceDocumentImagePath != null) {
        await AppFileUploadAndDownloadService.uploadFile(
          filePath: event.insuranceDocumentImagePath!,
          onProgress: (value) => log(name: "Progress", value.toString()),
          onUploadComplete: (isComplete, {key}) {
            if (isComplete) newInsuranceDocumentImageKey = key;
          },
        );
      }

      final isUpdated = await repository.updateVehicleDetails(
        licenseNumber: event.licenseNumber ?? existingLicenseNumber,
        vehicleColor: event.vehicleColor ?? existingVehicleColor,
        vehicleModel: event.vehicleModel ?? existingVehicleModel,
        vehicleType: event.vehicleType ?? existingVehicleType,
        insuranceDocumentImagePath:
            newInsuranceDocumentImageKey ?? existingInsuranceDocumentKey,
      );

      if (isUpdated ?? false) {
        emit(VehicleDetailsUpdateSuccess());
      } else {
        emit(const VehicleDetailsError(errorMessage: "Something went wrong"));
      }
    } catch (e) {
      emit(VehicleDetailsError(errorMessage: e.toString()));
    }
  }
}
