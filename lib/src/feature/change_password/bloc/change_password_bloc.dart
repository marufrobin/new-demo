import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../data/repository/change_password.repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc
    extends Bloc<ChangePasswordEvent, ChangePasswordState> {
  final ChangePasswordRepository repository;

  ChangePasswordBloc(this.repository) : super(ChangePasswordInitial()) {
    on<ChangeMyPasswordPatchEvent>(_onPatchEvent);
  }

  _onPatchEvent(
    ChangeMyPasswordPatchEvent event,
    Emitter<ChangePasswordState> emit,
  ) async {
    try {
      emit(ChangePasswordLoading());
      final response = await repository.changePassword(
        confirmNewPassword: event.confirmNewPassword,
        oldPassword: event.oldPassword,
        newPassword: event.newPassword,
      );
      // log(response, name: "Response--> ");
      if (response == true) {
        emit(ChangePasswordSuccess());
      } else {
        emit(const ChangePasswordFailure());
      }
    } catch (e) {
      log(e.toString(), name: "Error--> ");
      if (e is DioException) {
        log(e.toString(), name: "DioException--> ");
        String? errorMessage = e.response?.data["message"].toString();
        emit(ChangePasswordFailure(errorMessage: errorMessage));
      } else {
        emit(ChangePasswordFailure(errorMessage: e.toString()));
      }
    }
  }
}
