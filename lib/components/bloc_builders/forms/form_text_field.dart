import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_field/form_field_bloc.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/components/custom_widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_text_field_bloc.dart';

class FormTextField extends StatelessWidget {
  final FormTextFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  FormTextField({@required this.formFieldBloc, @required this.formDataBloc});

  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textFieldController.text = formFieldBloc.result;

    return BlocConsumer(
      cubit: formFieldBloc,
      listener: (context, state) {
        if (state is FormFieldClearedState) {
          textFieldController.text = formFieldBloc.result;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            formFieldBloc.isValid
                ? CustomText.validFormTitle(
                    formFieldBloc.getLabel(context),
                  )
                : CustomText.invalidFormTitle(
                    formFieldBloc.getLabel(context),
                  ),
            CustomTextFormField.normal(
              textEditingController: textFieldController,
              enabled: formFieldBloc.editingEnabled,
              onChamged: (String text) {
                if (formFieldBloc.editingEnabled)
                  formDataBloc.add(
                    FormDataEditingEvent(
                      formFieldBloc: formFieldBloc,
                      result: text,
                    ),
                  );
              },
            )
          ],
        );
      },
    );
  }
}
