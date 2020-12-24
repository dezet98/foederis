import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../models/collections/query_field.dart';
import '../../../shared/utils/validators.dart';
import 'form_field/form_field_bloc.dart';

class FormNumberRangeFieldBloc extends FormFieldBloc<List<int>> {
  final List<int> initialResult;
  final List<Validator> Function(List<int>) validators;
  final List<QueryField> Function(List<int>) queryFieldFromResult;
  final String Function(BuildContext) getLabel;

  FormNumberRangeFieldBloc({
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
