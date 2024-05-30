import 'dart:async';
import 'package:advans_app/services/authentification/authentificationService.dart';
import 'package:bloc/bloc.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationService authService;

  LoginBloc({required this.authService}) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginDataChanged) {
      yield LoginInitial(); // Reset the state

      // Perform input validation
      bool isValid = true;
      if (event.username.isEmpty) {
        isValid = false;
        yield LoginFailure('Please enter a username');
      }
      if (event.password.isEmpty) {
        isValid = false;
        yield LoginFailure('Please enter a password');
      }

      if (isValid) {
        yield LoginValid();
      }
    } else if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        await authService.login(event.username, event.password);
        yield LoginSuccess();
      } catch (e) {
        yield LoginFailure(e.toString());
      }
    }
  }
}
