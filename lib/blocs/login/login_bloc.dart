import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/constants/enums.dart';
import 'package:engineering_thesis/repositories/auth_repository.dart';
import 'package:engineering_thesis/shared/app_logger.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

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
      yield LoginFailureState(
          loginError: loginException.loginError,
          message: loginException.message);
    }
  }
}