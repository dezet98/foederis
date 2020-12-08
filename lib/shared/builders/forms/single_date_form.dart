import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_option/form_field_bloc.dart';
import 'package:engineering_thesis/shared/components/date_time_picker/custom_date_time_picker.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SingleDateForm extends StatelessWidget {
  final FormFieldBloc singleDataFormBloc;

  SingleDateForm({@required this.singleDataFormBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder(
          cubit: singleDataFormBloc,
          builder: (context, state) {
            return Column(
              children: [
                CustomText(
                  singleDataFormBloc.getLabel(context),
                  textType: singleDataFormBloc.isValid
                      ? TextType.valid_form_title
                      : TextType.invalid_form_title,
                  alignment: Alignment.centerLeft,
                ),
                CustomDateTimePicker(
                  date: singleDataFormBloc.result,
                  dateChanged: (DateTime result) {
                    singleDataFormBloc
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
