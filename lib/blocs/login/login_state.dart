part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginInProgressState extends LoginState {}

class LoginFailureState extends LoginState {
  final String error;

  LoginFailureState({@required this.error});

  @override
  String toString() => 'LoginFailureState {error: $error}';
}

class LoginSuccessState extends LoginState {}
