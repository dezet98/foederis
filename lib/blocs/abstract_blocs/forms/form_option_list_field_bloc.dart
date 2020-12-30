import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:flutter/cupertino.dart';

import '../../../models/collections/query_field.dart';
import '../fetch/fetch_bloc.dart';
import 'form_field/form_field_bloc.dart';

class FormOptionListFieldBloc<OptionType> extends FormFieldBloc<OptionType> {
  final FetchBloc listOptionFetchingBloc; //todo
  final List<OptionType> listOption;
  final String Function(dynamic) getLabelFromOption;
  List<Validator> Function(OptionType) validators;
  final List<QueryField> Function(OptionType) queryFieldFromResult;
  String Function(BuildContext) getLabel;

  FormOptionListFieldBloc({
    this.listOptionFetchingBloc,
    this.listOption,
    @required this.getLabelFromOption,
    @required this.getLabel,
    @required this.validators,
    @required this.queryFieldFromResult,
  }) : super(
          initialResult: null,
          getLabel: getLabel,
          queryFieldFromResult: queryFieldFromResult,
          validators: validators,
        );
}
