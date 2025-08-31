part of 'delivery_flow_coordinator_cubit.dart';

sealed class CoordinatorState extends Equatable {
  const CoordinatorState();
}

final class CoordinatorInitial extends CoordinatorState {
  @override
  List<Object> get props => [];
}
