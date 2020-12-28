part of 'validators_bloc.dart';

abstract class ValidatorsState extends Equatable {
  const ValidatorsState();

  @override
  List<Object> get props => [];
}

class ValidatorsInitialState extends ValidatorsState {}

class ValidatorsValidationInProgressState extends ValidatorsState {}

class ValidatorsValidState extends ValidatorsState {}

class ValidatorsInvalidState extends ValidatorsState {
  final String messsage;

  ValidatorsInvalidState({@required this.messsage});
}

class ValidatorsValidationFailureState extends ValidatorsState {}
