import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/models/collections/query_field.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'form_field_event.dart';
part 'form_field_state.dart';

abstract class FormFieldBloc<ResultType>
    extends Bloc<FormFieldEvent, FormFieldState> {
  ResultType _result;
  List<Validator> Function(ResultType) validators;
  List<QueryField> Function(ResultType) queryFieldFromResult;
  String Function(BuildContext) getLabel;

  FormFieldBloc({
    @required initialResult,
    @required this.validators,
    @required this.getLabel,
    @required this.queryFieldFromResult,
  }) : super(FormFieldInitialState()) {
    _result = initialResult;
  }

  bool _checkValid(result) {
    List<Validator> v = validators(result);
    for (Validator validator in v) if (!validator.isValid()) return false;
    return true;
  }

  bool get isValid => _checkValid(_result);

  List<QueryField> get queryFields => queryFieldFromResult(_result);

  ResultType get result => _result;

  @override
  Stream<FormFieldState> mapEventToState(
    FormFieldEvent event,
  ) async* {
    if (event is FormFieldChangeOptionEvent) {
      yield FormFieldChangeInProgressState();
      _result = event.result;
      yield FormFieldChangedState(result: _result);
    }
  }
}
