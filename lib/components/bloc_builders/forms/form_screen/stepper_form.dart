import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_field/form_field_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/forms/form_screen/form_field_aditional_info.dart';
import 'package:engineering_thesis/components/custom_widgets/stepper/custom_stepper.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './form_field_builder.dart' as form_field_builder;

class StepperForm extends StatelessWidget {
  final FormDataBloc formDataBloc;
  final Widget Function(BuildContext) buildApplyButton;

  StepperForm({@required this.formDataBloc, this.buildApplyButton});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              CustomStepper(
                steps: [
                  for (FormFieldBloc optionBloc in formDataBloc.formsData)
                    _buildStep(context, optionBloc),
                ],
              ),
              buildApplyButton(context),
              SizedBox(
                height: Dimensions.screenPadding,
              )
            ],
          ),
        ],
      ),
    );
  }

  Step _buildStep(context, FormFieldBloc optionBloc) {
    return Step(
      content: form_field_builder.FormFieldBuilder(
        formFieldBloc: optionBloc,
        formDataBloc: formDataBloc,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText.menuTitle(optionBloc.getLabel(context)),
          if (optionBloc.getDescription != null ||
              optionBloc.currentValidators.length > 0)
            FormFieldAdditionalInfo(optionBloc: optionBloc),
        ],
      ),
      state: optionBloc.isValid ? StepState.complete : StepState.error,
    );
  }
}
