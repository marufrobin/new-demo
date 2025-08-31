import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';
import 'package:rider/src/core/utils/location_watcher.utils.dart';

import '../../../../core/common/app_enum.dart';
import '../../../../model/delivery.model.dart';
import '../../../../model/location_reference.model.dart';
import '../delivery_order/delivery_order_bloc.dart';

part 'delivery_flowlocal_stage_state.dart';

enum LocalStage {
  none,
  accepted,
  onWayToPickup,
  arrivedAtPickup,
  confirmPickup,
  onWayToDropOff,
  arrivingSoonDropOff,
  arrivedAtDropOff,
  collectCash,
  finalizeDropOff,
  complete,
}

class DeliveryFlowLocalStageCubit extends Cubit<LocalStage> {
  DeliveryFlowLocalStageCubit(this._orderBloc) : super(LocalStage.none) {
    _subscription = _orderBloc.stream.listen(_handleBackend);
    _listenToLocation();
  }

  final DeliveryOrderBloc _orderBloc;
  late final StreamSubscription _subscription;
  StreamSubscription<Position>? _locationSub;

  /* -------------------------------------------------
     1) Backend coarse checkpoints
  ------------------------------------------------- */
  void _handleBackend(DeliveryOrderState orderState) {
    if (orderState is! DeliveryOrderLoaded) {
      emit(LocalStage.none);
      return;
    }

    final backend = orderState.deliveryOrder?.status;

    // Reset to first step whenever a new job appears
    if (backend == DeliveryStatus.PENDING ||
        backend == DeliveryStatus.FINDING_RIDER ||
        backend == DeliveryStatus.NO_RIDER_FOUND) {
      emit(LocalStage.accepted);
      return;
    }

    // Protect against going backwards
    if (backend == DeliveryStatus.RIDER_ON_THE_WAY_TO_PICKUP &&
        state.index < LocalStage.onWayToPickup.index) {
      emit(LocalStage.onWayToPickup);
    }

    if (backend == DeliveryStatus.RIDER_PICKED_UP &&
        state.index < LocalStage.onWayToDropOff.index) {
      emit(LocalStage.onWayToDropOff);
    }

    if (backend == DeliveryStatus.DELIVERED) {
      emit(LocalStage.complete);
    }
  }

  /* -------------------------------------------------
     2) Rider taps “Next” manually
  ------------------------------------------------- */
  void next() {
    if (state.index < LocalStage.complete.index) {
      emit(LocalStage.values[state.index + 1]);
    }
  }

  /* -------------------------------------------------
     3) Auto-arrive via live location
  ------------------------------------------------- */
  void _listenToLocation() {
    _locationSub = LocationWatcher.stream.listen((pos) {
      final orderState = _orderBloc.state;
      if (orderState is! DeliveryOrderLoaded) return;

      final order = orderState.deliveryOrder;
      final target = _currentTarget(order);
      if (target == null) return;

      final metres = Geolocator.distanceBetween(
        pos.latitude,
        pos.longitude,
        target.lat!,
        target.lng!,
      );

      if (metres <= 120) _autoArrive();
    });
  }

  LocationReference? _currentTarget(DeliveryModel? order) {
    return switch (state) {
      LocalStage.onWayToPickup => order?.pickupLocation,
      LocalStage.onWayToDropOff => order?.destinationLocation,
      _ => null,
    };
  }

  void _autoArrive() {
    // pick-up side
    if (state == LocalStage.onWayToPickup &&
        state.index < LocalStage.arrivedAtPickup.index) {
      emit(LocalStage.arrivedAtPickup);
    }
    // drop-off side
    else if (state == LocalStage.onWayToDropOff &&
        state.index < LocalStage.arrivingSoonDropOff.index) {
      emit(LocalStage.arrivingSoonDropOff);
    }
  }

  @override
  Future<void> close() {
    _subscription.cancel();
    _locationSub?.cancel();
    return super.close();
  }
}
