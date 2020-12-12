import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

class FormCheckFieldBloc extends FormFieldBloc<bool> {
  final bool initialResult;
  final List<Validator> Function(bool) validators;
  final String queryFieldName;
  final String Function(BuildContext) getLabel;

  FormCheckFieldBloc({
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
