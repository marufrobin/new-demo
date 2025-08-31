import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../model/distance_duration.model.dart';
import '../../data/repository/distance_duration.repository.dart';

part 'distance_duration_event.dart';
part 'distance_duration_state.dart';

class DistanceDurationBloc
    extends Bloc<DistanceDurationEvent, DistanceDurationState> {
  final DistanceDurationRepository distanceDurationRepository;

  DistanceDurationBloc(this.distanceDurationRepository)
    : super(DistanceDurationInitial()) {
    on<DistanceDurationFetchEvent>(_onFetchEvent);
  }

  _onFetchEvent(
    DistanceDurationFetchEvent event,
    Emitter<DistanceDurationState> emit,
  ) async {
    try {
      emit(const DistanceDurationLoading());
      final result = await distanceDurationRepository.getDistanceDuration(
        originLocation: event.originLocation,
        destinationLocation: event.destinationLocation,
      );

      emit(DistanceDurationLoaded(distanceDurationModel: result));
    } catch (e) {
      emit(DistanceDurationError(message: e.toString()));
    }
  }
}
