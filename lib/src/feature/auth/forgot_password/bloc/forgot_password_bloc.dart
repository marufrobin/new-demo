import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/feature/auth/auth_repository.dart';

part 'forgot_password_event.dart';
part 'forgot_password_state.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepositoryImpl _authService;

  ForgotPasswordBloc({required AuthRepositoryImpl authService})
    : _authService = authService,
      super(ForgotPasswordInitial()) {
    on<ResetForgotPassword>(_onReset);
    on<ForgotPasswordSubmit>(_onSubmit);
    on<ForgotPasswordOTPResend>(_onResendOTP);
    on<ForgotPasswordOTPSubmit>(_onOTPSubmit);
  }

  Future<void> _onReset(
    ResetForgotPassword event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(ForgotPasswordInitial());
  }

  Future<void> _onSubmit(
    ForgotPasswordSubmit event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(ForgotPasswordLoading());
    try {
      final response = await _authService.forgotPassword(
        AuthPayload(email: event.email),
      );
      log(response.data.toString(), name: "ForgotPasswordBloc");
      emit(ForgotPasswordSuccess("${response?.data["message"]}"));
    } catch (e) {
      log(error: e.toString(), "ForgotPasswordBloc");
      if (e is DioException) {
        emit(ForgotPasswordFailure("${e.response?.data["message"]}"));
        return;
      }

      emit(ForgotPasswordFailure(e.toString()));
    }
  }

  Future<void> _onResendOTP(
    ForgotPasswordOTPResend event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(ForgotPasswordOtpLoading());
    try {
      final response = await _authService.forgotPassword(
        AuthPayload(email: event.email),
      );
      log(response.data.toString(), name: "ForgotPasswordBloc");
      emit(ForgotPasswordSuccess(response.data["message"]));
    } catch (e) {
      log(error: e.toString(), "ForgotPasswordBloc");
      if (e is DioException) {
        emit(ForgotPasswordOtpFailure(e.response?.data["message"]));
        return;
      }

      emit(ForgotPasswordOtpFailure(e.toString()));
    }
  }

  Future<void> _onOTPSubmit(
    ForgotPasswordOTPSubmit event,
    Emitter<ForgotPasswordState> emit,
  ) async {
    emit(ForgotPasswordOtpLoading());
    try {
      final response = await _authService.resetPassword(
        AuthPayload(
          email: event.email,
          password: event.password,
          code: event.otp,
        ),
      );

      log(response.data.toString(), name: "ForgotPasswordBloc");
      emit(ForgotPasswordOtpSuccess(response.data["message"].toString()));
      // emit(ForgotPasswordInitial());
    } catch (e) {
      log(error: e.toString(), "ForgotPasswordBloc");
      if (e is DioException) {
        String? errorMessage = "${e.response?.data["message"]}";
        emit(ForgotPasswordFailure(errorMessage));
        return;
      }
      emit(ForgotPasswordOtpFailure(e.toString()));
    }
  }
}
