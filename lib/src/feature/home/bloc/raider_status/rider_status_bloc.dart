import 'dart:developer';

import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';
import 'package:rider/src/core/clients/socket_service.client.dart';
import 'package:rider/src/core/config/app.dependency.dart';
import 'package:rider/src/core/services/app_background_service.dart';
import 'package:rider/src/feature/home/data/repository/rider_status.repository.dart';

import '../../../../core/common/app_enum.dart';
import '../../../../core/services/periodic_timer.service.dart';
import '../../../jobs/bloc/delivery_order/delivery_order_bloc.dart';

part 'rider_status_event.dart';
part 'rider_status_state.dart';

class RiderStatusBloc
    extends HydratedBloc<RaiderStatusEvent, RiderStatusState> {
  final RiderStatusRepository repository;
  final _backgroundService = FlutterBackgroundService();
  final _periodicTimerService = PeriodicLocationService();
  final _socketService = getIt<SocketService>();

  RiderStatusBloc(this.repository) : super(const RiderStatusInitial()) {
    on<RiderStatusHydrated>((event, emit) {
      if (state is RiderStatusLoaded) {
        emit(state);
      }
    });
    on<GoOnline>(_onGoOnline);
    on<GoOffline>(_onGoOffline);
  }

  /// Handler for [GoOnline] event
  /// This event is triggered when the user wants to go online
  /// It emits a [RiderStatusLoaded] state with [RiderStatus.online] value
  _onGoOnline(GoOnline event, Emitter<RiderStatusState> emit) async {
    try {
      await _socketService.joinRiderOnBoardingInvitationRoom();
      final isServiceRunning = await _backgroundService.isRunning();
      if (isServiceRunning) {
        _backgroundService.invoke(startLocationSending);
      } else {
        final isServiceStarted = await _backgroundService.startService();
        _backgroundService.invoke(startLocationSending);
      }

      emit(const RiderStatusLoaded(RiderStatus.online));
    } catch (e) {
      log(e.toString(), name: "GoOnline Error");
      emit(RiderStatusError(errorMessage: e.toString()));
    }
  }

  /// Handler for [GoOffline] event
  /// This event is triggered when the user wants to go offline
  /// It emits a [RiderStatusLoaded] state with [RiderStatus.offline] value
  _onGoOffline(GoOffline event, Emitter<RiderStatusState> emit) async {
    try {
      await _socketService.leaveRiderOnBoardingInvitationRoom();
      final isServiceRunning = await _backgroundService.isRunning();
      if (isServiceRunning) {
        _backgroundService.invoke(stopLocationSending);
      } else {
        final isServiceStarted = await _backgroundService.startService();
        _backgroundService.invoke(stopLocationSending);
      }
      emit(const RiderStatusLoaded(RiderStatus.offline));
    } catch (e) {
      log(e.toString(), name: "GoOffline Error");
      emit(RiderStatusError(errorMessage: e.toString()));
    }
  }

  @override
  RiderStatusState? fromJson(Map<String, dynamic> json) {
    return RiderStatusState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(RiderStatusState state) {
    return state.toMap();
  }
}
