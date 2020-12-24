import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../repositories/auth_repository.dart';
import '../../../../shared/app_logger.dart';
import '../../../../shared/exceptions.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;
  LoginBloc({@required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginWithEmailAndPasswordEvent) {
      yield LoginInProgressState();
      yield* mapLoginWithEmailAndPasswordEvent(
          email: event.email, password: event.password);
    }
  }

  Stream<LoginState> mapLoginWithEmailAndPasswordEvent(
      {@required String email, @required String password}) async* {
    try {
      await _authRepository.signInWithEmailAndPassword(
          email: email, password: password);
      yield LoginSuccessState();
    } on LoginException catch (loginException) {
      AppLogger().log(
          message: loginException.loginError.toString(),
          logLevel: LogLevel.warning);
      yield LoginFailureState(loginException: loginException);
    }
  }
}
