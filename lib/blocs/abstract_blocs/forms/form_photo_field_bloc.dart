import 'dart:io';

import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:flutter/widgets.dart';

import '../../../models/collections/query_field.dart';
import 'form_field/form_field_bloc.dart';

class FormPhotoFieldBloc extends FormFieldBloc<File> {
  final File initialResult;
  final List<Validator> Function(File) validators;
  final List<QueryField> Function(File) queryFieldFromResult;
  final String Function(BuildContext) getLabel;

  FormPhotoFieldBloc({
    @required this.initialResult,
    @required this.validators,
    @required this.queryFieldFromResult,
    @required this.getLabel,
  }) : super(
          initialResult: initialResult,
          queryFieldFromResult: queryFieldFromResult,
          validators: validators,
          getLabel: getLabel,
        );
}
