import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/feature/jobs/data/repository/delivery_order_data.repository.dart';
import 'package:rider/src/model/delivery.model.dart';
import 'package:rider/src/model/my_on_going_orders.model.dart';

part 'delivery_order_event.dart';
part 'delivery_order_state.dart';

class DeliveryOrderBloc extends Bloc<DeliveryOrderEvent, DeliveryOrderState> {
  final DeliveryOrderDataRepository repository;

  DeliveryOrderBloc(this.repository) : super(DeliveryOrderInitial()) {
    on<DeliveryOrderFetchEvent>(_onDeliveryOrderFetchEvent);
  }

  _onDeliveryOrderFetchEvent(
    DeliveryOrderFetchEvent event,
    Emitter<DeliveryOrderState> emit,
  ) async {
    emit(const DeliveryOrderLoading());
    try {
      emit(const DeliveryOrderLoading());
      final result = await repository.getDeliveryOrder(event.deliveryID);

      emit(DeliveryOrderLoaded(deliveryOrder: result));
    } catch (e) {
      emit(DeliveryOrderError(error: e.toString()));
    }
  }
}
