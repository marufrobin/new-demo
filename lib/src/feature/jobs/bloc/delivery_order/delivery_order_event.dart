part of 'delivery_order_bloc.dart';

sealed class DeliveryOrderEvent extends Equatable {
  const DeliveryOrderEvent();

  @override
  List<Object?> get props => [];
}

final class DeliveryOrderFetchEvent extends DeliveryOrderEvent {
  final String? deliveryID;

  const DeliveryOrderFetchEvent({this.deliveryID});

  @override
  List<Object?> get props => [deliveryID];
}
