part of 'phone_number_login_bloc.dart';

@immutable
sealed class PhoneNumberLoginEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class PhoneNumberSendLoginOTPEvent extends PhoneNumberLoginEvent {
  final String phoneNumber;

  PhoneNumberSendLoginOTPEvent({required this.phoneNumber});

  @override
  List<Object?> get props => [phoneNumber];
}

class PhoneNumberLoginUsingOTPEvent extends PhoneNumberLoginEvent {
  final String phoneNumber;
  final String otp;

  PhoneNumberLoginUsingOTPEvent({required this.phoneNumber, required this.otp});

  @override
  List<Object?> get props => [phoneNumber, otp];
}

class ResetPhoneNumberLoginEvent extends PhoneNumberLoginEvent {
  @override
  List<Object?> get props => [];
}
