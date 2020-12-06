import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_option_bloc.dart';
import 'package:equatable/equatable.dart';

part 'form_data_event.dart';
part 'form_data_state.dart';

abstract class FormDataBloc extends Bloc<FormDataEvent, FormDataState> {
  FormDataBloc() : super(FormDataInitialState());

  List<FormOptionBloc> get formsData;

  bool isValid() {
    for (FormOptionBloc optionBloc in formsData)
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
