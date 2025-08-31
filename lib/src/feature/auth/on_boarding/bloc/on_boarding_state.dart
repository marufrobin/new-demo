part of 'on_boarding_bloc.dart';

@immutable
sealed class OnBoardingState extends Equatable {
  const OnBoardingState();

  @override
  List<Object?> get props => [];
}

final class OnBoardingInitial extends OnBoardingState {}

final class OnBoardingLoading extends OnBoardingState {
  final String? taskName;
  final double? progress;

  const OnBoardingLoading({this.progress, this.taskName});

  @override
  List<Object?> get props => [progress, taskName];
}

// final class OnBoardingData extends OnBoardingState {
//   final bool? isSuccessful;
//
//   const OnBoardingData({required this.isSuccessful});
//
//   @override
//   List<Object?> get props => [isSuccessful];
// }

final class OnBoardingDocumentsData extends OnBoardingState {
  final bool? isSuccessful;

  const OnBoardingDocumentsData({required this.isSuccessful});

  @override
  List<Object?> get props => [isSuccessful];
}

final class OnBoardingVehicleDetailsData extends OnBoardingState {
  final bool? isSuccessful;

  const OnBoardingVehicleDetailsData({required this.isSuccessful});

  @override
  List<Object?> get props => [isSuccessful];
}

final class OnBoardingPaymentMethodData extends OnBoardingState {
  final bool? isSuccessful;

  const OnBoardingPaymentMethodData({required this.isSuccessful});

  @override
  List<Object?> get props => [isSuccessful];
}

final class OnBoardingApplicationStatus extends OnBoardingState {
  final UserModel? userModel;

  const OnBoardingApplicationStatus({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

final class OnBoardingProfileImageData extends OnBoardingState {
  final bool? isSuccessful;

  const OnBoardingProfileImageData({required this.isSuccessful});

  @override
  List<Object?> get props => [isSuccessful];
}

final class OnBoardingError extends OnBoardingState {
  final String errorMessage;

  const OnBoardingError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
