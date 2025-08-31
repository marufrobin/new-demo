part of 'support_center_bloc.dart';

sealed class SupportCenterEvent extends Equatable {
  const SupportCenterEvent();

  @override
  List<Object?> get props => [];
}

final class SupportCenterThreadsFetchEvent extends SupportCenterEvent {
  final int? limit;
  final int? page;
  final SortType? sort;
  final String? sortBy;
  final bool? isRefreshing;

  const SupportCenterThreadsFetchEvent({
    this.limit,
    this.page,
    this.sort,
    this.sortBy,
    this.isRefreshing,
  });

  @override
  List<Object?> get props => [limit, page, sort, sortBy, isRefreshing];
}

final class SupportCenterThreadsFetchMoreEvent extends SupportCenterEvent {
  final int? page;
  final int? limit;
  final SortType? sort;
  final String? sortBy;

  const SupportCenterThreadsFetchMoreEvent({
    this.page,
    this.limit,
    this.sort,
    this.sortBy,
  });

  @override
  List<Object?> get props => [page, limit, sort, sortBy];
}

final class CreateSupportThreadEvent extends SupportCenterEvent {
  final String title;
  final String body;
  final String? imageKey;

  const CreateSupportThreadEvent({
    required this.title,
    required this.body,
    this.imageKey,
  });

  @override
  List<Object?> get props => [title, body, imageKey];
}
