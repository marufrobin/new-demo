part of 'rider_response_to_delivery_order_bloc.dart';

sealed class RiderResponseToDeliveryOrderState extends Equatable {
  const RiderResponseToDeliveryOrderState();

  @override
  List<Object?> get props => [];
}

final class RiderResponseToDeliveryOrderInitial
    extends RiderResponseToDeliveryOrderState {}

final class RiderResponseToDeliveryOrderLoading
    extends RiderResponseToDeliveryOrderState {
  const RiderResponseToDeliveryOrderLoading();
}

final class RiderResponseToDeliveryOrderLoaded
    extends RiderResponseToDeliveryOrderState {
  final bool? result;

  const RiderResponseToDeliveryOrderLoaded(this.result);

  @override
  List<Object?> get props => [result];
}

final class RiderResponseToDeliveryOrderError
    extends RiderResponseToDeliveryOrderState {
  final String message;

  const RiderResponseToDeliveryOrderError({required this.message});

  @override
  List<Object?> get props => [message];
}
