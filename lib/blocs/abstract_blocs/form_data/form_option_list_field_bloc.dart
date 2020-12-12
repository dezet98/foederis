import 'package:engineering_thesis/blocs/abstract_blocs/fetch/fetch_bloc.dart';
import 'package:engineering_thesis/shared/utils/validators.dart';
import 'package:flutter/cupertino.dart';

import 'form_option/form_field_bloc.dart';

class FormOptionListFieldBloc<OptionType, ResultType>
    extends FormFieldBloc<OptionType> {
  final FetchBloc<List<OptionType>> listOptionFetchingBloc;
  final ResultType Function(OptionType) getResultFromOption;
  final String Function(dynamic) getLabelFromOption;
  List<Validator> Function(OptionType) validators;
  String queryFieldName;
  String Function(BuildContext) getLabel;

  FormOptionListFieldBloc({
    @required this.listOptionFetchingBloc,
    @required this.getLabelFromOption,
    @required this.getLabel,
    @required this.validators,
    @required this.queryFieldName,
    @required this.getResultFromOption,
  }) : super(
          initialResult: null,
          getLabel: getLabel,
          queryFieldName: queryFieldName,
          validators: validators,
        );
}
