import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_field/form_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/validators/validator.dart';
import 'package:engineering_thesis/components/custom_widgets/buttons/custom_button.dart';
import 'package:engineering_thesis/components/custom_widgets/dialog/custom_modal.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/components/custom_widgets/text/cutom_text.dart';
import 'package:engineering_thesis/generated/l10n.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/material.dart';

class FormFieldAdditionalInfo extends StatelessWidget {
  final FormFieldBloc optionBloc;

  FormFieldAdditionalInfo({@required this.optionBloc});

  @override
  Widget build(BuildContext context) {
    return CustomButton.iconButton(
      customIcon: CustomIcon.info,
      onPressed: () async {
        await CustomDialog.showModal(context,
            title: S
                .of(context)
                .form_field_info_dialog_title(optionBloc.getLabel(context)),
            content: Wrap(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (optionBloc.getDescription != null) description(context),
                    SizedBox(height: Dimensions.gutterMedium),
                    if (optionBloc.currentValidators.length > 0)
                      validation(context),
                  ],
                )
              ],
            ));
      },
    );
  }

  Widget description(context) => Column(
        children: [
          CustomText.menuTitle(S.of(context).form_field_info_additional_info),
          CustomText.bodyText(optionBloc.getDescription(context)),
        ],
      );

  Widget validation(context) => Column(
        children: [
          CustomText.menuTitle(
              S.of(context).form_field_info_additional_validation),
          for (Validator v in optionBloc.currentValidators)
            CustomText.bodyText(v.validatorInfo(context))
        ],
      );
}
