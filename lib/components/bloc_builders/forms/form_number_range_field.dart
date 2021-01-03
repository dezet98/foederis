import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_field/form_field_bloc.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
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

    return BlocListener(
      cubit: formFieldBloc,
      listener: (context, state) {
        if (state is FormFieldClearedState) {
          textFieldControllers = _getInitResults;
        }
      },
      child: BlocBuilder(
          cubit: formDataBloc,
          builder: (context, state) {
            return Column(
              children: [
                RangeSlider(
                    min: 0.0,
                    max: 100.0,
                    values: RangeValues(
                      double.parse(textFieldControllers[0].text),
                      double.parse(textFieldControllers[1].text),
                    ),
                    onChanged: (RangeValues result) {
                      List<int> newResult = formFieldBloc.result;
                      newResult[0] = result.start.toInt();
                      newResult[1] = result.end.toInt();

                      if (formFieldBloc.editingEnabled)
                        formDataBloc.add(FormDataEditingEvent(
                          formFieldBloc: formFieldBloc,
                          result: newResult,
                        ));
                    }),
                CustomText.chipLabel(
                    '${textFieldControllers[0].text} - ${textFieldControllers[1].text}'),
              ],
            );
          }),
    );
  }

  List<TextEditingController> get _getInitResults {
    return [
      for (int i = 0; i < formFieldBloc.result.length; i++)
        TextEditingController(text: formFieldBloc.result[i].toString()),
    ];
  }
}
