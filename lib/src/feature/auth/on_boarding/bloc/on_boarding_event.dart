part of 'on_boarding_bloc.dart';

@immutable
sealed class OnBoardingEvent extends Equatable {
  const OnBoardingEvent();

  @override
  List<Object?> get props => [];
}

class OnBoardingVehicleDetailsSubmitEvent extends OnBoardingEvent {
  final String? licenseNumber;
  final String? vehicleModel;
  final String? vehicleColour;
  final VehicleType? vehicleType;
  final String? insuranceDocumentImagePath;

  const OnBoardingVehicleDetailsSubmitEvent({
    required this.licenseNumber,
    required this.vehicleModel,
    required this.vehicleColour,
    required this.vehicleType,
    required this.insuranceDocumentImagePath,
  });

  @override
  List<Object?> get props => [
    licenseNumber,
    vehicleModel,
    vehicleColour,
    vehicleType,
    insuranceDocumentImagePath,
  ];
}

class OnBoardingDocumentsSubmitEvent extends OnBoardingEvent {
  final String? drivingLicense;
  final String? vehiclePicture;
  final String? nidPicture;

  const OnBoardingDocumentsSubmitEvent({
    required this.drivingLicense,
    required this.vehiclePicture,
    required this.nidPicture,
  });

  @override
  List<Object?> get props => [drivingLicense, vehiclePicture, nidPicture];
}

class OnBoardingPaymentMethodSubmitEvent extends OnBoardingEvent {
  final String? accountHolderName;
  final String? bkashNumber;
  final String? bankName;
  final String? bankBranchName;
  final String? bankAccountNumber;
  final String? bankRoutingNumber;

  const OnBoardingPaymentMethodSubmitEvent({
    required this.accountHolderName,
    required this.bkashNumber,
    required this.bankName,
    required this.bankBranchName,
    required this.bankAccountNumber,
    required this.bankRoutingNumber,
  });

  @override
  List<Object?> get props => [
    accountHolderName,
    bkashNumber,
    bankName,
    bankBranchName,
    bankAccountNumber,
    bankRoutingNumber,
  ];
}

class OnBoardingApplicationStatusFetchEvent extends OnBoardingEvent {
  const OnBoardingApplicationStatusFetchEvent();

  @override
  List<Object?> get props => [];
}

class OnBoardingProfileImageSubmitEvent extends OnBoardingEvent {
  final String? profileImagePath;

  const OnBoardingProfileImageSubmitEvent({required this.profileImagePath});

  @override
  List<Object?> get props => [profileImagePath];
}
