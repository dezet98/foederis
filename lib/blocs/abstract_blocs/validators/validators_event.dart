part of 'validators_bloc.dart';

abstract class ValidatorsEvent extends Equatable {
  const ValidatorsEvent();

  @override
  List<Object> get props => [];
}

class ValidatorsInitEvent extends ValidatorsEvent {}
