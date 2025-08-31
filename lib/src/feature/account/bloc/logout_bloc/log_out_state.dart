part of 'log_out_bloc.dart';

sealed class LogOutState extends Equatable {
  const LogOutState();

  @override
  List<Object?> get props => [];
}

final class LogOutInitial extends LogOutState {}

final class LogOutLoading extends LogOutState {}

final class LogOutSuccess extends LogOutState {
  final bool isLoggedOut;

  const LogOutSuccess({required this.isLoggedOut});

  @override
  List<Object?> get props => [isLoggedOut];
}

final class LogOutFailure extends LogOutState {
  final String errorMassage;

  const LogOutFailure({required this.errorMassage});

  @override
  List<Object?> get props => [errorMassage];
}
