part of 'my_on_going_orders_bloc.dart';

@immutable
sealed class MyOnGoingOrdersState extends Equatable {
  const MyOnGoingOrdersState();

  @override
  List<Object?> get props => [];
}

final class MyOnGoingOrdersInitial extends MyOnGoingOrdersState {}

final class MyOnGoingOrdersLoading extends MyOnGoingOrdersState {
  const MyOnGoingOrdersLoading();
}

final class MyOnGoingOrdersLoaded extends MyOnGoingOrdersState {
  final MyOnGoingOrdersModel? myOnGoingOrders;

  const MyOnGoingOrdersLoaded({this.myOnGoingOrders});

  @override
  List<Object?> get props => [myOnGoingOrders];
}

final class MyOnGoingOrdersError extends MyOnGoingOrdersState {
  final String? error;

  const MyOnGoingOrdersError(this.error);

  @override
  List<Object?> get props => [error];
}
