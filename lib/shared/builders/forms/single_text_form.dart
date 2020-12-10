import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:engineering_thesis/shared/components/text_form_field/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleTextForm extends StatelessWidget {
  final FormFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  SingleTextForm({@required this.formFieldBloc, @required this.formDataBloc});

  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textFieldController.text = formFieldBloc.result;

    return Column(
      children: [
        BlocBuilder(
          cubit: formFieldBloc,
          builder: (context, state) {
            return CustomText(
              formFieldBloc.getLabel(context),
              textType: formFieldBloc.isValid
                  ? TextType.valid_form_title
                  : TextType.invalid_form_title,
              alignment: Alignment.centerLeft,
            );
          },
        ),
        BlocBuilder(
            cubit: formDataBloc,
            builder: (context, state) {
              return CustomTextFormField(
                textEditingController: textFieldController,
                enabled: formDataBloc.editingEnabled,
                onChamged: (String text) {
                  if (formDataBloc.editingEnabled)
                    formDataBloc.add(
                      FormDataEditingEvent(
                          formFieldBloc: formFieldBloc, result: text),
                    );
                },
              );
            }),
      ],
    );
  }
}
