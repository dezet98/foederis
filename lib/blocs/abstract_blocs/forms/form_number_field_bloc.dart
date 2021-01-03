import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../models/collections/query_field.dart';
import 'form_field/form_field_bloc.dart';

class FormNumberFieldBloc extends FormFieldBloc<int> {
  final int initialResult;
  final List<Validator> Function(int) validators;
  final List<QueryField> Function(int) queryFieldFromResult;
  final String Function(BuildContext) getLabel;
  final String Function(BuildContext) getDescription;
  FormNumberFieldBloc({
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
