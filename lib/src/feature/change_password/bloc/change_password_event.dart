part of 'change_password_bloc.dart';

sealed class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();

  @override
  List<Object?> get props => [];
}

final class ChangeMyPasswordPatchEvent extends ChangePasswordEvent {
  final String? confirmNewPassword;
  final String? oldPassword;
  final String? newPassword;

  const ChangeMyPasswordPatchEvent({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmNewPassword,
  });

  @override
  List<Object?> get props => [confirmNewPassword, oldPassword, newPassword];
}
