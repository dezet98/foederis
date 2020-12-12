import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/form_data/form_date_field_bloc.dart';
import 'package:engineering_thesis/shared/components/date_time_picker/custom_date_time_picker.dart';
import 'package:engineering_thesis/shared/components/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FormDateField extends StatelessWidget {
  final FormDateFieldBloc formFieldBloc;
  final FormDataBloc formDataBloc;

  FormDateField({@required this.formFieldBloc, @required this.formDataBloc});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder(
          cubit: formFieldBloc,
          builder: (context, state) {
            return Column(
              children: [
                CustomText(
                  formFieldBloc.getLabel(context),
                  textType: formFieldBloc.isValid
                      ? TextType.valid_form_title
                      : TextType.invalid_form_title,
                  alignment: Alignment.centerLeft,
                ),
                BlocBuilder(
                  cubit: formDataBloc,
                  builder: (context, state) {
                    return CustomDateTimePicker(
                      date: formFieldBloc.result,
                      enabled: formDataBloc.editingEnabled,
                      dateChanged: (DateTime result) {
                        if (formDataBloc.editingEnabled)
                          formDataBloc.add(
                            FormDataEditingEvent(
                                formFieldBloc: formFieldBloc, result: result),
                          );
                      },
                      maxDate: formFieldBloc.maxDate,
                      minDate: formFieldBloc.minxDate,
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
