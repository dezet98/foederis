part of 'form_field_bloc.dart';

abstract class FormFieldEvent extends Equatable {
  const FormFieldEvent();

  @override
  List<Object> get props => [];
}

class FormFieldChangeOptionEvent<ResultType> extends FormFieldEvent {
  final ResultType result;

  FormFieldChangeOptionEvent({@required this.result});
}
