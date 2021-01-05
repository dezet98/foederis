import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/utils/query_field.dart';
import '../fetch/fetch_bloc.dart';
import 'form_field/form_field_bloc.dart';

class FormOptionListFieldBloc<OptionType> extends FormFieldBloc<OptionType> {
  final FetchBloc listOptionFetchingBloc; //todo
  final List<OptionType> listOption;
  final OptionType initialResult;
  final String Function(BuildContext, dynamic) getLabelFromOption;
  List<Validator> Function(OptionType) validators;
  final List<QueryField> Function(OptionType) queryFieldFromResult;
  String Function(BuildContext) getLabel;
  final String Function(BuildContext) getDescription;
  FormOptionListFieldBloc({
    this.listOptionFetchingBloc,
    this.listOption,
    this.initialResult,
    this.getDescription,
    @required this.getLabelFromOption,
    @required this.getLabel,
    @required this.validators,
    @required this.queryFieldFromResult,
  }) : super(
          initialResult: initialResult,
          getLabel: getLabel,
          queryFieldFromResult: queryFieldFromResult,
          validators: validators,
          getDescription: getDescription,
        );
}
