import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/shared/components/switch/custom_switch.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleCheckForm extends StatelessWidget {
  final FormFieldBloc singleCheckFormBloc;

  SingleCheckForm({@required this.singleCheckFormBloc});

  final TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder(
          cubit: singleCheckFormBloc,
          builder: (context, state) {
            return Row(
              children: [
                CustomText(
                  singleCheckFormBloc.getLabel(context),
                  textType: TextType.valid_form_title,
                  alignment: Alignment.centerLeft,
                ),
                CustomSwitch(
                  value: singleCheckFormBloc.result,
                  onChanged: (bool result) {
                    singleCheckFormBloc
                        .add(FormFieldChangeOptionEvent(result: result));
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
