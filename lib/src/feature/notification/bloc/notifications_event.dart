part of 'notifications_bloc.dart';

sealed class NotificationsEvent extends Equatable {
  const NotificationsEvent();

  @override
  List<Object?> get props => [];
}

final class NotificationsFetchEvent extends NotificationsEvent {
  final int? page;
  final int? limit;
  final SortType? sortType;
  final String? sortBy;

  const NotificationsFetchEvent({
    this.page = 1,
    this.limit = 10,
    this.sortType,
    this.sortBy,
  });

  @override
  List<Object?> get props => [page, limit, sortType, sortBy];
}

final class NotificationsFetchMoreEvent extends NotificationsEvent {
  final int? page;
  final int? limit;
  final SortType? sortType;
  final String? sortBy;

  const NotificationsFetchMoreEvent({
    this.page,
    this.limit,
    this.sortType,
    this.sortBy,
  });

  @override
  List<Object?> get props => [page, limit, sortType, sortBy];
}
