import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/feature/account/data/repository/delete.repository.dart';

part 'delete_account_event.dart';
part 'delete_account_state.dart';

class DeleteAccountBloc extends Bloc<DeleteAccountEvent, DeleteAccountState> {
  final DeleteRepository deleteRepository;

  DeleteAccountBloc(this.deleteRepository) : super(DeleteAccountInitial()) {
    on<DeleteAccountInitiateEvent>(_onDeleteAccountInitiate);
  }

  _onDeleteAccountInitiate(
    DeleteAccountInitiateEvent event,
    Emitter<DeleteAccountState> emit,
  ) async {
    try {
      emit(DeleteAccountLoading());
      final isDeleted = await deleteRepository.deleteAccount();
      emit(DeleteAccountSuccess(isDeleted: isDeleted));
    } catch (e) {
      log(e.toString(), name: "Delete account error");
      emit(DeleteAccountFailure(errorMassage: e.toString()));
    }
  }
}
