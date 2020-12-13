import 'package:engineering_thesis/models/collections/query_field.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'form_field/form_field_bloc.dart';

class FormNumberFieldBloc extends FormFieldBloc<int> {
  final int initialResult;
  final List<Validator> Function(int) validators;
  final List<QueryField> Function(int) queryFieldFromResult;
  final String Function(BuildContext) getLabel;

  FormNumberFieldBloc({
    @required this.initialResult,
    @required this.validators,
    @required this.getLabel,
    @required this.queryFieldFromResult,
  }) : super(
          initialResult: initialResult,
          queryFieldFromResult: queryFieldFromResult,
          validators: validators,
          getLabel: getLabel,
        );
}
