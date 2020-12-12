import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import 'form_option/form_field_bloc.dart';

class FormNumberFieldBloc extends FormFieldBloc<int> {
  final int initialResult;
  final List<Validator> Function(int) validators;
  final String queryFieldName;
  final String Function(BuildContext) getLabel;

  FormNumberFieldBloc({
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
