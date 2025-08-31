part of 'delivery_history_bloc.dart';

sealed class DeliveryHistoryEvent extends Equatable {
  const DeliveryHistoryEvent();

  @override
  List<Object?> get props => [];
}

final class DeliveryHistoryFetchingEvent extends DeliveryHistoryEvent {
  final int? page;
  final int? limit;
  final SortType? sortType;
  final String? sortBy;
  final bool? isRefreshing;

  const DeliveryHistoryFetchingEvent({
    this.page = 1,
    this.limit = 10,
    this.sortType,
    this.sortBy,
    this.isRefreshing,
  });

  @override
  List<Object?> get props => [page, limit, sortType, sortBy, isRefreshing];
}

class DeliveryHistoryStatusChangedEvent extends DeliveryHistoryEvent {
  final DeliveryStatus status;

  const DeliveryHistoryStatusChangedEvent({required this.status});

  @override
  List<Object?> get props => [status];
}

final class DeliveryHistoryAllDataFetchingEvent extends DeliveryHistoryEvent {}

///
/// Weekly Delivery History Event ------------------------------------------------------------------
///
final class WeeklyDeliveryHistoryFetchingEvent extends DeliveryHistoryEvent {}

///
/// ------------------------------------------------------------------------------------------------
