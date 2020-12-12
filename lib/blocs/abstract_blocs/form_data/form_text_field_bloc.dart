import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:flutter/widgets.dart';

import 'form_option/form_field_bloc.dart';

class FormTextFieldBloc extends FormFieldBloc<String> {
  final String initialResult;
  final List<Validator> Function(String) validators;
  final String queryFieldName;
  final String Function(BuildContext) getLabel;

  FormTextFieldBloc({
    @required this.initialResult,
    @required this.validators,
    @required this.getLabel,
    @required this.queryFieldName,
  }) : super(
          initialResult: initialResult,
          queryFieldName: queryFieldName,
          validators: validators,
          getLabel: getLabel,
        );
}
