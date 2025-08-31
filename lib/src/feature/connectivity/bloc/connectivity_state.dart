part of 'connectivity_bloc.dart';

sealed class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object> get props => [];
}

final class ConnectivityInitial extends ConnectivityState {
  const ConnectivityInitial();
}

final class ConnectivityConnected extends ConnectivityState {
  const ConnectivityConnected();
}

final class ConnectivityDisconnected extends ConnectivityState {
  const ConnectivityDisconnected();
}
