part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginWithEmailAndPasswordEvent extends LoginEvent {
  final String email;
  final String password;

  LoginWithEmailAndPasswordEvent(
      {@required this.email, @required this.password});

  @override
  String toString() =>
      'LoginWithEmailAndPasswordEvent {email: $email, password: $password}';
}
