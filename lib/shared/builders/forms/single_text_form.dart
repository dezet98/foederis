import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:engineering_thesis/shared/components/text_form_field/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleTextForm extends StatelessWidget {
  final FormFieldBloc singleTextFormBloc;

  SingleTextForm({@required this.singleTextFormBloc});

  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    textFieldController.text = singleTextFormBloc.result;

    return Column(
      children: [
        BlocBuilder(
          cubit: singleTextFormBloc,
          builder: (context, state) {
            return CustomText(
              singleTextFormBloc.getLabel(context),
              textType: singleTextFormBloc.isValid
                  ? TextType.valid_form_title
                  : TextType.invalid_form_title,
              alignment: Alignment.centerLeft,
            );
          },
        ),
        CustomTextFormField(
          textEditingController: textFieldController,
          onChamged: (String text) {
            singleTextFormBloc.add(FormFieldChangeOptionEvent(result: text));
          },
        )
      ],
    );
  }
}
