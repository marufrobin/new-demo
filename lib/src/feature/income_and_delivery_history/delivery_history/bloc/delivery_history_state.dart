part of 'delivery_history_bloc.dart';

sealed class DeliveryHistoryState extends Equatable {
  const DeliveryHistoryState();

  @override
  List<Object?> get props => [];
}

final class DeliveryHistoryInitial extends DeliveryHistoryState {}

final class DeliveryHistoryLoading extends DeliveryHistoryState {}

final class DeliveryHistoryData extends DeliveryHistoryState {
  final DeliveryWithPaginationModel? completeData;
  final DeliveryWithPaginationModel? cancelledData;
  final bool hasReachedEnd;
  final bool isMoreLoading;
  final DeliveryStatus currentStatus;

  const DeliveryHistoryData({
    required this.completeData,
    required this.cancelledData,
    this.hasReachedEnd = false,
    this.isMoreLoading = false,
    required this.currentStatus,
  });

  @override
  List<Object?> get props => [
    completeData,
    cancelledData,
    hasReachedEnd,
    isMoreLoading,
    currentStatus,
  ];
}

final class DeliveryHistoryAllData extends DeliveryHistoryState {
  final DeliveryWithPaginationModel? data;

  const DeliveryHistoryAllData({required this.data});

  @override
  List<Object?> get props => [data];
}

final class DeliveryHistoryError extends DeliveryHistoryState {
  final String? message;

  const DeliveryHistoryError({this.message});

  @override
  List<Object?> get props => [message];
}

///
/// Weekly Delivery History State ------------------------------------------------------------------
///
final class WeeklyDeliveryHistoryData extends DeliveryHistoryState {
  final DeliveryWithPaginationModel? data;

  const WeeklyDeliveryHistoryData({this.data});

  @override
  List<Object?> get props => [data];
}

final class WeeklyDeliveryHistoryError extends DeliveryHistoryState {
  final String? message;

  const WeeklyDeliveryHistoryError({this.message});

  @override
  List<Object?> get props => [message];
}

/// ------------------------------------------------------------------------------------------------
