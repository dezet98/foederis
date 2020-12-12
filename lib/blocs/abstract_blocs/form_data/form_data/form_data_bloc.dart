import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option_list_field_bloc.dart';
import 'package:engineering_thesis/shared/exceptions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'form_data_event.dart';
part 'form_data_state.dart';

abstract class FormDataBloc extends Bloc<FormDataEvent, FormDataState> {
  List<FormFieldBloc> formsData;

  FormDataBloc(this.formsData) : super(FormDataInitialState());

  bool get isValid {
    for (FormFieldBloc optionBloc in formsData)
      if (!optionBloc.isValid) return false;
    return true;
  }

  Future<void> query(Map<String, dynamic> queryFields);

  Map<String, dynamic> queryFields() {
    Map<String, dynamic> queryFields = Map();

    for (FormFieldBloc formFieldBloc in formsData) {
      if (formFieldBloc.queryFieldName != null) {
        if (formFieldBloc is FormOptionListFieldBloc) {
          queryFields[formFieldBloc.queryFieldName] =
              formFieldBloc.getResultFromOption(formFieldBloc.result);
        }
        queryFields[formFieldBloc.queryFieldName] = formFieldBloc.result;
      }
    }
    return queryFields;
  }

  bool get editingEnabled => !(state is FormDataUploadInProgressState);

  @override
  Stream<FormDataState> mapEventToState(
    FormDataEvent event,
  ) async* {
    if (event is FormDataEditingEvent) {
      yield FormDataEditingState();
      event.formFieldBloc.add(FormFieldChangeOptionEvent(result: event.result));
      yield FormDataEditedState();
    } else if (event is FormDataSendingEvent) {
      try {
        yield FormDataUploadInProgressState();
        await query(queryFields());
        yield FormDataUploadSuccessState();
      } catch (e) {
        yield FormDataUploadFailureState(uploadDataException: e);
      }
    }
  }
}
