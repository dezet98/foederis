part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterState {}

class RegisterInProgressState extends RegisterState {}

class RegisterFailureState extends RegisterState {
  final RegisterException registerException;

  RegisterFailureState({@required this.registerException});
}

class RegisterSuccessState extends RegisterState {}
