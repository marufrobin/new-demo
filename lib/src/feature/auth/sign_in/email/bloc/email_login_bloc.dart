import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/config/app.dependency.dart';
import '../../../../../model/token_response.model.dart';
import '../../../auth_repository.dart';

part 'email_login_event.dart';
part 'email_login_state.dart';

class EmailLoginBloc extends Bloc<EmailLoginEvent, EmailLoginState> {
  EmailLoginBloc() : super(EmailLoginInitial()) {
    on<EmailLoginWithPasswordEvent>(_onSubmit);
  }
  final _authRepository = getIt<AuthRepositoryImpl>();
  _onSubmit(
    EmailLoginWithPasswordEvent event,
    Emitter<EmailLoginState> emit,
  ) async {
    try {
      emit(EmailLoginLoading());

      final result = await _authRepository.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );
      if (result == null) {
        emit(const EmailLoginFailure(message: "Something went wrong!"));
        return;
      }

      /// Sending token for login procedure
      _authRepository.signInProcedure(result);
      emit(EmailLoginSuccess(tokenResponse: result));
    } catch (e) {
      emit(EmailLoginFailure(message: e.toString()));
    }
  }
}
