part of 'my_on_going_orders_bloc.dart';

@immutable
sealed class MyOnGoingOrdersEvent extends Equatable {
  const MyOnGoingOrdersEvent();

  @override
  List<Object?> get props => [];
}

final class MyOnGoingOrdersFetchEvent extends MyOnGoingOrdersEvent {}
