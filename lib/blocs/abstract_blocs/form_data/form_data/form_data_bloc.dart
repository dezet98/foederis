import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_data_event.dart';
part 'form_data_state.dart';

abstract class FormDataBloc extends Bloc<FormDataEvent, FormDataState> {
  final List<FormFieldBloc> formsData;

  FormDataBloc(this.formsData) : super(FormDataInitialState());

  bool isValid() {
    for (FormFieldBloc optionBloc in formsData)
      if (!optionBloc.isValid) return false;
    return true;
  }

  @override
  Stream<FormDataState> mapEventToState(
    FormDataEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
