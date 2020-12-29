import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../../../models/collections/query_field.dart';
import '../../../models/geolocation.dart';
import 'form_field/form_field_bloc.dart';

class FormAddressFieldBloc extends FormFieldBloc<Geolocation> {
  final Geolocation initialResult;
  final List<Validator> Function(Geolocation) validators;
  final List<QueryField> Function(Geolocation) queryFieldFromResult;
  final String Function(BuildContext) getLabel;

  FormAddressFieldBloc({
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
