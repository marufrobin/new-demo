part of 'support_center_bloc.dart';

sealed class SupportCenterState extends Equatable {
  const SupportCenterState();

  @override
  List<Object?> get props => [];
}

final class SupportCenterInitial extends SupportCenterState {}

final class SupportCenterLoading extends SupportCenterState {}

final class SupportCenterThreadsData extends SupportCenterState {
  final SupportThreadWithPaginationModel? onGoingIssues;
  final SupportThreadWithPaginationModel? chatHistory;
  final bool? hasReachedEnd;
  final bool? isMoreLoading;

  const SupportCenterThreadsData({
    required this.onGoingIssues,
    required this.chatHistory,
    this.hasReachedEnd = false,
    this.isMoreLoading = false,
  });

  @override
  List<Object?> get props => [
    onGoingIssues,
    chatHistory,
    hasReachedEnd,
    isMoreLoading,
  ];
}

final class SupportCenterThreadsError extends SupportCenterState {
  final String? error;

  const SupportCenterThreadsError({required this.error});

  @override
  List<Object?> get props => [error];
}

final class CreateSupportThreadLoading extends SupportCenterState {}

final class CreateSupportThreadSuccess extends SupportCenterState {
  final bool? isSuccess;

  const CreateSupportThreadSuccess({this.isSuccess});

  @override
  List<Object?> get props => [isSuccess];
}

final class CreateSupportThreadError extends SupportCenterState {
  final String? error;

  const CreateSupportThreadError({required this.error});

  @override
  List<Object?> get props => [error];
}
