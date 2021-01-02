import 'package:engineering_thesis/components/custom_widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_number_field_bloc.dart';

class FormNumberField extends StatelessWidget {
  final FormNumberFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  final TextEditingController textFieldController = TextEditingController();

  FormNumberField({@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    textFieldController.text = formFieldBloc.result.toString();

    return BlocBuilder(
        cubit: formDataBloc,
        builder: (context, state) {
          return CustomTextFormField.digits(
            textEditingController: textFieldController,
            enabled: formFieldBloc.editingEnabled,
            onChamged: (String result) {
              if (formFieldBloc.editingEnabled)
                formDataBloc.add(FormDataEditingEvent(
                  formFieldBloc: formFieldBloc,
                  result: int.parse(result.isEmpty ? '0' : result),
                ));
            },
          );
        });
  }
}
