import 'package:engineering_thesis/components/custom_widgets/date_time_picker/custom_date_time_picker.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_date_field_bloc.dart';

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
                formFieldBloc.isValid
                    ? CustomText.validFormTitle(
                        formFieldBloc.getLabel(context),
                      )
                    : CustomText.invalidFormTitle(
                        formFieldBloc.getLabel(context),
                      ),
                BlocBuilder(
                  cubit: formDataBloc,
                  builder: (context, state) {
                    return CustomDateTimePicker(
                      date: formFieldBloc.result,
                      enabled: formFieldBloc.editingEnabled,
                      dateChanged: (DateTime result) {
                        if (formFieldBloc.editingEnabled)
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
