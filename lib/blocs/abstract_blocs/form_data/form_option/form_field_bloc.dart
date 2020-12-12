import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'form_field_event.dart';
part 'form_field_state.dart';

abstract class FormFieldBloc<ResultType>
    extends Bloc<FormFieldEvent, FormFieldState> {
  ResultType result;
  List<Validator> Function(ResultType) validators;
  String queryFieldName;
  String Function(BuildContext) getLabel;

  FormFieldBloc({
    @required initialResult,
    @required this.validators,
    @required this.getLabel,
    @required this.queryFieldName,
  }) : super(FormFieldInitialState()) {
    result = initialResult;
  }

  bool _checkValid(result) {
    List<Validator> v = validators(result);
    for (Validator validator in v) if (!validator.isValid(result)) return false;
    return true;
  }

  bool get isValid => _checkValid(result);

  ResultType get getFinalResult => result;

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
