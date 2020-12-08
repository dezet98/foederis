import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:engineering_thesis/shared/components/text_form_field/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleNumberForm extends StatelessWidget {
  final FormFieldBloc singleNumberFormBloc;

  final TextEditingController textFieldController = TextEditingController();

  SingleNumberForm({@required this.singleNumberFormBloc});

  @override
  Widget build(BuildContext context) {
    textFieldController.text = singleNumberFormBloc.result.toString();

    return Column(
      children: [
        BlocBuilder(
          cubit: singleNumberFormBloc,
          builder: (context, state) {
            return CustomText(
              singleNumberFormBloc.getLabel(context),
              textType: singleNumberFormBloc.isValid
                  ? TextType.valid_form_title
                  : TextType.invalid_form_title,
              alignment: Alignment.centerLeft,
            );
          },
        ),
        CustomTextFormField(
          textEditingController: textFieldController,
          textFormType: TextFormType.digits,
          onChamged: (String result) {
            singleNumberFormBloc.add(FormFieldChangeOptionEvent(
              result: int.parse(result.isEmpty ? '0' : result),
            ));
          },
        ),
      ],
    );
  }
}
