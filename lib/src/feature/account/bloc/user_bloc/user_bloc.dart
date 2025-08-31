import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rider/src/feature/account/data/repository/user.repository.dart';

import '../../../../model/user.model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc(this.userRepository) : super(UserInitial()) {
    on<UserDataFetchingEvent>(_onUserDataFetching);
  }

  _onUserDataFetching(
    UserDataFetchingEvent event,
    Emitter<UserState> emit,
  ) async {
    try {
      emit(UserLoading());
      final data = await userRepository.getUserData();
      log(data.toString(), name: "data from BLoC");
      emit(UserData(userModel: data));
    } catch (e) {
      emit(UserError(errorMessage: e.toString()));
    }
  }
}
