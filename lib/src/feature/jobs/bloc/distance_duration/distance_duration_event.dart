part of 'distance_duration_bloc.dart';

sealed class DistanceDurationEvent extends Equatable {
  const DistanceDurationEvent();

  @override
  List<Object?> get props => [];
}

class DistanceDurationFetchEvent extends DistanceDurationEvent {
  final LatLng? originLocation;
  final LatLng? destinationLocation;

  const DistanceDurationFetchEvent({
    this.originLocation,
    this.destinationLocation,
  });

  @override
  List<Object?> get props => [originLocation, destinationLocation];
}
