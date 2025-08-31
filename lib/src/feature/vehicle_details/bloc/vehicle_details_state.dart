part of 'vehicle_details_bloc.dart';

sealed class VehicleDetailsState extends Equatable {
  const VehicleDetailsState();

  @override
  List<Object?> get props => [];
}

final class VehicleDetailsInitial extends VehicleDetailsState {}

final class VehicleDetailsLoading extends VehicleDetailsState {}

final class VehicleDetailsData extends VehicleDetailsState {
  final UserVehicleModel? vehicleDetails;

  const VehicleDetailsData({this.vehicleDetails});

  @override
  List<Object?> get props => [vehicleDetails];
}

final class VehicleDetailsUpdateSuccess extends VehicleDetailsState {}

final class VehicleDetailsError extends VehicleDetailsState {
  final String? errorMessage;

  const VehicleDetailsError({this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
