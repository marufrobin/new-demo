part of 'vehicle_details_bloc.dart';

sealed class VehicleDetailsEvent extends Equatable {
  const VehicleDetailsEvent();

  @override
  List<Object?> get props => [];
}

final class VehicleDetailsFetchEvent extends VehicleDetailsEvent {}

final class VehicleDetailsUpdateEvent extends VehicleDetailsEvent {
  final String? licenseNumber;
  final String? vehicleColor;
  final String? vehicleModel;
  final String? vehicleType;
  final String? insuranceDocumentImagePath;

  const VehicleDetailsUpdateEvent({
    required this.licenseNumber,
    required this.vehicleColor,
    required this.vehicleModel,
    required this.vehicleType,
    required this.insuranceDocumentImagePath,
  });

  @override
  List<Object?> get props => [
    licenseNumber,
    vehicleColor,
    vehicleModel,
    vehicleType,
    insuranceDocumentImagePath,
  ];
}
