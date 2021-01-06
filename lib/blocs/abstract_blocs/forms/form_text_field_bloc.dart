import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:engineering_thesis/data/models/utils/query_field.dart';
import 'package:flutter/widgets.dart';

import 'form_field/form_field_bloc.dart';

class FormTextFieldBloc extends FormFieldBloc<String> {
  final String initialResult;
  final List<Validator> Function(String) validators;
  final List<QueryField> Function(String) queryFieldFromResult;
  final String Function(BuildContext) getLabel;
  final String Function(BuildContext) getDescription;
  final String Function(BuildContext) placeholder;

  FormTextFieldBloc(
      {this.initialResult,
      @required this.validators,
      @required this.queryFieldFromResult,
      @required this.getLabel,
      this.placeholder,
      this.getDescription})
      : super(
          initialResult: initialResult ?? '',
          queryFieldFromResult: queryFieldFromResult,
          validators: validators,
          getLabel: getLabel,
          getDescription: getDescription,
        );
}
