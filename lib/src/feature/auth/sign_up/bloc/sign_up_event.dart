part of 'sign_up_bloc.dart';

sealed class SignUpEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SignUpMutationSubmitEvent extends SignUpEvent {
  SignUpMutationSubmitEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.city,
    required this.address,
  });

  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String city;
  final String address;

  @override
  List<Object?> get props => [
    name,
    email,
    password,
    phoneNumber,
    city,
    address,
  ];
}
