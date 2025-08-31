part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ResetForgotPassword extends ForgotPasswordEvent {}

class ForgotPasswordSubmit extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordSubmit({required this.email});

  @override
  List<Object?> get props => [email];
}

class ForgotPasswordOTPResend extends ForgotPasswordEvent {
  final String email;

  ForgotPasswordOTPResend({required this.email});

  @override
  List<Object?> get props => [email];
}

class ForgotPasswordOTPSubmit extends ForgotPasswordEvent {
  final String email;
  final String password;
  final String otp;

  ForgotPasswordOTPSubmit({
    required this.otp,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [otp];
}
