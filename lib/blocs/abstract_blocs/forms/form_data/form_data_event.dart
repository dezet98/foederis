part of 'form_data_bloc.dart';

abstract class FormDataEvent extends Equatable {
  const FormDataEvent();

  @override
  List<Object> get props => [];
}

class FormDataEditingEvent<ResultType> extends FormDataEvent {
  final FormFieldBloc formFieldBloc;
  final ResultType result;

  FormDataEditingEvent({@required this.formFieldBloc, @required this.result});
}

class FormDataClearEvent extends FormDataEvent {}

class FormDataEditingEnabledEvent extends FormDataEvent {}

class FormDataEditingDisableEvent extends FormDataEvent {}
