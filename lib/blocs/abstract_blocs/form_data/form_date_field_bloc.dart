import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class FormDateFieldBloc extends FormFieldBloc<DateTime> {
  final DateTime initialResult;
  final List<Validator> Function(DateTime) validators;
  final String queryFieldName;
  final String Function(BuildContext) getLabel;

  FormDateFieldBloc({
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

  DateTime get maxDate => (validators(null)
              .firstWhere((element) => element is DateTimeRangeValidator)
          as DateTimeRangeValidator)
      .maxDate;

  DateTime get minxDate => (validators(null)
              .firstWhere((element) => element is DateTimeRangeValidator)
          as DateTimeRangeValidator)
      .minDate;
}
