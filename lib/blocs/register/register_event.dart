part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterUserWithEmailAndPasswordEvent extends RegisterEvent {
  final String email;
  final String password;

  RegisterUserWithEmailAndPasswordEvent(
      {@required this.email, @required this.password});
}
