import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:engineering_thesis/blocs/specific_blocs/validators/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../models/collections/query_field.dart';
import 'form_field/form_field_bloc.dart';

class FormDateFieldBloc extends FormFieldBloc<DateTime> {
  final DateTime initialResult;
  final List<Validator> Function(DateTime) validators;
  final List<QueryField> Function(DateTime) queryFieldFromResult;
  final String Function(BuildContext) getLabel;
  final String Function(BuildContext) getDescription;
  final bool withHour;

  FormDateFieldBloc({
    this.initialResult,
    @required this.validators,
    @required this.getLabel,
    @required this.queryFieldFromResult,
    this.getDescription,
    this.withHour = true,
  }) : super(
          initialResult: initialResult,
          queryFieldFromResult: queryFieldFromResult,
          validators: validators,
          getLabel: getLabel,
          getDescription: getDescription,
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
