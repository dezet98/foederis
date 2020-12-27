import 'package:flutter/cupertino.dart';

import '../../../models/collections/query_field.dart';
import '../../../shared/utils/validators.dart';
import '../fetch/fetch_bloc.dart';
import 'form_field/form_field_bloc.dart';

class FormOptionListFieldBloc<OptionType> extends FormFieldBloc<OptionType> {
  final FetchBloc<List<OptionType>> listOptionFetchingBloc;
  final String Function(dynamic) getLabelFromOption;
  List<Validator> Function(OptionType) validators;
  final List<QueryField> Function(OptionType) queryFieldFromResult;
  String Function(BuildContext) getLabel;

  FormOptionListFieldBloc({
    @required this.listOptionFetchingBloc,
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