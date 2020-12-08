import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'form_field_event.dart';
part 'form_field_state.dart';

class FormFieldBloc<ResultType> extends Bloc<FormFieldEvent, FormFieldState> {
  ResultType result;
  List<Validator> validators;
  String Function(BuildContext) getLabel;

  FormFieldBloc(
      {@required initialResult, this.validators = const [], this.getLabel})
      : super(FormFieldInitialState()) {
    result = initialResult;
  }

  bool _checkValid() {
    for (Validator validator in validators)
      if (!validator.isValid(result)) return false;
    return true;
  }

  bool get isValid => _checkValid();

  @override
  Stream<FormFieldState> mapEventToState(
    FormFieldEvent event,
  ) async* {
    if (event is FormFieldChangeOptionEvent) {
      yield FormFieldChangeInProgressState();
      result = event.result;
      yield FormFieldChangedState(result: result);
    }
  }
}
