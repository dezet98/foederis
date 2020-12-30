import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/abstract_blocs/forms/form_check_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../custom_widgets/switch/custom_switch.dart';
import '../../custom_widgets/text/cutom_text.dart';

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
                CustomText.validFormTitle(
                  formFieldBloc.getLabel(context),
                ),
                CustomSwitch(
                  value: formFieldBloc.result,
                  enabled: formFieldBloc.editingEnabled,
                  onChanged: (bool result) {
                    if (formFieldBloc.editingEnabled)
                      formDataBloc.add(
                        FormDataEditingEvent(
                          formFieldBloc: formFieldBloc,
                          result: result,
                        ),
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
