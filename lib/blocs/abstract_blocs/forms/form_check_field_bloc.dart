import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../models/collections/query_field.dart';
import '../../../shared/utils/validators.dart';
import 'form_field/form_field_bloc.dart';

class FormCheckFieldBloc extends FormFieldBloc<bool> {
  final bool initialResult;
  final List<Validator> Function(bool) validators;
  final List<QueryField> Function(bool) queryFieldFromResult;
  final String Function(BuildContext) getLabel;

  FormCheckFieldBloc({
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
