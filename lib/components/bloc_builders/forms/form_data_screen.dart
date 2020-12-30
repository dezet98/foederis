import 'package:engineering_thesis/blocs/abstract_blocs/forms/form_photo_field_bloc.dart';
import 'package:engineering_thesis/blocs/abstract_blocs/send/send_bloc.dart';
import 'package:engineering_thesis/components/custom_widgets/icon/custom_icon.dart';
import 'package:engineering_thesis/shared/routing.dart';
import 'package:engineering_thesis/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/abstract_blocs/forms/form_address_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_check_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_data/form_data_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_date_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_field/form_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_number_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_number_range_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_option_list_field_bloc.dart';
import '../../../blocs/abstract_blocs/forms/form_text_field_bloc.dart';
import '../../custom_widgets/app_bars/custom_app_bar.dart';
import '../../custom_widgets/buttons/custom_button.dart';
import '../../custom_widgets/snack_bar.dart/custom_snack_bar.dart';
import '../../templates/template_screen.dart';
import 'form_address_field.dart';
import 'form_check_field.dart';
import 'form_date_field.dart';
import 'form_number_field.dart';
import 'form_number_range_field.dart';
import 'form_option_list_field.dart';
import 'form_photo_field.dart';
import 'form_text_field.dart';

class FormDataScreen extends StatelessWidget {
  final FormDataBloc formDataBloc;
  final String formAppBarTitle;
  final String formNextButtonText;
  final SendBloc sendBloc;
  final Function afterSuccess;

  FormDataScreen({
    @required this.formDataBloc,
    @required this.formNextButtonText,
    @required this.sendBloc,
    this.formAppBarTitle,
    this.afterSuccess,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: sendBloc,
      listener: sendBlocListener,
      child: formAppBarTitle == null
          ? Padding(
              padding: const EdgeInsets.all(Dimensions.screenPadding),
              child: _buildForm(context),
            )
          : TemplateScreen(
              platformAppBar: _buildAppBar(context),
              body: _buildForm(context),
            ),
    );
  }

  Widget _buildForm(context) {
    return Form(
      child: SingleChildScrollView(
        child: Expanded(
          child: Column(
            children: [
              for (FormFieldBloc optionBloc in formDataBloc.formsData)
                _buildSingleForm(optionBloc),
              _buildApplyButton(context),
            ],
          ),
        ),
      ),
    );
  }

  void sendBlocListener(BuildContext context, dynamic state) {
    if (state is SendDataFailureState) {
      formDataBloc.add(FormDataEditingEnabledEvent());
      CustomSnackBar.showErrorSnackBar(context,
          message: state.sendingDataException.toString());
    } else if (state is SendDataSuccessState) {
      formDataBloc.add(FormDataClearEvent());
      formDataBloc.add(FormDataEditingEnabledEvent());
      if (afterSuccess == null)
        Routing.pop(context);
      else
        afterSuccess();
      CustomSnackBar.showInfoSnackBar(context, message: 'Success');
    } else if (state is SendDataInProgressState) {
      formDataBloc.add(FormDataEditingDisableEvent());
    }
  }

  Widget _buildApplyButton(BuildContext context) {
    return BlocBuilder(
      cubit: sendBloc,
      builder: (context, state) {
        if (state is SendDataInProgressState) {
          return CustomButton.loadingButton();
        }

        return BlocBuilder(
          cubit: formDataBloc,
          builder: (context, state) {
            return CustomButton.goToOtherScreen(
              text: formNextButtonText,
              enabled: formDataBloc.isValid,
              onPressed: () {
                sendBloc.add(
                  SendDataEvent(valuesMap: formDataBloc.queryFields()),
                );
              },
            );
          },
        );
      },
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      customIcon: CustomIcon.closeScreen(context),
      title: formAppBarTitle,
      trailingActions: [
        CustomButton.goToOtherScreen(
            text: 'Clear',
            onPressed: () {
              formDataBloc.add(FormDataClearEvent());
            })
      ],
    );
  }

  Widget _buildSingleForm(FormFieldBloc optionBloc) {
    if (optionBloc is FormTextFieldBloc)
      return FormTextField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    else if (optionBloc is FormCheckFieldBloc) {
      return FormCheckField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormDateFieldBloc) {
      return FormDateField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormNumberFieldBloc) {
      return FormNumberField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormOptionListFieldBloc) {
      return FormOptionListField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormAddressFieldBloc) {
      return FormAddressField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormNumberRangeFieldBloc) {
      return FormNumberRangeField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    } else if (optionBloc is FormPhotoFieldBloc) {
      return FormPhotoField(
          formFieldBloc: optionBloc, formDataBloc: formDataBloc);
    }
    assert(false, "{ error: optionBloc not provided }");
    return Container();
  }
}
