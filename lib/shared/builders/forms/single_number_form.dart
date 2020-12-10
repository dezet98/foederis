import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:engineering_thesis/shared/components/text_form_field/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleNumberForm extends StatelessWidget {
  final FormFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  final TextEditingController textFieldController = TextEditingController();

  SingleNumberForm({@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    textFieldController.text = formFieldBloc.result.toString();

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
                textFormType: TextFormType.digits,
                enabled: formDataBloc.editingEnabled,
                onChamged: (String result) {
                  if (formDataBloc.editingEnabled)
                    formDataBloc.add(FormDataEditingEvent(
                      formFieldBloc: formFieldBloc,
                      result: int.parse(result.isEmpty ? '0' : result),
                    ));
                },
              );
            }),
      ],
    );
  }
}
