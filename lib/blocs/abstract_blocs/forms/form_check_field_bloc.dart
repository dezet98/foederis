import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:engineering_thesis/data/models/utils/query_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'form_field/form_field_bloc.dart';

class FormCheckFieldBloc extends FormFieldBloc<bool> {
  final bool initialResult;
  final List<Validator> Function(bool) validators;
  final List<QueryField> Function(bool) queryFieldFromResult;
  final String Function(BuildContext) getLabel;
  final String Function(BuildContext) getDescription;

  FormCheckFieldBloc({
    @required this.initialResult,
    @required this.validators,
    @required this.getLabel,
    @required this.queryFieldFromResult,
    this.getDescription,
  }) : super(
          initialResult: initialResult,
          queryFieldFromResult: queryFieldFromResult,
          validators: validators,
          getLabel: getLabel,
          getDescription: getDescription,
        );
}
