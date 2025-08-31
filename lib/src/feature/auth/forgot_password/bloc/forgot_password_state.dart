part of 'forgot_password_bloc.dart';

sealed class ForgotPasswordState extends Equatable {
  @override
  List<Object> get props => [];
}

final class ForgotPasswordInitial extends ForgotPasswordState {}

final class ForgotPasswordLoading extends ForgotPasswordState {}

final class ForgotPasswordSuccess extends ForgotPasswordState {
  final String email;

  ForgotPasswordSuccess(this.email);

  @override
  List<Object> get props => [email];
}

final class ForgotPasswordFailure extends ForgotPasswordState {
  final String error;

  ForgotPasswordFailure(this.error);

  @override
  List<Object> get props => [error];
}

final class ForgotPasswordOtpVerify extends ForgotPasswordState {
  final String otp;

  ForgotPasswordOtpVerify(this.otp);

  @override
  List<Object> get props => [otp];
}

class ForgotPasswordOtpLoading extends ForgotPasswordState {}

class ForgotPasswordOtpFailure extends ForgotPasswordState {
  final String error;

  ForgotPasswordOtpFailure(this.error);

  @override
  List<Object> get props => [error];
}

class ForgotPasswordOtpSuccess extends ForgotPasswordState {
  final String email;

  ForgotPasswordOtpSuccess(this.email);

  @override
  List<Object> get props => [email];
}
