import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rider/src/model/token_response.model.dart';

import '../../../../core/common/app_enum.dart';
import '../../../../core/config/app.dependency.dart';
import '../../auth_repository.dart';
import '../data/repository/sign_up.repository.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpRepository signUpRepository;

  SignUpUserData? user;

  SignUpBloc(this.signUpRepository) : super(SignUpInitial()) {
    on<SignUpMutationSubmitEvent>(_onSignUpMutationEvent);
  }

  _onSignUpMutationEvent(
    SignUpMutationSubmitEvent event,
    Emitter<SignUpState> emit,
  ) async {
    try {
      emit(SignUpLoading());

      final tokenResponse = await signUpRepository.fetchSignUp(
        name: event.name,
        email: event.email,
        password: event.password,
        phoneNumber: event.phoneNumber,
        city: event.city,
        address: event.address,
      );
      user = SignUpUserData(
        name: event.name,
        email: event.email,
        password: event.password,
        phoneNumber: event.phoneNumber,
      );

      debugPrint("TokenResponse: $tokenResponse");
      if (tokenResponse != null) {
        final authRepository = getIt<AuthRepositoryImpl>();
        await authRepository.signInProcedure(tokenResponse);
        emit(SignUpData(tokenResponse: tokenResponse));
      } else {
        emit(const SignUpError(errorMessage: "Something went wrong"));
      }
    } catch (e, stackTrace) {
      debugPrint("SignUpError: $e");
      log(error: e.toString(), "SignUpError", stackTrace: stackTrace);

      emit(SignUpError(errorMessage: e.toString()));
    }
  }
}
