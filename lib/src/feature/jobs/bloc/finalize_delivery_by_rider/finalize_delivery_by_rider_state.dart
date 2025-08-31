part of 'finalize_delivery_by_rider_bloc.dart';

sealed class FinalizeDeliveryByRiderState extends Equatable {
  const FinalizeDeliveryByRiderState();

  @override
  List<Object?> get props => [];
}

final class FinalizeDeliveryByRiderInitial
    extends FinalizeDeliveryByRiderState {}

final class FinalizeDeliveryByRiderLoading
    extends FinalizeDeliveryByRiderState {}

final class FinalizeDeliveryByRiderLoaded extends FinalizeDeliveryByRiderState {
  final bool? isDeliveryFinalized;

  const FinalizeDeliveryByRiderLoaded({this.isDeliveryFinalized});

  @override
  List<Object?> get props => [isDeliveryFinalized];
}

final class FinalizeDeliveryByRiderError extends FinalizeDeliveryByRiderState {
  final String message;

  const FinalizeDeliveryByRiderError({required this.message});

  @override
  List<Object?> get props => [message];
}
