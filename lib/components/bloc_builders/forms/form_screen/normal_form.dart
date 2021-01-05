import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_field/form_field_bloc.dart';
import 'package:engineering_thesis/components/bloc_builders/forms/form_screen/form_field_aditional_info.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/shared/view/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import './form_field_builder.dart' as form_field_builder;

class NormalForm extends StatelessWidget {
  final FormDataBloc formDataBloc;
  final Widget Function(BuildContext) buildApplyButton;

  NormalForm({@required this.formDataBloc, this.buildApplyButton});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(Dimensions.screenPadding),
      child: Stack(
        children: [
          Column(
            children: [
              for (FormFieldBloc optionBloc in formDataBloc.formsData)
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        optionBloc.isValid
                            ? CustomText.menuTitle(optionBloc.getLabel(context))
                            : CustomText.invalidFormTitle(
                                optionBloc.getLabel(context)),
                        if (optionBloc.getDescription != null ||
                            optionBloc.currentValidators.length > 0)
                          FormFieldAdditionalInfo(optionBloc: optionBloc),
                      ],
                    ),
                    form_field_builder.FormFieldBuilder(
                      formFieldBloc: optionBloc,
                      formDataBloc: formDataBloc,
                    ),
                    SizedBox(
                      height: Dimensions.screenPadding,
                    )
                  ],
                ),
              buildApplyButton(context),
            ],
          ),
        ],
      ),
    );
  }
}
