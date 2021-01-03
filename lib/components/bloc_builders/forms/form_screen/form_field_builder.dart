import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_address_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_check_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_date_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_field/form_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_number_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_number_range_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_option_list_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_photo_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_text_field_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/forms/form_check_field.dart';
import 'package:flutter/material.dart';

import '../form_address_field.dart';
import '../form_date_field.dart';
import '../form_number_field.dart';
import '../form_number_range_field.dart';
import '../form_option_list_field.dart';
import '../form_photo_field.dart';
import '../form_text_field.dart';

class FormFieldBuilder extends StatelessWidget {
  final FormFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  FormFieldBuilder({@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    return _getFormField(formFieldBloc, formDataBloc);
  }

  Widget _getFormField(FormFieldBloc optionBloc, FormDataBloc formDataBloc) {
    if (optionBloc is FormTextFieldBloc)
      return FormTextField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    else if (optionBloc is FormCheckFieldBloc) {
      return FormCheckField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormDateFieldBloc) {
      return FormDateField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormNumberFieldBloc) {
      return FormNumberField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormOptionListFieldBloc) {
      return FormOptionListField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormAddressFieldBloc) {
      return FormAddressField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormNumberRangeFieldBloc) {
      return FormNumberRangeField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormPhotoFieldBloc) {
      return FormPhotoField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    }
    assert(false, "{ error: optionBloc not provided }");
    return Container();
  }
}
