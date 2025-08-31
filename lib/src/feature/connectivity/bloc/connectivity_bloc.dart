import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final internetConnectionChecker = InternetConnectionChecker.instance;
  StreamSubscription<InternetConnectionStatus>? _connectivitySubscription;

  ConnectivityBloc() : super(const ConnectivityInitial()) {
    on<ConnectivityStarted>(_onStarted);
    on<ConnectivityChanged>(_onConnectivityChanged);
  }

  Future<void> _onStarted(
    ConnectivityStarted event,
    Emitter<ConnectivityState> emit,
  ) async {
    log("ConnectivityBloc _onStarted");
    log("${emit.isDone}", name: "emit.isDone");

    await _connectivitySubscription?.cancel();

    final initialResult = await internetConnectionChecker.hasConnection;
    if (!emit.isDone) {
      _updateConnectionStatus(initialResult, emit);
    }

    _connectivitySubscription = internetConnectionChecker.onStatusChange.listen(
      (event) {
        add(ConnectivityChanged(event == InternetConnectionStatus.connected));
      },
    );
  }

  Future<void> _onConnectivityChanged(
    ConnectivityChanged event,
    Emitter<ConnectivityState> emit,
  ) async => _updateConnectionStatus(event.isConnected, emit);

  void _updateConnectionStatus(
    bool isConnected,
    Emitter<ConnectivityState> emit,
  ) {
    log("${emit.isDone}", name: "emit.isDone");

    if (emit.isDone) return;
    log(name: "isConnected", isConnected.toString());
    if (isConnected) {
      emit(const ConnectivityConnected());
    } else {
      emit(const ConnectivityDisconnected());
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}

/*

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? _connectivitySubscription;

  ConnectivityBloc() : super(const ConnectivityInitial()) {
    on<ConnectivityStarted>(_onStarted);
    on<ConnectivityChanged>(_onConnectivityChanged);
  }

  Future<void> _onStarted(
    ConnectivityStarted event,
    Emitter<ConnectivityState> emit,
  ) async {
    await _connectivitySubscription?.cancel();

    final initialResult = await _connectivity.checkConnectivity();

    for (final result in initialResult) {
      _updateConnectionStatus(result, emit);
    }

    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen((event) {
              for (final result in event) {
                _updateConnectionStatus(result, emit);
              }
            })
            as StreamSubscription<ConnectivityResult>?;
  }

  Future<void> _onConnectivityChanged(
    ConnectivityChanged event,
    Emitter<ConnectivityState> emit,
  ) async => _updateConnectionStatus(event.result, emit);

  void _updateConnectionStatus(
    ConnectivityResult result,
    Emitter<ConnectivityState> emit,
  ) {
    log(name: "ConnectivityBloc", result.toString());
    switch (result) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
      case ConnectivityResult.ethernet:
        emit(const ConnectivityConnected());
        break;
      case ConnectivityResult.none:
        emit(const ConnectivityDisconnected());
        break;
      default:
        emit(const ConnectivityDisconnected());
    }
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
*/
