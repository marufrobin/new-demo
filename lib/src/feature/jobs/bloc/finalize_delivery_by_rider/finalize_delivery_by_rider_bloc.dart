import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/core/common/app_enum.dart';
import 'package:rider/src/model/server_file_reference.model.dart';

import '../../data/repository/finalize_delivery.repository.dart';

part 'finalize_delivery_by_rider_event.dart';
part 'finalize_delivery_by_rider_state.dart';

class FinalizeDeliveryByRiderBloc
    extends Bloc<FinalizeDeliveryByRiderEvent, FinalizeDeliveryByRiderState> {
  final FinalizeDeliveryRepository finalizeDeliveryRepository;

  FinalizeDeliveryByRiderBloc(this.finalizeDeliveryRepository)
    : super(FinalizeDeliveryByRiderInitial()) {
    on<FinalizeConfirmDeliveryMutationEvent>(_confirmDelivery);
    on<FinalizeCustomerNotFoundMutationEvent>(_customerNotFound);
  }

  _confirmDelivery(
    FinalizeConfirmDeliveryMutationEvent event,
    Emitter<FinalizeDeliveryByRiderState> emit,
  ) async {
    try {
      emit(FinalizeDeliveryByRiderLoading());

      final result = await finalizeDeliveryRepository.finalizeDeliveryByRider(
        deliveryID: event.deliveryID,
        type: event.type,
        code: event.code,
      );
      if (result == null) {
        emit(
          const FinalizeDeliveryByRiderError(message: "Something went wrong"),
        );
        return;
      }
      log(name: "🚀 FinalizeDeliveryByRiderBloc", result.toString());
      emit(FinalizeDeliveryByRiderLoaded(isDeliveryFinalized: result));
    } catch (e) {
      log(error: "Error confirming delivery: ", e.toString());
      emit(FinalizeDeliveryByRiderError(message: e.toString()));
    }
  }

  _customerNotFound(
    FinalizeCustomerNotFoundMutationEvent event,
    Emitter<FinalizeDeliveryByRiderState> emit,
  ) async {
    try {
      emit(FinalizeDeliveryByRiderLoading());

      final result = await finalizeDeliveryRepository.finalizeDeliveryByRider(
        deliveryID: event.deliveryID,
        type: event.type,
        customerNotFoundProofImage: event.customerNotFoundProofImage,
      );
      if (result == null) {
        emit(
          const FinalizeDeliveryByRiderError(message: "Something went wrong"),
        );
        return;
      }
      log(name: "🚀 FinalizeDeliveryByRiderBloc", result.toString());
      emit(FinalizeDeliveryByRiderLoaded(isDeliveryFinalized: result));
    } catch (e) {
      log(error: "Error confirming delivery: ", e.toString());
      emit(FinalizeDeliveryByRiderError(message: e.toString()));
    }
  }
}
