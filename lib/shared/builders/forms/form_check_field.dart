import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_check_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/shared/components/switch/custom_switch.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormCheckField extends StatelessWidget {
  final FormCheckFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  FormCheckField({@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder(
          cubit: formFieldBloc,
          builder: (context, state) {
            return Row(
              children: [
                CustomText(
                  formFieldBloc.getLabel(context),
                  textType: TextType.valid_form_title,
                  alignment: Alignment.centerLeft,
                ),
                CustomSwitch(
                  value: formFieldBloc.result,
                  enabled: formDataBloc.editingEnabled,
                  onChanged: (bool result) {
                    if (formDataBloc.editingEnabled)
                      formDataBloc.add(
                        FormDataEditingEvent(
                            formFieldBloc: formFieldBloc, result: result),
                      );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
