part of 'phone_number_login_bloc.dart';

@immutable
sealed class PhoneNumberLoginState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class PhoneNumberLoginInitial extends PhoneNumberLoginState {}

final class PhoneNumberLoginLoading extends PhoneNumberLoginState {}

final class PhoneNumberLoginFailure extends PhoneNumberLoginState {
  PhoneNumberLoginFailure({required this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class PhoneNumberLoginSuccess extends PhoneNumberLoginState {
  PhoneNumberLoginSuccess({required this.tokenResponse});

  final TokenResponseModel? tokenResponse;

  @override
  List<Object?> get props => [tokenResponse];
}

final class PhoneNumberSendLoginOTPLoading extends PhoneNumberLoginState {}

final class PhoneNumberSendLoginOTPFailure extends PhoneNumberLoginState {
  PhoneNumberSendLoginOTPFailure({required this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class PhoneNumberSendLoginOTPSuccess extends PhoneNumberLoginState {
  PhoneNumberSendLoginOTPSuccess({required this.isOTPSent});

  final bool? isOTPSent;

  @override
  List<Object?> get props => [isOTPSent];
}
