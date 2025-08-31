part of 'support_message_bloc.dart';

sealed class SupportMessageState extends Equatable {
  const SupportMessageState();

  // Add this getter to the base class
  SupportMessageWithPaginationModel? get supportMessageWithPagination => null;

  @override
  List<Object?> get props => [];
}

final class SupportMessageInitial extends SupportMessageState {}

final class SupportMessageLoading extends SupportMessageState {}

final class SupportMessageSendLoading extends SupportMessageState {
  final SupportMessageWithPaginationModel? _supportMessageWithPagination;

  const SupportMessageSendLoading({
    SupportMessageWithPaginationModel? supportMessageWithPagination,
  }) : _supportMessageWithPagination = supportMessageWithPagination;

  @override
  SupportMessageWithPaginationModel? get supportMessageWithPagination =>
      _supportMessageWithPagination;

  @override
  List<Object?> get props => [_supportMessageWithPagination];
}

final class UpdateSupportMessageLoading extends SupportMessageState {
  final SupportMessageWithPaginationModel? _supportMessageWithPagination;

  const UpdateSupportMessageLoading({
    SupportMessageWithPaginationModel? supportMessageWithPagination,
  }) : _supportMessageWithPagination = supportMessageWithPagination;

  @override
  SupportMessageWithPaginationModel? get supportMessageWithPagination =>
      _supportMessageWithPagination;

  @override
  List<Object?> get props => [_supportMessageWithPagination];
}

final class UpdateSupportMessageSuccess extends SupportMessageState {
  final SupportMessageWithPaginationModel? _supportMessageWithPagination;
  final bool? isSuccess;

  const UpdateSupportMessageSuccess({
    SupportMessageWithPaginationModel? supportMessageWithPagination,
    this.isSuccess,
  }) : _supportMessageWithPagination = supportMessageWithPagination;

  @override
  SupportMessageWithPaginationModel? get supportMessageWithPagination =>
      _supportMessageWithPagination;

  @override
  List<Object?> get props => [_supportMessageWithPagination, isSuccess];
}

final class SupportMessageSendSuccess extends SupportMessageState {
  final SupportMessageWithPaginationModel? _supportMessageWithPagination;
  final bool? isSuccess;

  const SupportMessageSendSuccess({
    SupportMessageWithPaginationModel? supportMessageWithPagination,
    this.isSuccess,
  }) : _supportMessageWithPagination = supportMessageWithPagination;

  @override
  SupportMessageWithPaginationModel? get supportMessageWithPagination =>
      _supportMessageWithPagination;

  @override
  List<Object?> get props => [_supportMessageWithPagination, isSuccess];
}

final class SupportMessageData extends SupportMessageState {
  final SupportMessageWithPaginationModel? _supportMessageWithPagination;

  const SupportMessageData({
    SupportMessageWithPaginationModel? supportMessageWithPagination,
  }) : _supportMessageWithPagination = supportMessageWithPagination;

  @override
  SupportMessageWithPaginationModel? get supportMessageWithPagination =>
      _supportMessageWithPagination;

  @override
  List<Object?> get props => [_supportMessageWithPagination];
}

final class SupportMessageError extends SupportMessageState {
  final String? error;
  final SupportMessageWithPaginationModel? _supportMessageWithPagination;

  const SupportMessageError({
    this.error,
    SupportMessageWithPaginationModel? supportMessageWithPagination,
  }) : _supportMessageWithPagination = supportMessageWithPagination;

  @override
  SupportMessageWithPaginationModel? get supportMessageWithPagination =>
      _supportMessageWithPagination;

  @override
  List<Object?> get props => [error, _supportMessageWithPagination];
}
