import 'package:engineering_thesis/models/collections/query_field.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:flutter/widgets.dart';
import 'form_field/form_field_bloc.dart';

class FormTextFieldBloc extends FormFieldBloc<String> {
  final String initialResult;
  final List<Validator> Function(String) validators;
  final List<QueryField> Function(String) queryFieldFromResult;
  final String Function(BuildContext) getLabel;

  FormTextFieldBloc({
    @required this.initialResult,
    @required this.validators,
    @required this.queryFieldFromResult,
    @required this.getLabel,
  }) : super(
          initialResult: initialResult,
          queryFieldFromResult: queryFieldFromResult,
          validators: validators,
          getLabel: getLabel,
        );
}
