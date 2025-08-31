part of 'confirm_pick_up_bloc.dart';

sealed class ConfirmPickUpState extends Equatable {
  const ConfirmPickUpState();

  @override
  List<Object?> get props => [];
}

final class ConfirmPickUpInitial extends ConfirmPickUpState {}

final class ConfirmPickUpLoading extends ConfirmPickUpState {
  const ConfirmPickUpLoading();
}

final class ConfirmPickUpLoaded extends ConfirmPickUpState {
  final bool? isOrderCollected;

  const ConfirmPickUpLoaded({required this.isOrderCollected});

  @override
  List<Object?> get props => [isOrderCollected];
}

final class ConfirmPickUpError extends ConfirmPickUpState {
  final String message;

  const ConfirmPickUpError({required this.message});

  @override
  List<Object?> get props => [message];
}
