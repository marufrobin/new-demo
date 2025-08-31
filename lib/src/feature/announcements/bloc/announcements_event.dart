part of 'announcements_bloc.dart';

sealed class AnnouncementsEvent extends Equatable {
  const AnnouncementsEvent();

  @override
  List<Object?> get props => [];
}

final class AnnouncementsFetchingEvent extends AnnouncementsEvent {
  final int? page;
  final int? limit;
  final SortType? sortType;
  final String? sortBy;

  const AnnouncementsFetchingEvent({
    this.page = 1,
    this.limit = 10,
    this.sortType,
    this.sortBy,
  });

  @override
  List<Object?> get props => [page, limit, sortType, sortBy];
}

final class AnnouncementsFetchingMoreEvent extends AnnouncementsEvent {
  final int? page;
  final int? limit;
  final SortType? sortType;
  final String? sortBy;

  const AnnouncementsFetchingMoreEvent({
    this.page,
    this.limit,
    this.sortType,
    this.sortBy,
  });

  @override
  List<Object?> get props => [page, limit, sortType, sortBy];
}
