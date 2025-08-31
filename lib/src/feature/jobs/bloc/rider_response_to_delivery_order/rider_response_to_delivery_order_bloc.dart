import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/common/app_enum.dart';
import '../../data/repository/rider_response_to_delivery_order.repository.dart';

part 'rider_response_to_delivery_order_event.dart';
part 'rider_response_to_delivery_order_state.dart';

class RiderResponseToDeliveryOrderBloc
    extends
        Bloc<
          RiderResponseToDeliveryOrderEvent,
          RiderResponseToDeliveryOrderState
        > {
  final RiderResponseToDeliveryOrderRepository repository;

  RiderResponseToDeliveryOrderBloc(this.repository)
    : super(RiderResponseToDeliveryOrderInitial()) {
    on<MutationRiderResponseToDeliveryOrderEvent>(
      _onMutationRiderResponseToDeliveryOrderEvent,
    );
  }

  _onMutationRiderResponseToDeliveryOrderEvent(
    MutationRiderResponseToDeliveryOrderEvent event,
    Emitter<RiderResponseToDeliveryOrderState> emit,
  ) async {
    try {
      emit(const RiderResponseToDeliveryOrderLoading());
      final result = await repository.riderResponseToDeliveryOrder(
        response: event.response,
        deliveryOrderId: event.deliveryOrderId,
      );

      emit(RiderResponseToDeliveryOrderLoaded(result));
    } catch (e) {
      emit(RiderResponseToDeliveryOrderError(message: e.toString()));
    }
  }
}
