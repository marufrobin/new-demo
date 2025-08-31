part of 'email_login_bloc.dart';

sealed class EmailLoginState extends Equatable {
  const EmailLoginState();

  @override
  List<Object?> get props => [];
}

final class EmailLoginInitial extends EmailLoginState {}

final class EmailLoginLoading extends EmailLoginState {}

final class EmailLoginFailure extends EmailLoginState {
  const EmailLoginFailure({required this.message});

  final String? message;

  @override
  List<Object?> get props => [message];
}

final class EmailLoginSuccess extends EmailLoginState {
  const EmailLoginSuccess({required this.tokenResponse});

  final TokenResponseModel? tokenResponse;

  @override
  List<Object?> get props => [tokenResponse];
}
