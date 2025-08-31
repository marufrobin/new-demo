import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/repository/confirm_pick_up.repository.dart';

part 'confirm_pick_up_event.dart';
part 'confirm_pick_up_state.dart';

class ConfirmPickUpBloc extends Bloc<ConfirmPickUpEvent, ConfirmPickUpState> {
  final ConfirmPickUpRepository repository;

  ConfirmPickUpBloc(this.repository) : super(ConfirmPickUpInitial()) {
    on<ConfirmPickUpMutationEvent>(_confirmPickUp);
  }

  Future<void> _confirmPickUp(
    ConfirmPickUpMutationEvent event,
    Emitter<ConfirmPickUpState> emit,
  ) async {
    try {
      emit(const ConfirmPickUpLoading());

      final result = await repository.confirmPickUpByRider(
        deliveryId: event.deliveryId,
      );

      if (result == null) {
        emit(const ConfirmPickUpError(message: "Something went wrong"));
        return;
      }
      emit(ConfirmPickUpLoaded(isOrderCollected: result));
    } catch (e) {
      emit(ConfirmPickUpError(message: e.toString()));
    }
  }
}
