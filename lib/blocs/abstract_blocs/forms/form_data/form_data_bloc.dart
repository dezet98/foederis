import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../models/collections/query_field.dart';
import '../form_field/form_field_bloc.dart';

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

  Map<String, dynamic> queryFields() {
    Map<String, dynamic> queryFields = Map();

    for (FormFieldBloc formFieldBloc in formsData) {
      for (QueryField queryField in formFieldBloc.queryFields)
        queryFields[queryField.fieldName] = queryField.fieldValue;
    }

    return queryFields;
  }

  @override
  Stream<FormDataState> mapEventToState(
    FormDataEvent event,
  ) async* {
    if (event is FormDataEditingEvent) {
      yield* mapFormDataEditingEvent(event.formFieldBloc, event.result);
    } else if (event is FormDataEditingEnabledEvent) {
      for (FormFieldBloc formFieldBloc in formsData)
        formFieldBloc.add(FormFieldEditingEnableEvent());
    } else if (event is FormDataEditingDisableEvent) {
      for (FormFieldBloc formFieldBloc in formsData)
        formFieldBloc.add(FormFieldEditingDisableEvent());
    } else if (event is FormDataClearEvent) {
      for (FormFieldBloc formFieldBloc in formsData)
        formFieldBloc.add(FormFieldClearEvent());
    }
  }

  Stream<FormDataState> mapFormDataEditingEvent(
      FormFieldBloc formFieldBloc, dynamic formFieldResult) async* {
    try {
      yield FormDataEditingState();
      formFieldBloc.add(FormFieldChangeOptionEvent(result: formFieldResult));
      yield FormDataEditedState();
    } catch (e) {}
  }
}
