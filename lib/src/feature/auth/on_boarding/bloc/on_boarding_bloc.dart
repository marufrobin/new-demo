import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rider/src/core/services/file_uploading_downloading_service.dart';

import '../../../../core/common/app_enum.dart';
import '../../../../model/user.model.dart';
import '../data/repository/on_boarding.repository.dart';

part 'on_boarding_event.dart';
part 'on_boarding_state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  final OnBoardingRepository onBoardingRepository;

  OnBoardingBloc(this.onBoardingRepository) : super(OnBoardingInitial()) {
    //------------------------------------------------------------------------------
    /// Vehicle details submit event
    on<OnBoardingVehicleDetailsSubmitEvent>(
      _onBoardingVehicleDetailsSubmitEvent,
    );
    //------------------------------------------------------------------------------
    /// Documents submit event
    on<OnBoardingDocumentsSubmitEvent>(_onBoardingDocumentsSubmitEvent);
    //------------------------------------------------------------------------------
    /// Payment method submit event
    on<OnBoardingPaymentMethodSubmitEvent>(_onBoardingPaymentMethodSubmitEvent);
    //------------------------------------------------------------------------------
    /// Application status submit event
    on<OnBoardingApplicationStatusFetchEvent>(
      _onBoardingApplicationStatusFetchEvent,
    );
    //------------------------------------------------------------------------------
    /// Profile image submit event
    on<OnBoardingProfileImageSubmitEvent>(_onBoardingProfileImageSubmitEvent);
  }

  /// [OnBoardingProfileImageSubmitEvent] is used to submit profile image
  _onBoardingProfileImageSubmitEvent(
    OnBoardingProfileImageSubmitEvent event,
    Emitter<OnBoardingState> emit,
  ) async {
    try {
      emit(const OnBoardingLoading());
      String? profileImageKey;
      await AppFileUploadAndDownloadService.uploadFile(
        filePath: event.profileImagePath!,
        onProgress: (value) => log(name: "Progress", value.toString()),
        onUploadComplete: (isComplete, {key}) {
          if (isComplete) profileImageKey = key;
        },
      );
      final result = await onBoardingRepository.updateProfileImage(
        profileImageKey: profileImageKey,
      );
      if (result == null) {
        emit(const OnBoardingError(errorMessage: "Something went wrong"));
        return;
      }
      emit(OnBoardingProfileImageData(isSuccessful: result));
    } catch (e) {
      emit(OnBoardingError(errorMessage: e.toString()));
    } finally {
      emit(OnBoardingInitial());
    }
  }

  /// [OnBoardingVehicleDetailsSubmitEvent] is used to submit vehicle details
  _onBoardingVehicleDetailsSubmitEvent(
    OnBoardingVehicleDetailsSubmitEvent event,
    Emitter<OnBoardingState> emit,
  ) async {
    try {
      emit(const OnBoardingLoading());

      String? insuranceDocumentKey;
      if (event.insuranceDocumentImagePath != null) {
        await AppFileUploadAndDownloadService.uploadFile(
          filePath: event.insuranceDocumentImagePath!,
          onProgress: (value) => log(name: "Progress", value.toString()),
          onUploadComplete: (isComplete, {key}) {
            if (isComplete) insuranceDocumentKey = key;
          },
        );
      }

      final result = await onBoardingRepository.updateVehicleDetails(
        licenseNumber: event.licenseNumber,
        vehicleModel: event.vehicleModel,
        vehicleColour: event.vehicleColour,
        vehicleType: event.vehicleType,
        insuranceDocumentKey: insuranceDocumentKey,
      );
      if (result == null) {
        emit(const OnBoardingError(errorMessage: "Something went wrong"));
        return;
      }
      emit(OnBoardingVehicleDetailsData(isSuccessful: result));
    } catch (e) {
      emit(OnBoardingError(errorMessage: e.toString()));
    } finally {
      emit(OnBoardingInitial());
    }
  }

  /// [OnBoardingDocumentsSubmitEvent] is used to submit documents
  _onBoardingDocumentsSubmitEvent(
    OnBoardingDocumentsSubmitEvent event,
    Emitter<OnBoardingState> emit,
  ) async {
    try {
      emit(const OnBoardingLoading());
      String? driverLicenseKey;
      String? vehiclePictureKey;
      String? nidPictureKey;

      if (event.drivingLicense != null) {
        await AppFileUploadAndDownloadService.uploadFile(
          filePath: event.drivingLicense!,
          onProgress:
              (value) => emit(
                OnBoardingLoading(
                  progress: value,
                  taskName: "Uploading driving license",
                ),
              ),
          onUploadComplete: (isComplete, {key}) {
            if (isComplete) driverLicenseKey = key;
          },
        );
      }
      if (event.vehiclePicture != null) {
        await AppFileUploadAndDownloadService.uploadFile(
          filePath: event.vehiclePicture!,
          onProgress:
              (value) => emit(
                OnBoardingLoading(
                  progress: value,
                  taskName: "Uploading vehicle picture",
                ),
              ),
          onUploadComplete: (isComplete, {key}) {
            if (isComplete) vehiclePictureKey = key;
          },
        );
      }
      if (event.nidPicture != null) {
        await AppFileUploadAndDownloadService.uploadFile(
          filePath: event.nidPicture!,
          onProgress:
              (value) => emit(
                OnBoardingLoading(
                  progress: value,
                  taskName: "Uploading NID picture",
                ),
              ),
          onUploadComplete: (isComplete, {key}) {
            if (isComplete) nidPictureKey = key;
          },
        );
      }

      final result = await onBoardingRepository.updateDocuments(
        licenseImageKey: driverLicenseKey,
        vehicleImageKey: vehiclePictureKey,
        nidImageKey: nidPictureKey,
      );

      if (result == null) {
        emit(const OnBoardingError(errorMessage: "Something went wrong"));
        return;
      }
      emit(OnBoardingDocumentsData(isSuccessful: result));
    } catch (e) {
      emit(OnBoardingError(errorMessage: e.toString()));
    } finally {
      emit(OnBoardingInitial());
    }
  }

  /// [OnBoardingPaymentMethodSubmitEvent] is used to submit payment method
  _onBoardingPaymentMethodSubmitEvent(
    OnBoardingPaymentMethodSubmitEvent event,
    Emitter<OnBoardingState> emit,
  ) async {
    try {
      emit(const OnBoardingLoading());
      final result = await onBoardingRepository.updatePaymentMethod(
        accountHolderName: event.accountHolderName,
        bkashNumber: event.bkashNumber,
        bankName: event.bankName,
        bankBranchName: event.bankBranchName,
        bankAccountNumber: event.bankAccountNumber,
        bankRoutingNumber: event.bankRoutingNumber,
      );
      if (result == null) {
        emit(const OnBoardingError(errorMessage: "Something went wrong"));
        return;
      }
      emit(OnBoardingPaymentMethodData(isSuccessful: result));
    } catch (e) {
      emit(OnBoardingError(errorMessage: e.toString()));
    } finally {
      emit(OnBoardingInitial());
    }
  }

  _onBoardingApplicationStatusFetchEvent(
    OnBoardingApplicationStatusFetchEvent event,
    Emitter<OnBoardingState> emit,
  ) async {
    try {
      emit(const OnBoardingLoading());
      final result = await onBoardingRepository.applicationStatusQuery();
      if (result == null) {
        emit(const OnBoardingError(errorMessage: "Something went wrong"));
        return;
      }
      emit(OnBoardingApplicationStatus(userModel: result));
    } catch (e) {
      emit(OnBoardingError(errorMessage: e.toString()));
    }
  }
}
