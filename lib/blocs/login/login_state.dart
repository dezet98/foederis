part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginInProgressState extends LoginState {}

class LoginFailureState extends LoginState {
  final LoginError loginError;
  final String message;

  LoginFailureState({this.loginError, this.message});

  @override
  String toString() => 'LoginFailureState {error: ${loginError.toString()}}';
}

class LoginSuccessState extends LoginState {}
