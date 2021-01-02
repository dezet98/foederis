import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../models/collections/query_field.dart';

part 'form_field_event.dart';
part 'form_field_state.dart';

abstract class FormFieldBloc<ResultType>
    extends Bloc<FormFieldEvent, FormFieldState> {
  ResultType _result;
  List<Validator> Function(ResultType) validators;
  List<QueryField> Function(ResultType) queryFieldFromResult;
  String Function(BuildContext) getLabel;
  String Function(BuildContext) getDescription;
  bool editingEnabled;
  ResultType initialResult;

  FormFieldBloc({
    @required this.initialResult,
    @required this.validators,
    @required this.getLabel,
    @required this.queryFieldFromResult,
    @required this.getDescription,
    this.editingEnabled = true,
  }) : super(FormFieldInitialState()) {
    _result = initialResult;
  }

  List<Validator> get currentValidators => validators(_result);

  bool _checkValid(result) => Validator.checkValid(validators(result));

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
    } else if (event is FormFieldEditingEnableEvent) {
      editingEnabled = true;
      yield FormFieldEditingEnabledState();
    } else if (event is FormFieldEditingDisableEvent) {
      editingEnabled = false;
      yield FormFieldEditingDisabledState();
    } else if (event is FormFieldClearEvent) {
      _result = initialResult;
      yield FormFieldClearedState();
    }
  }
}
