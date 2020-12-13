import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_number_range_field_bloc.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:engineering_thesis/shared/components/text_form_field/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormNumberRangeField extends StatelessWidget {
  final FormNumberRangeFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  FormNumberRangeField(
      {@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    final List<TextEditingController> textFieldControllers = [
      for (int i = 0; i < formFieldBloc.result.length; i++)
        TextEditingController(text: formFieldBloc.result[i].toString()),
    ];

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
              return Column(
                children: [
                  for (int i = 0; i < formFieldBloc.result.length; i++)
                    CustomTextFormField(
                      textEditingController: textFieldControllers[i],
                      textFormType: TextFormType.digits,
                      enabled: formDataBloc.editingEnabled,
                      onChamged: (String fieldResult) {
                        List<int> newResult = formFieldBloc.result;
                        newResult[i] =
                            int.parse(fieldResult.isEmpty ? '0' : fieldResult);
                        if (formDataBloc.editingEnabled)
                          formDataBloc.add(FormDataEditingEvent(
                            formFieldBloc: formFieldBloc,
                            result: newResult,
                          ));
                      },
                    ),
                ],
              );
            }),
      ],
    );
  }
}
