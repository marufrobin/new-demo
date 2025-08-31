part of 'rider_response_to_delivery_order_bloc.dart';

sealed class RiderResponseToDeliveryOrderEvent extends Equatable {
  const RiderResponseToDeliveryOrderEvent();
}

class MutationRiderResponseToDeliveryOrderEvent
    extends RiderResponseToDeliveryOrderEvent {
  final RiderDeliveryOrderResponse response;
  final String deliveryOrderId;

  const MutationRiderResponseToDeliveryOrderEvent({
    required this.response,
    required this.deliveryOrderId,
  });

  @override
  List<Object?> get props => [response, deliveryOrderId];
}
