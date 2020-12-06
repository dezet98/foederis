part of 'form_option_bloc.dart';

abstract class FormOptionEvent extends Equatable {
  const FormOptionEvent();

  @override
  List<Object> get props => [];
}

class FormOptionChangeOptionEvent<ResultType> extends FormOptionEvent {
  final ResultType result;

  FormOptionChangeOptionEvent({@required this.result});
}
