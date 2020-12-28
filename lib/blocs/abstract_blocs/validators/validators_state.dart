part of 'validators_bloc.dart';

abstract class ValidatorsState extends Equatable {
  const ValidatorsState();

  @override
  List<Object> get props => [];
}

class ValidatorsInitialState extends ValidatorsState {}

class ValidatorsInitInProgressState extends ValidatorsState {}

class ValidatorsInitSuccessState extends ValidatorsState {}

class ValidatorsInitFailureState extends ValidatorsState {
  final String message;

  ValidatorsInitFailureState({this.message});
}
