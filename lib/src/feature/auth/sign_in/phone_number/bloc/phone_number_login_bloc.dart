import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rider/src/core/config/app.dependency.dart';

import '../../../../../model/token_response.model.dart';
import '../../../auth_repository.dart';

part 'phone_number_login_event.dart';
part 'phone_number_login_state.dart';

class PhoneNumberLoginBloc
    extends Bloc<PhoneNumberLoginEvent, PhoneNumberLoginState> {
  PhoneNumberLoginBloc() : super(PhoneNumberLoginInitial()) {
    on<PhoneNumberSendLoginOTPEvent>(_submit);
    on<PhoneNumberLoginUsingOTPEvent>(_otpSubmit);
    on<ResetPhoneNumberLoginEvent>(_reset);
  }

  final _authRepository = getIt<AuthRepositoryImpl>();

  /// This event is triggered when the user input [PhoneNumber]
  /// clicks on the [Send_OTP] button
  _submit(
    PhoneNumberSendLoginOTPEvent event,
    Emitter<PhoneNumberLoginState> emit,
  ) async {
    try {
      emit(PhoneNumberSendLoginOTPLoading());
      // final authRepository = getIt<AuthRepositoryImpl>();

      final result = await _authRepository.sendLoginOTP(event.phoneNumber);
      log(name: "result ${result.runtimeType}", result.toString());
      if (result == null || result == false) {
        emit(PhoneNumberSendLoginOTPFailure(message: "Something went wrong!"));
        return;
      }
      emit(PhoneNumberSendLoginOTPSuccess(isOTPSent: result));
    } catch (e) {
      log(
        error: e,
        stackTrace: StackTrace.current,
        "PhoneNumberLoginBloc for send login OTP",
      );
      emit(PhoneNumberSendLoginOTPFailure(message: e.toString()));
    }
  }

  /// This event is triggered when the user submit
  /// the [PhoneNumber] & [OTP] for [Login]
  _otpSubmit(
    PhoneNumberLoginUsingOTPEvent event,
    Emitter<PhoneNumberLoginState> emit,
  ) async {
    try {
      emit(PhoneNumberLoginLoading());
      final result = await _authRepository.loginWithOTP(
        phoneNumber: event.phoneNumber,
        otp: event.otp,
      );
      if (result == null) {
        emit(PhoneNumberLoginFailure(message: "Something went wrong!"));
        return;
      }

      /// Sending token for login procedure
      _authRepository.signInProcedure(result);
      emit(PhoneNumberLoginSuccess(tokenResponse: result));
    } catch (e, stackTrace) {
      log(
        error: e,
        stackTrace: stackTrace,
        "PhoneNumberLoginBloc for otp submit",
      );
      emit(PhoneNumberLoginFailure(message: e.toString()));
    }
  }

  _reset(
    ResetPhoneNumberLoginEvent event,
    Emitter<PhoneNumberLoginState> emit,
  ) {
    emit(PhoneNumberLoginInitial());
  }
}
