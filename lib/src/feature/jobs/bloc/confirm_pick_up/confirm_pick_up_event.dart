part of 'confirm_pick_up_bloc.dart';

sealed class ConfirmPickUpEvent extends Equatable {
  const ConfirmPickUpEvent();

  @override
  List<Object?> get props => [];
}

class ConfirmPickUpMutationEvent extends ConfirmPickUpEvent {
  final String? deliveryId;

  const ConfirmPickUpMutationEvent({this.deliveryId});

  @override
  List<Object?> get props => [deliveryId];
}
