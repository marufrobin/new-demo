part of 'delete_account_bloc.dart';

sealed class DeleteAccountState extends Equatable {
  const DeleteAccountState();

  @override
  List<Object?> get props => [];
}

final class DeleteAccountInitial extends DeleteAccountState {}

final class DeleteAccountLoading extends DeleteAccountState {}

final class DeleteAccountSuccess extends DeleteAccountState {
  final bool isDeleted;

  const DeleteAccountSuccess({required this.isDeleted});

  @override
  List<Object?> get props => [isDeleted];
}

final class DeleteAccountFailure extends DeleteAccountState {
  final String errorMassage;

  const DeleteAccountFailure({required this.errorMassage});

  @override
  List<Object?> get props => [errorMassage];
}
