part of 'distance_duration_bloc.dart';

sealed class DistanceDurationState extends Equatable {
  const DistanceDurationState();

  @override
  List<Object?> get props => [];
}

final class DistanceDurationInitial extends DistanceDurationState {}

final class DistanceDurationLoaded extends DistanceDurationState {
  final DistanceDurationModel? distanceDurationModel;

  const DistanceDurationLoaded({required this.distanceDurationModel});

  @override
  List<Object?> get props => [distanceDurationModel];
}

final class DistanceDurationError extends DistanceDurationState {
  final String message;

  const DistanceDurationError({required this.message});

  @override
  List<Object?> get props => [message];
}

final class DistanceDurationLoading extends DistanceDurationState {
  const DistanceDurationLoading();
}
