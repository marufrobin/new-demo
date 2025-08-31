part of 'user_bloc.dart';

sealed class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

final class UserInitial extends UserState {}

final class UserLoading extends UserState {}

final class UserData extends UserState {
  final UserModel? userModel;

  const UserData({required this.userModel});

  @override
  List<Object?> get props => [userModel];
}

final class UserError extends UserState {
  final String errorMessage;

  const UserError({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
