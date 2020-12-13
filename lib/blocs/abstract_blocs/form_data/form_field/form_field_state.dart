part of 'form_field_bloc.dart';

abstract class FormFieldState extends Equatable {
  const FormFieldState();

  @override
  List<Object> get props => [];
}

class FormFieldInitialState<FormType> extends FormFieldState {}

class FormFieldChangeInProgressState extends FormFieldState {}

class FormFieldChangedState<ResultType> extends FormFieldState {
  final ResultType result;

  FormFieldChangedState({@required this.result});
}
