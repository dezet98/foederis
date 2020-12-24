part of 'form_data_bloc.dart';

abstract class FormDataState extends Equatable {
  const FormDataState();

  @override
  List<Object> get props => [];
}

class FormDataInitialState extends FormDataState {}

class FormDataEditingState extends FormDataState {}

class FormDataEditedState extends FormDataState {}

class FormDataUploadInProgressState extends FormDataState {}

class FormDataUploadFailureState extends FormDataState {
  final UploadDataException uploadDataException;

  FormDataUploadFailureState({this.uploadDataException});

  @override
  String toString() =>
      'FormDataUploadFailureState {exception: ${uploadDataException.toString()}}';
}

class FormDataUploadSuccessState extends FormDataState {}
