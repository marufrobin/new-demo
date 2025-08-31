import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/config/app.dependency.dart';
import '../../../auth/auth_repository.dart';

part 'log_out_event.dart';
part 'log_out_state.dart';

class LogOutBloc extends Bloc<LogOutEvent, LogOutState> {
  LogOutBloc() : super(LogOutInitial()) {
    on<LogOutInitiateEvent>(_onLogOutInitiate);
  }

  final _authRepository = getIt<AuthRepositoryImpl>();

  Future<void> _onLogOutInitiate(
    LogOutInitiateEvent event,
    Emitter<LogOutState> emit,
  ) async {
    try {
      emit(LogOutLoading());
      final isLoggedOut = await _authRepository.logout();
      if (isLoggedOut != null && isLoggedOut) {
        emit(LogOutSuccess(isLoggedOut: isLoggedOut));
        _authRepository.signInCleanUpProcedure();
      } else {
        emit(const LogOutFailure(errorMassage: "Something went wrong"));
      }
    } catch (e) {
      emit(LogOutFailure(errorMassage: e.toString()));
    }
  }
}
