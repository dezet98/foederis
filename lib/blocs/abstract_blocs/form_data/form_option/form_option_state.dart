part of 'form_option_bloc.dart';

abstract class FormOptionState extends Equatable {
  const FormOptionState();

  @override
  List<Object> get props => [];
}

class FormOptionInitialState extends FormOptionState {}

class FormOptioChangeInProgressState extends FormOptionState {}

class FormOptionChangedState extends FormOptionState {}
