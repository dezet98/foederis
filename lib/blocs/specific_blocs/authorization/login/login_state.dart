part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginInProgressState extends LoginState {}

class LoginFailureState extends LoginState {
  final LoginException loginException;

  LoginFailureState({this.loginException});

  @override
  String toString() =>
      'LoginFailureState {error: ${loginException.loginError.toString()}}';
}

class LoginSuccessState extends LoginState {}
