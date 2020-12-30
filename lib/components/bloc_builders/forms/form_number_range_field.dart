import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_field/form_field_bloc.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/components/custom_widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_number_range_field_bloc.dart';

class FormNumberRangeField extends StatelessWidget {
  final FormNumberRangeFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  FormNumberRangeField(
      {@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> textFieldControllers = _getInitResults;

    return Column(
      children: [
        BlocConsumer(
          cubit: formFieldBloc,
          listener: (context, state) {
            if (state is FormFieldClearedState) {
              textFieldControllers = _getInitResults;
            }
          },
          builder: (context, state) {
            return formFieldBloc.isValid
                ? CustomText.validFormTitle(
                    formFieldBloc.getLabel(context),
                  )
                : CustomText.invalidFormTitle(
                    formFieldBloc.getLabel(context),
                  );
          },
        ),
        BlocBuilder(
            cubit: formDataBloc,
            builder: (context, state) {
              return Column(
                children: [
                  for (int i = 0; i < formFieldBloc.result.length; i++)
                    CustomTextFormField.digits(
                      textEditingController: textFieldControllers[i],
                      enabled: formFieldBloc.editingEnabled,
                      onChamged: (String fieldResult) {
                        List<int> newResult = formFieldBloc.result;
                        newResult[i] =
                            int.parse(fieldResult.isEmpty ? '0' : fieldResult);
                        if (formFieldBloc.editingEnabled)
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

  List<TextEditingController> get _getInitResults {
    return [
      for (int i = 0; i < formFieldBloc.result.length; i++)
        TextEditingController(text: formFieldBloc.result[i].toString()),
    ];
  }
}
