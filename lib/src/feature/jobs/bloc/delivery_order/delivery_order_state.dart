part of 'delivery_order_bloc.dart';

sealed class DeliveryOrderState extends Equatable {
  const DeliveryOrderState();

  @override
  List<Object?> get props => [];
}

final class DeliveryOrderInitial extends DeliveryOrderState {}

final class DeliveryOrderLoading extends DeliveryOrderState {
  const DeliveryOrderLoading();
}

final class DeliveryOrderLoaded extends DeliveryOrderState {
  const DeliveryOrderLoaded({this.deliveryOrder});

  final DeliveryModel? deliveryOrder;

  @override
  List<Object?> get props => [deliveryOrder];
}

final class DeliveryOrderError extends DeliveryOrderState {
  const DeliveryOrderError({required this.error});

  final String error;

  @override
  List<Object?> get props => [error];
}
