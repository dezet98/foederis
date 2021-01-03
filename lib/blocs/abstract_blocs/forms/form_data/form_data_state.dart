part of 'form_data_bloc.dart';

abstract class FormDataState extends Equatable {
  const FormDataState();

  @override
  List<Object> get props => [];
}

class FormDataInitialState extends FormDataState {}

class FormDataEditingState extends FormDataState {}

class FormDataEditedState extends FormDataState {}

class FormDataClearInProgressState extends FormDataState {}

class FormDataClearedState extends FormDataState {}
