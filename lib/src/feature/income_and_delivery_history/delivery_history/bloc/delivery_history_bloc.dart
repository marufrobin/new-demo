import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/feature/income_and_delivery_history/delivery_history/data/repository/delivery_history.repository.dart';

import '../../../../core/common/app_enum.dart';
import '../../../../model/delivery_with_pagination.model.dart';

part 'delivery_history_event.dart';
part 'delivery_history_state.dart';

class DeliveryHistoryBloc
    extends Bloc<DeliveryHistoryEvent, DeliveryHistoryState> {
  DeliveryWithPaginationModel? data;
  DeliveryStatus currentStatus = DeliveryStatus.DELIVERED;

  final DeliveryHistoryRepository deliveryHistoryRepository;

  DeliveryHistoryBloc(this.deliveryHistoryRepository)
    : super(DeliveryHistoryInitial()) {
    on<DeliveryHistoryFetchingEvent>(_onFetching);
    on<DeliveryHistoryStatusChangedEvent>(_onStatusChanged);
    on<DeliveryHistoryAllDataFetchingEvent>(_onAllDataFetching);
    on<WeeklyDeliveryHistoryFetchingEvent>(_onWeeklyDeliveryHistoryFetching);
  }

  _onFetching(
    DeliveryHistoryFetchingEvent event,
    Emitter<DeliveryHistoryState> emit,
  ) async {
    try {
      if (event.isRefreshing ?? false) {
        data = null;
        emit(DeliveryHistoryLoading());
      } else if (state is DeliveryHistoryData) {
        final currentData = state as DeliveryHistoryData;
        emit(
          DeliveryHistoryData(
            completeData: currentData.completeData,
            cancelledData: currentData.cancelledData,
            currentStatus: currentData.currentStatus,
            isMoreLoading: true,
          ),
        );
      }

      data = await deliveryHistoryRepository.getDeliveryHistory(
        page: event.page ?? 1,
        limit: event.limit ?? 10,
        sort: event.sortBy,
        sortBy: event.sortType,
      );

      final hasReachedEnd = data?.meta?.hasNextPage ?? false;

      final completeListNodesData =
          data?.nodes
              ?.where((element) => element?.status == DeliveryStatus.DELIVERED)
              .toList();

      final cancelledListNodesData =
          data?.nodes
              ?.where((element) => element?.status == DeliveryStatus.CANCELLED)
              .toList();

      final completeData = DeliveryWithPaginationModel(
        meta: data?.meta,
        nodes: completeListNodesData,
      );

      final cancelledData = DeliveryWithPaginationModel(
        meta: data?.meta,
        nodes: cancelledListNodesData,
      );

      emit(
        DeliveryHistoryData(
          completeData: completeData,
          cancelledData: cancelledData,
          hasReachedEnd: hasReachedEnd,
          currentStatus: currentStatus,
        ),
      );
    } catch (e) {
      emit(DeliveryHistoryError(message: e.toString()));
    }
  }

  _onStatusChanged(
    DeliveryHistoryStatusChangedEvent event,
    Emitter<DeliveryHistoryState> emit,
  ) async {
    currentStatus = event.status;

    final completeListNodesData =
        data?.nodes
            ?.where((element) => element?.status == DeliveryStatus.DELIVERED)
            .toList();
    final cancelledListNodesData =
        data?.nodes
            ?.where((element) => element?.status == DeliveryStatus.CANCELLED)
            .toList();

    final completeData = DeliveryWithPaginationModel(
      meta: data?.meta,
      nodes: completeListNodesData,
    );

    final cancelledData = DeliveryWithPaginationModel(
      meta: data?.meta,
      nodes: cancelledListNodesData,
    );
    emit(
      DeliveryHistoryData(
        completeData: completeData,
        cancelledData: cancelledData,
        currentStatus: currentStatus,
        hasReachedEnd: data?.meta?.hasNextPage ?? false,
      ),
    );
  }

  _onAllDataFetching(
    DeliveryHistoryAllDataFetchingEvent event,
    Emitter<DeliveryHistoryState> emit,
  ) async {
    try {
      emit(DeliveryHistoryLoading());
      final response = await deliveryHistoryRepository.getDeliveryHistory(
        page: 1,
        limit: 10,
      );
      emit(DeliveryHistoryAllData(data: response));
    } catch (e) {
      emit(DeliveryHistoryError(message: e.toString()));
    }
  }

  _onWeeklyDeliveryHistoryFetching(
    WeeklyDeliveryHistoryFetchingEvent event,
    Emitter<DeliveryHistoryState> emit,
  ) async {
    try {
      emit(DeliveryHistoryLoading());
      final response = await deliveryHistoryRepository.getDeliveryHistory(
        page: 1,
        limit: 7,
        status: MyOrderHistoryStatus.DELIVERED,
      );
      emit(WeeklyDeliveryHistoryData(data: response));
    } catch (e) {
      emit(WeeklyDeliveryHistoryError(message: e.toString()));
    }
  }
}
