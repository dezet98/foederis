import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/data/services/remote_auth_service.dart';
import 'package:engineering_thesis/shared/constants/errors.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../shared/exceptions/exceptions.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final RemoteAuthService _authRepository;
  LoginBloc({@required RemoteAuthService authRepository})
      : _authRepository = authRepository,
        super(LoginInitialState());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginWithEmailAndPasswordEvent) {
      yield* mapLoginWithEmailAndPasswordEvent(
          email: event.email, password: event.password);
    }
  }

  Stream<LoginState> mapLoginWithEmailAndPasswordEvent(
      {@required String email, @required String password}) async* {
    try {
      yield LoginInProgressState();
      await _authRepository.signInWithEmailAndPassword(
          email: email, password: password);
      yield LoginSuccessState();
    } catch (e) {
      if (e is LoginException) {
        yield LoginFailureState(loginException: e);
      } else {
        yield LoginFailureState(
          loginException: LoginException(loginError: LoginError.undefined),
        );
      }
    }
  }
}
