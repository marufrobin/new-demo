part of 'sign_up_bloc.dart';

class SignUpUserData extends Equatable {
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;

  const SignUpUserData({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  @override
  List<Object?> get props => [name, email, password, phoneNumber];
}

class VehicleDetailsData extends Equatable {
  final String? licenseNumber;
  final String? vehicleModel;
  final String? vehicleColour;
  final VehicleType? vehicleType;

  const VehicleDetailsData({
    required this.licenseNumber,
    required this.vehicleModel,
    required this.vehicleColour,
    required this.vehicleType,
  });

  @override
  List<Object?> get props => [
    licenseNumber,
    vehicleModel,
    vehicleColour,
    vehicleType,
  ];
}

sealed class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object?> get props => [];
}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpData extends SignUpState {
  final TokenResponseModel? tokenResponse;

  const SignUpData({required this.tokenResponse});

  @override
  List<Object?> get props => [tokenResponse];
}

class SignUpVehicleDetailsData extends SignUpState {
  final TokenResponseModel? tokenResponse;
  final VehicleDetailsData? vehicleDetailsData;

  const SignUpVehicleDetailsData({
    required this.tokenResponse,
    required this.vehicleDetailsData,
  });

  @override
  List<Object?> get props => [tokenResponse, vehicleDetailsData];
}

class SignUpError extends SignUpState {
  final String errorMessage;

  const SignUpError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
