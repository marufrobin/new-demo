part of 'notifications_bloc.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object?> get props => [];
}

final class NotificationsInitial extends NotificationsState {}

final class NotificationsLoading extends NotificationsState {}

final class NotificationsLoaded extends NotificationsState {
  final NotificationsModel? notifications;
  final bool isMoreLoading;
  final bool isNoMoreData;

  const NotificationsLoaded({
    this.notifications,
    this.isMoreLoading = false,
    this.isNoMoreData = false,
  });

  @override
  List<Object?> get props => [notifications, isMoreLoading, isNoMoreData];
}

final class NotificationsError extends NotificationsState {
  final String? message;

  const NotificationsError({this.message});

  @override
  List<Object?> get props => [message];
}
