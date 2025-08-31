import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../../../../model/my_on_going_orders.model.dart';
import '../../data/repository/my_ongoing_orders.repository.dart';

part 'my_on_going_orders_event.dart';
part 'my_on_going_orders_state.dart';
//
// class MyOnGoingOrdersBloc
//     extends Bloc<MyOnGoingOrdersEvent, MyOnGoingOrdersState> {
//   final MyOngoingOrdersRepository repository;
//
//   MyOnGoingOrdersBloc(this.repository) : super(MyOnGoingOrdersInitial()) {
//     on<MyOnGoingOrdersFetchEvent>(_onMyOnGoingOrdersFetchEvent);
//   }
//
//   _onMyOnGoingOrdersFetchEvent(
//     MyOnGoingOrdersFetchEvent event,
//     Emitter<MyOnGoingOrdersState> emit,
//   ) async {
//     emit(const MyOnGoingOrdersLoading());
//     try {
//       emit(const MyOnGoingOrdersLoading());
//       final result = await repository.getMyOnGoingOrders();
//       log(name: "result of my on going orders", result.toString());
//       emit(MyOnGoingOrdersLoaded(myOnGoingOrders: result));
//     } catch (e) {
//       emit(MyOnGoingOrdersError(e.toString()));
//     }
//   }
//
//
// }

// Add this enhanced debugging to your MyOnGoingOrdersBloc

class MyOnGoingOrdersBloc
    extends Bloc<MyOnGoingOrdersEvent, MyOnGoingOrdersState> {
  final MyOngoingOrdersRepository repository;

  MyOnGoingOrdersBloc(this.repository) : super(MyOnGoingOrdersInitial()) {
    log(
      'MyOnGoingOrdersBloc created with repository: ${repository.runtimeType}',
    );
    on<MyOnGoingOrdersFetchEvent>(_onMyOnGoingOrdersFetchEvent);
  }

  @override
  void add(MyOnGoingOrdersEvent event) {
    log('Event added to MyOnGoingOrdersBloc: ${event.runtimeType}');
    super.add(event);
  }

  @override
  void onChange(Change<MyOnGoingOrdersState> change) {
    log(
      'MyOnGoingOrdersBloc state changed: ${change.currentState} -> ${change.nextState}',
    );
    super.onChange(change);
  }

  @override
  void onTransition(
    Transition<MyOnGoingOrdersEvent, MyOnGoingOrdersState> transition,
  ) {
    log(
      'MyOnGoingOrdersBloc transition: ${transition.event} -> ${transition.currentState} -> ${transition.nextState}',
    );
    super.onTransition(transition);
  }

  _onMyOnGoingOrdersFetchEvent(
    MyOnGoingOrdersFetchEvent event,
    Emitter<MyOnGoingOrdersState> emit,
  ) async {
    log('_onMyOnGoingOrdersFetchEvent started');

    emit(const MyOnGoingOrdersLoading());
    log('Emitted MyOnGoingOrdersLoading state');

    try {
      log('Calling repository.getMyOnGoingOrders()');
      final result = await repository.getMyOnGoingOrders();
      log('Repository result: $result');
      log('Result type: ${result.runtimeType}');
      log('Orders count: ${result?.myOngoingOrders?.length ?? 0}');

      emit(MyOnGoingOrdersLoaded(myOnGoingOrders: result));
      log('Emitted MyOnGoingOrdersLoaded state');
    } catch (e, stackTrace) {
      log('Error in _onMyOnGoingOrdersFetchEvent: $e');
      log('Stack trace: $stackTrace');
      emit(MyOnGoingOrdersError(e.toString()));
    }
  }
}
