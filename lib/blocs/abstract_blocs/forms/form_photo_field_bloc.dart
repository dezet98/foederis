import 'dart:io';

import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:engineering_thesis/data/models/utils/query_field.dart';
import 'package:flutter/widgets.dart';

import 'form_field/form_field_bloc.dart';

class FormPhotoFieldBloc extends FormFieldBloc<File> {
  final File initialResult;
  final String initialPhotoUrl;
  final List<Validator> Function(File) validators;
  final List<QueryField> Function(File) queryFieldFromResult;
  final String Function(BuildContext) getLabel;
  final String Function(BuildContext) getDescription;

  FormPhotoFieldBloc(
      {@required this.initialResult,
      @required this.initialPhotoUrl,
      @required this.validators,
      @required this.queryFieldFromResult,
      @required this.getLabel,
      this.getDescription})
      : super(
          initialResult: initialResult,
          queryFieldFromResult: queryFieldFromResult,
          validators: validators,
          getLabel: getLabel,
          getDescription: getDescription,
        );
}
